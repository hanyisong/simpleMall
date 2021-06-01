package com.Admin.UserManage.service;

import com.Admin.UserManage.entity.User;
import com.Admin.mapper.UserMapper;
import com.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class ListUserService {
    public List<User> select(){
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        List<User> list = userMapper.queryUser();
        return list;
    }

}
