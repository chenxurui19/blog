package com.chenxurui.dao;

import com.chenxurui.pojo.Visitor;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface VisitorMapper {

    public void saveVisitor(Visitor visitor);

    public int getAllVisitorNum();
}
