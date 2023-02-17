package com.chenxurui.service;

import com.chenxurui.pojo.Blog;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface BlogService {

    public List<Blog> getAllBlog();

    public Blog getBlogById(Long id);

    public void saveBlog(Blog blog);

    public void updateBlog(Blog blog);

    public void deleteBlog(Long id);

    public List<Blog> searchBlog(Blog blog);


    public List<Blog> getBlogByTypeId(Long typeId);

    public List<Blog> getBlogByTagId(Long tagId);

    public List<Blog> getIndexBlog();

    public List<Blog> getRecommendBlog();

    public List<Blog> searchIndexBlog(String query);

    public Blog getDetailedBlog(Long id);

    public Integer countBlog();

    public List<String> findGroupYear();

    public List<Blog> findByYear(@Param("year") String year);

    public Map<String, List<Blog>> archiveBlog();

    public List<Blog> getRecommendBlog(int pageNum);
}
