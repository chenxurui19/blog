package com.chenxurui.service.Impl;

import com.chenxurui.NotFoundException;
import com.chenxurui.dao.BlogMapper;
import com.chenxurui.pojo.Blog;
import com.chenxurui.service.BlogService;
import com.chenxurui.service.TagService;
import com.chenxurui.util.MarkdownUtils;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class BlogServiceImpl implements BlogService {

    @Autowired
    private BlogMapper blogMapper;

    @Autowired
    private TagService tagService;

    @Override
    public List<Blog> getAllBlog() {
        return blogMapper.getAllBlog();
    }

    @Override
    public Blog getBlogById(Long id) {
        return blogMapper.getBlogById(id);
    }

    @Override
    public void saveBlog(Blog blog) {
        if (blog.getId() == null) {
            blog.setCreateTime(new Date());
            blog.setUpdateTime(new Date());
            blog.setViews(0);
            blogMapper.saveBlog(blog);
        } else {
            blog.setUpdateTime(new Date());
            blogMapper.updateBlog(blog);
        }
    }

    @Override
    public void updateBlog(Blog blog) {
        blog.setUpdateTime(new Date());
        blogMapper.updateBlog(blog);
    }

    @Override
    public void deleteBlog(Long id) {
        blogMapper.deleteBlog(id);
    }

    @Override
    public List<Blog> searchBlog(Blog blog) {
        return blogMapper.searchBlog(blog);
    }

    @Override
    public List<Blog> getBlogByTypeId(Long typeId) {
        return blogMapper.getBlogByTypeId(typeId);
    }

    @Override
    public List<Blog> getBlogByTagId(Long tagId) {
        return blogMapper.getBlogByTagId(tagId);
    }

    @Override
    public Integer countBlog() {
        return blogMapper.countBlog();
    }

    @Override
    public List<String> findGroupYear() {
        return blogMapper.findGroupYear();
    }

    @Override
    public List<Blog> findByYear(String year) {
        return blogMapper.findByYear(year);
    }

    @Override
    public Map<String, List<Blog>> archiveBlog() {
        List<String> years = blogMapper.findGroupYear();
        Map<String, List<Blog>> map = new HashMap<>();
        for (String year : years) {
            map.put(year, blogMapper.findByYear(year));
        }
        return map;
    }

    @Override
    public List<Blog> getRecommendBlog(int pageNum) {
        PageHelper.startPage(pageNum, 5);
        return blogMapper.getRecommendBlog();
    }

    @Override
    public List<Blog> getIndexBlog() {
        return blogMapper.getIndexBlog();
    }

    @Override
    public List<Blog> getRecommendBlog() {
        return blogMapper.getRecommendBlog();
    }

    @Override
    public List<Blog> searchIndexBlog(String query) {
        return blogMapper.searchIndexBlog(query);
    }

    @Override
    public Blog getDetailedBlog(Long id) {
        Blog blog=blogMapper.getDetailedBlog(id);
        if(blog==null){
            throw new NotFoundException("该博客不存在");
        }

        List tags = new ArrayList();
        if(blog.getTagIds()=="" || blog.getTagIds().equals("")){

        }else{
            String[] tagIds=blog.getTagIds().split(",");
            for(String tagId:tagIds){
                Long tagid=Long.parseLong(tagId);
                tags.add(tagService.getTagById(tagid));
            }
            blog.setTags(tags);
        }

        String content=blog.getContent();
        blog.setContent(MarkdownUtils.markdownToHtmlExtensions(content));
        blogMapper.updateViews(id);
        return blog;
    }
}
