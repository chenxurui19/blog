package com.chenxurui.web;

import com.chenxurui.pojo.*;
import com.chenxurui.service.BlogService;
import com.chenxurui.service.TagService;
import com.chenxurui.service.TypeService;
import com.chenxurui.service.VisitorService;
import com.chenxurui.util.IpToAddressUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private BlogService blogService;

    @Autowired
    private TypeService typeService;

    @Autowired
    private TagService tagService;

    @Autowired
    private VisitorService visitorService;

    @GetMapping("/")
    public String index(@RequestParam(value = "pageNum", defaultValue = "1", required = false) Integer pageNum, Model model, HttpServletRequest request, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            System.out.println("session的用户为空，是访问者");
            //访问者实例
            Visitor visitor = new Visitor();
            //获取访问者ip
            visitor.setIp(request.getRemoteAddr());
            //获取访问者地区
            visitor.setAddress(IpToAddressUtil.getCityInfo(visitor.getIp()));
            visitor.setAccessTime(new Date());
            visitorService.saveVisitor(visitor);
        } else {
            System.out.println("是管理员啦！！！");
        }

        //获取访问者的数量
        int visitorNum = visitorService.getAllVisitorNum();
        //获取所有分类的数量
        int typeNum = typeService.getAllTypeNum();
        //获取所有标签的数量
        int tagNum = tagService.getAllTagNum();

        //获取前5条分类
        List<Type> types = typeService.getAllType(1);
        for (Type type : types) {
            type.setBlogs(blogService.getBlogByTypeId(type.getId()));
        }

        //获取前9条标签
        List<Tag> tags = tagService.getAllTag(1);
        for (Tag tag : tags) {
            tag.setBlogs(blogService.getBlogByTagId(tag.getId()));
        }
        List<Blog> recommendBlogs = blogService.getRecommendBlog(1);
        PageHelper.startPage(pageNum, 6);
        //前台获取博客
        List<Blog> blogs = blogService.getIndexBlog();
        PageInfo pageInfo = new PageInfo<>(blogs, 6);

        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("types", types);
        model.addAttribute("tags", tags);
        model.addAttribute("recommendBlogs", recommendBlogs);
        model.addAttribute("typeNum", typeNum);
        model.addAttribute("tagNum", tagNum);
        model.addAttribute("visitorNum", visitorNum);
        return "index";
    }

    @PostMapping("/search")
    public String search(@RequestParam(value = "pageNum", defaultValue = "1", required = false) Integer pageNum, @RequestParam String query, Model model) {
        PageHelper.startPage(pageNum, 6);
        List<Blog> blogs = blogService.searchIndexBlog(query);
        PageInfo pageInfo = new PageInfo<>(blogs);

        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("query", query);
        return "search";
    }

    @GetMapping("/blog/{id}")
    public String blog(@PathVariable Long id, Model model) {
        Blog blog=blogService.getDetailedBlog(id);
        model.addAttribute("blog", blog);
        return "blog";
    }

    @GetMapping("/footer/newblog")
    public String newblogs(Model model) {
        PageHelper.startPage(1, 3);
        model.addAttribute("newblogs", blogService.getRecommendBlog());
        return "_fragments :: newblogList";
    }
}
