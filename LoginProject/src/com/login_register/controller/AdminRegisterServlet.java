package com.login_register.controller;

import com.login_register.entity.valueObject.MessageModel;
import com.login_register.service.AdminRegisterService;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;

@WebServlet("/register_user_manage")
public class AdminRegisterServlet extends HttpServlet {
    private AdminRegisterService adminRegisterService = new AdminRegisterService();
    @Override
    public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
        //防止request的msg输出乱码
        request.setCharacterEncoding("UTF-8");
        //1.接收客户端的请求（接收参数：姓名、密码）
        String rg_uname = request.getParameter("rg_uname");
        String rg_upwd = request.getParameter("rg_upwd");
        //2.调用service层的方法，返回消息模型对象
        MessageModel messageModel = adminRegisterService.userLogin(rg_uname,rg_upwd);
        //3.将消息模型对象设置到request作用域中，请求转发跳转到登录页面
        request.setAttribute("messageModel",messageModel);
        request.getRequestDispatcher("login_admin.jsp").forward(request,response);
    }
}
