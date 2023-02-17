package com.chenxurui.dao;

import com.chenxurui.pojo.Comment;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CommentMapper {

    public void saveComment(Comment comment);

    public Comment getCommentByIdAndBlogId(@Param("id") Long id, @Param("blogId") Long blogId);

    public List<Comment> getCommentByParentCommentIdAndBlogId(@Param("parentCommentId") Long parentCommentId, @Param("blogId")Long blogId);

    public List<Comment> getCommentByTopCommentAndBlogId(@Param("topCommentId") Long topCommentId, @Param("blogId") Long blogId);
}
