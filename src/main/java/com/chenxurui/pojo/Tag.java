package com.chenxurui.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Tag {

    private Long id;
    private String name;    //标签名称

    private List<Blog> blogs = new ArrayList<>();   //一个标签包含多个博客

}
