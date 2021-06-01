package com.login_register.mapper;

import com.login_register.entity.User;
import com.login_register.entity.Admin;

/**
 * 用户接口类
 * !!!!需要手动提交事务！！！！
 */
public interface UserMapper {
    public User queryUserByName(String user_name);
    public void insertUser(User user);
    public Admin queryUserManageByName(String user_name);
    public void insertUserManage(Admin admin);
}
