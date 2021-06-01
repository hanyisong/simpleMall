package com.login_register.service;

import com.login_register.entity.User;
import com.login_register.entity.valueObject.MessageModel;
import com.login_register.mapper.UserMapper;
import com.util.GetSqlSession;
import com.util.StringUtil;
import org.apache.ibatis.session.SqlSession;

/**
 *      1.判断姓名密码是否符合条件
 *         用户名非空且符合3-10位
 *         密码非空且符合4-10位
 *      如果姓名密码不符合条件，return
 *         1用户名非空
 *         2用户名符合3-10位
 *         3密码非空
 *         4密码符合4-10位
 *       2.通过用户名查询用户对象
 *       3.判断用户对象是否为空
 *           若已存在该对象
 *             不允许注册
 *           若不存在
 *             允许注册
 *         将提示信息、回显数据设置到消息模型对象中
 *       4.注册成功在表中插入数据将提示信息、用户对象设置到消息模型对象，并return跳转到首页
 */
public class UserRegisterService {
    public MessageModel userLogin(String uname, String upwd){
        MessageModel messageModel = new MessageModel();

        //回显数据
        User u = new User();
        u.setUser_name(uname);
        u.setUser_pwd(upwd);
        messageModel.setObject(u);

        //1.判断姓名密码是否符合条件
        //用户名非空
        if(StringUtil.isEmpty(uname)){
            messageModel.setCode(0);
            messageModel.setMsg("用户名不能为空");
            return messageModel;
        }
        //用户名符合3-10位
        if(uname.trim().length()<3){
            messageModel.setCode(0);
            messageModel.setMsg("用户名不可少于3位");
            return messageModel;
        }
        //密码非空
        if(StringUtil.isEmpty(upwd)){
            messageModel.setCode(0);
            messageModel.setMsg("用户名不能为空");
            return messageModel;
        }
        //密码符合4-10位
        if(upwd.trim().length()<3){
            messageModel.setCode(0);
            messageModel.setMsg("密码不可大于10位");
            return messageModel;
        }

        //用户名密码符合格式
        //2.调用dao层的查询方法，通过用户名查询对象
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        User user = userMapper.queryUserByName(uname);

        //3.判断用户对象是否为空
        // *           若已存在该对象
        // *             不允许注册 return
        // *           若不存在
        // *             允许注册 在user表中插入新数据
        // *         将提示信息、回显数据设置到消息模型对象中
        //不为空则return
        if(user != null){
            //将状态码、提示信息、回显数据设置到消息模型对象中
            messageModel.setCode(0);
            messageModel.setMsg("该用户名已存在，请重新输入!");
            return messageModel;
        }
        //为空则允许注册 在user表中插入新数据,初始化顾客余额为0
        userMapper.insertUser(u);
        session.commit(); //手动提交事务
        //4.注册成功，将成功状态码、提示信息、用户对象设置到消息模型对象，并return
        messageModel.setMsg("顾客注册成功!");
        return  messageModel;
    }
}
