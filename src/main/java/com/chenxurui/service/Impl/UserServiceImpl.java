package com.chenxurui.service.Impl;

import com.chenxurui.dao.UserMapper;
import com.chenxurui.pojo.User;
import com.chenxurui.service.UserService;
import com.chenxurui.util.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User findByUsernameAndPassword(String username, String password) {
        User user = userMapper.findByUsernameAndPassword(username, MD5Utils.code(password));
        return user;
    }
}
