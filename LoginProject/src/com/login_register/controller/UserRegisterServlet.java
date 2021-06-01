package com.login_register.controller;

import com.login_register.entity.valueObject.MessageModel;
import com.login_register.service.UserRegisterService;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *             controller层（接收请求、相应结果）
 *                 1.接收客户端的请求（接收参数：姓名、密码）
 *                 2.调用service层的方法，返回消息模型对象
 *                 3.判断消息模型状态码
 *                     将消息模型对象设置到request作用域中，请求转发跳转到登录页面
 */
@WebServlet("/register_user")
public class UserRegisterServlet extends HttpServlet {
    private UserRegisterService userRegisterService = new UserRegisterService();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //防止request的msg输出乱码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");
        //1.接收客户端的请求（接收参数：姓名、密码）
        String rg_uname = request.getParameter("rg_uname");
        String rg_upwd = request.getParameter("rg_upwd");
        //2.调用service层的方法，返回消息模型对象
        MessageModel messageModel = userRegisterService.userLogin(rg_uname,rg_upwd);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg2",messageModel.getMsg());
        PrintWriter out = response.getWriter();
        out.print(jsonObject);
        out.close();
        //3.将消息模型对象设置到request作用域中，请求转发跳转到登录页面
//        request.setAttribute("messageModel",messageModel);
//        request.getRequestDispatcher("login_user.jsp").forward(request,response);//加载页面速度变慢了
    }
}
