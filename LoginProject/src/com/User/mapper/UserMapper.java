package com.User.mapper;

import com.User.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    User queryUser(String uname);
    int updateUser(@Param("real_name") String real_name, @Param("user_age")  int user_age,@Param("user_tel")  String user_tel, @Param("user_address") String user_address,@Param("user_name")String user_name);
    int queryMoney(String user_name);
    int addMoney(@Param("user_name") String user_name,@Param("number") int number);//number为更新的钱数
    int queryUserId(String user_name);
}
