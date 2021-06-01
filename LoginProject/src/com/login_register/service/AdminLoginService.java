package com.login_register.service;

import com.login_register.entity.Admin;
import com.login_register.entity.valueObject.MessageModel;
import com.login_register.mapper.UserMapper;
import com.util.GetSqlSession;
import com.util.StringUtil;
import org.apache.ibatis.session.SqlSession;

public class AdminLoginService {
    /**
     1.参数的非空判断
     如果参数为空
     将状态码、提示信息、回显数据设置到消息模型对象中
     2.调用dao层的查询方法，通过用户名查询对象
     3.判断用户对象是否为空
     如果为空将状态码、提示信息、回显数据设置到消息模型对象中
     4.判断数据库中查询到的用户密码与前台传递的密码做比较
     如果不相等，将状态码、提示信息、回显数据设置到消息模型对象中
     5.登录成功，将成功状态码、提示信息、用户对象设置到消息模型对象，并return
     */

    public MessageModel userLogin(String uname, String upwd){
        MessageModel messageModel = new MessageModel();

        //回显数据
        Admin u = new Admin();
        u.setUser_name(uname);
        u.setUser_pwd(upwd);
        messageModel.setObject(u);

        //1.参数的非空判断
        if(StringUtil.isEmpty(uname) || StringUtil.isEmpty(upwd)){
            //将状态码、提示信息、回显数据设置到消息模型对象中
            messageModel.setCode(0);
            messageModel.setMsg("用户姓名密码不能为空");
            return messageModel;
        }

        //2.调用dao层的查询方法，通过用户名查询对象
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class); //1).class 反射常用API 在编译前就知道操作的 Class 2)Class.forName 静态方法。当你知道该类的全路径名时，你可以使用该方法获取 Class 类对象。
        Admin admin = userMapper.queryUserManageByName(uname);

        //3.判断用户对象是否为空
        if(admin == null){
            //将状态码、提示信息、回显数据设置到消息模型对象中
            messageModel.setCode(0);
            messageModel.setMsg("用户不存在！");
            return messageModel;
        }

        //4.判断数据库中查询到的用户密码与前台传递的密码做比较
        if(!upwd.equals(admin.getUser_pwd())){
            //如果不相等，将状态码、提示信息、回显数据设置到消息模型对象中
            messageModel.setCode(0);
            messageModel.setMsg("用户密码不正确！");
            return messageModel;
        }

        //5.登录成功，将成功状态码、提示信息、用户对象设置到消息模型对象，并return
        messageModel.setObject(admin);

        return  messageModel;

    }
}
