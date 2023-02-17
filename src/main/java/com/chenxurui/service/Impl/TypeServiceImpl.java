package com.chenxurui.service.Impl;

import com.chenxurui.NotFoundException;
import com.chenxurui.dao.TypeMapper;
import com.chenxurui.pojo.Type;
import com.chenxurui.service.TypeService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class TypeServiceImpl implements TypeService {

    @Autowired
    private TypeMapper typeMapper;

    @Transactional
    @Override
    public void saveType(Type type) {
        typeMapper.saveType(type);
    }

    @Transactional
    @Override
    public Type getTypeById(Long id) {
        return typeMapper.getTypeById(id);
    }

    @Transactional
    @Override
    public List<Type> getAllType() {
        return typeMapper.getAllType();
    }

    @Transactional
    @Override
    public void updateType(Type type) {
        Type t = typeMapper.getTypeById(type.getId());
        if (t == null) {
            throw new NotFoundException("不存在该类型");
        }
        typeMapper.updateType(type);
    }

    @Transactional
    @Override
    public void deleteType(Long id) {
        typeMapper.deleteType(id);
    }

    @Transactional
    @Override
    public Type getTypeByName(String name) {
        Type t = typeMapper.getTypeByName(name);
        return t;
    }

    @Override
    public List<Type> getAllType(int pageNum) {
        PageHelper.startPage(pageNum, 5);
        return typeMapper.getAllType();
    }

    @Override
    public int getAllTypeNum() {
        return typeMapper.getAllTypeNum();
    }
}
