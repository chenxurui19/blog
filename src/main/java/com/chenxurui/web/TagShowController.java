package com.chenxurui.web;

import com.chenxurui.pojo.Blog;
import com.chenxurui.pojo.Tag;
import com.chenxurui.service.BlogService;
import com.chenxurui.service.TagService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
public class TagShowController {

    @Autowired
    private TagService tagService;

    @Autowired
    private BlogService blogService;

    @GetMapping("/tags/{id}")
    public String tags(@RequestParam(value = "pageNum", defaultValue = "1", required = false) Integer pageNum, @PathVariable("id") Long id, Model model) {
        //获取所有标签
        List<Tag> tags=tagService.getAllTag();
        if (id == -1) {
            id = tags.get(0).getId();
        }
        PageHelper.startPage(pageNum,5);
        List<Blog> blogs=blogService.getBlogByTagId(id);
        int n = 0;
        for (Blog blog : blogs) {
            List<String> asList1 =  Arrays.asList(blog.getTagIds().split(","));
            List<Tag> asList2 = new ArrayList<>();
            for (String str : asList1) {
                asList2.add(tagService.getTagById(Long.parseLong(str)));
            }
            blogs.get(n).setTags(asList2);
            n++;
        }
        PageInfo pageInfo=new PageInfo<>(blogs);
        for(Tag tag:tags){
            tag.setBlogs(blogService.getBlogByTagId(tag.getId()));
        }
        model.addAttribute("tags", tags);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("activeTagId", id);
        return "tags";
    }
}
