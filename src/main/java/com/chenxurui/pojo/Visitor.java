package com.chenxurui.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Visitor {

    private Integer id;     //访问者id
    private String ip;      //访问者ip
    private String address; //访问者地区
    private Date accessTime;//访问时间
}
