package com.chenxurui.dao;

import com.chenxurui.pojo.Blog;
import com.github.pagehelper.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BlogMapper {

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

    public List<Blog> searchIndexBlog(@Param("query")String query);

    public Blog getDetailedBlog(@Param("id")Long id);

    public int updateViews(@Param("id") Long id);

    public Integer countBlog();

    public List<String> findGroupYear();

    public List<Blog> findByYear(@Param("year") String year);
 }
