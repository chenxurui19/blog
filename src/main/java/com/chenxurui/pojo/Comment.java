package com.chenxurui.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Comment {

    private Long id;
    private String nickname;    //昵称
    private String email;       //邮箱
    private String content;     //评论内容
    private String avatar;      //创建时间
    private Date createTime;    //创建时间
    private boolean adminComment;   //是否为管理员评论

    private Long blogId;        //用于关联博客
    private Long parentCommentId;//父评论编号
    private String replyName;   //被回复人昵称
    private Long topCommentId;  //记录回复的编号，如5回复1，记录1
    private Blog blog;          //级联关系
    private List<Comment> childComments = new ArrayList<>();

    private String ip;          //ip地址
    private String address;     //地区
}
