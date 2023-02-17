package com.chenxurui.dao;

import com.chenxurui.pojo.Type;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TypeMapper {

    public void saveType(Type type);

    public Type getTypeById(@Param("id") Long id);

    public Type getTypeByName(@Param("name") String name);

    public List<Type> getAllType();

    public void updateType(Type type);

    public void deleteType(Long id);

    public int getAllTypeNum();
}
