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
public class Blog {

    private Long id;                //编号
    private String title;           //标题
    private String content;         //内容
    private String firstPicture;    //首图
    private String flag;            //标记
    private Integer views;          //浏览次数
    private boolean appreciation;   //赞赏开启
    private boolean shareStatement; //版权开启
    private boolean commentabled;   //评论开启
    private boolean published;      //发布
    private boolean recommend;      //是否推荐
    private Date createTime;        //创建时间
    private Date updateTime;        //更新时间

    private String description;     //文章描述

    /**用于关联**/
    private Long typeId;
    private Long userId;

    /*获取多个标签编号*/
    private String tagIds;

    private Type type;              //类型
    private List<Tag> tags = new ArrayList<>(); //标签
    private User user;              //用户
    private List<Comment> comments = new ArrayList<>(); //一个多，一个篇博客有多个评论

    public void init() {
        this.tagIds = tagsToIds(this.getTags());
    }

    //将tags集合转换为tagIds字符串：1,2,3
    private String tagsToIds(List<Tag> tags) {
        if (!tags.isEmpty()) {
            StringBuffer ids = new StringBuffer();
            boolean flag = false;
            for (Tag tag : tags) {
                if (flag) {
                    ids.append(",");
                } else {
                    flag = true;
                }
                ids.append(tag.getId());
            }
            return ids.toString();
        } else {
            return tagIds;
        }
    }
}
