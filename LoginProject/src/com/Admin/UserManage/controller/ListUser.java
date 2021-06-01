package com.Admin.UserManage.controller;

import com.Admin.UserManage.entity.User;
import com.Admin.UserManage.service.ListUserService;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/ListUser")
public class ListUser extends HttpServlet {
    ListUserService listUserService = new ListUserService();
    @Override
    public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");

        List<User> list = listUserService.select();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("list",list);
        PrintWriter out = response.getWriter();
        out.print(jsonObject);
        out.close();
    }


}
