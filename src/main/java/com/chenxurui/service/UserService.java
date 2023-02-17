package com.chenxurui.service;

import com.chenxurui.pojo.User;

public interface UserService {

    User findByUsernameAndPassword(String username, String password);
}
