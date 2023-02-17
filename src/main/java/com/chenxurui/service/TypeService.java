package com.chenxurui.service;

import com.chenxurui.pojo.Type;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TypeService {

    public void saveType(Type type);

    public Type getTypeById(@Param("id") Long id);

    public List<Type> getAllType();

    public void updateType(Type type);

    public void deleteType(Long id);

    public Type getTypeByName(String name);

    public List<Type> getAllType(int pageNum);

    public int getAllTypeNum();
}
