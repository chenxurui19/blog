package com.chenxurui.service.Impl;

import com.chenxurui.dao.VisitorMapper;
import com.chenxurui.pojo.Visitor;
import com.chenxurui.service.VisitorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VisitorServiceImpl implements VisitorService {

    @Autowired
    private VisitorMapper visitorMapper;

    @Override
    public void saveVisitor(Visitor visitor) {
        visitorMapper.saveVisitor(visitor);
    }

    @Override
    public int getAllVisitorNum() {
        return visitorMapper.getAllVisitorNum();
    }
}
