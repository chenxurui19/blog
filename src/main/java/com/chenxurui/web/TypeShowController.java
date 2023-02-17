package com.chenxurui.web;

import com.chenxurui.pojo.Blog;
import com.chenxurui.pojo.Type;
import com.chenxurui.service.BlogService;
import com.chenxurui.service.TypeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class TypeShowController {

    @Autowired
    private TypeService typeService;

    @Autowired
    private BlogService blogService;

    @GetMapping("/types/{id}")
    public String types(@RequestParam(value = "pageNum", defaultValue = "1", required = false) Integer pageNum, @PathVariable("id") Long id, Model model) {
        List<Type> types = typeService.getAllType();

        if (id == -1) {
            id = types.get(0).getId();
        }

        for (Type type : types) {
            type.setBlogs(blogService.getBlogByTypeId(type.getId()));
        }
        PageHelper.startPage(pageNum, 5);
        List<Blog> blogs = blogService.getBlogByTypeId(id);
        PageInfo pageInfo = new PageInfo<>(blogs);
        model.addAttribute("types", types);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("activeTypeId", id);

        return "types";
    }
}
