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
public class User {

    private Long id;
    private String nickname;    //昵称
    private String username;    //用户名
    private String password;    //密码
    private String email;       //邮箱
    private String avatar;      //类型
    private Integer type;       //类型
    private Date createTime;    //创建时间
    private Date updateTime;    //更新时间

    private List<Blog> blogs = new ArrayList<>();   //一对多，一个用户有多篇博客
}
