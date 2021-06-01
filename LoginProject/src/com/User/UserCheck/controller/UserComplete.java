package com.User.UserCheck.controller;

import com.User.mapper.UserMapper;
import com.util.GetSqlSession;
import net.sf.json.JSONObject;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/userComplete")
public class UserComplete extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");
        String real_name = request.getParameter("real_name");
        String user_tel = request.getParameter("user_tel");
        String user_address = request.getParameter("user_address");
        String user_name = request.getParameter("user_name");
        String age = request.getParameter("user_age");
        int user_age = Integer.parseInt(age);
        JSONObject jsonObject = new JSONObject();
        PrintWriter out = response.getWriter();
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        int num = userMapper.updateUser(real_name,user_age,user_tel,user_address,user_name);
        if(num>0){
            jsonObject.put("msg","完善个人信息成功！");
        }else {
            jsonObject.put("msg","完善个人信息失败！");
        }
        session.commit();
        out.print(jsonObject);
        out.close();
        session.close();
    }
}
