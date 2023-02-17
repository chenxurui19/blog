package com.chenxurui.service;

import com.chenxurui.pojo.Comment;

import java.util.List;

public interface CommentService {

    public List<Comment> getCommentByBlogId(Long blogId);
    public void saveComment(Comment comment);
}
