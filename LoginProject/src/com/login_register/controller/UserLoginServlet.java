package com.login_register.controller;

import com.login_register.entity.User;
import com.login_register.entity.valueObject.MessageModel;
import com.login_register.service.UserLoginService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
/**
 *
 */
@WebServlet("/login_user")
public class UserLoginServlet extends HttpServlet {

    //实例化UserService对象
    private UserLoginService userLoginService = new UserLoginService();
    /**
     * 用户登录
        1.接收客户端的请求（接收参数：姓名、密码）
        2.调用service层的方法，返回消息模型对象
        3.判断消息模型状态码
        如果状态码是失败
        将消息模型对象设置到request作用域中，请求转发跳转到登录页面
        如果状态码是成功
        将消息模型中的用户信息设置到session作用域中，重定向到index.jsp
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //防止request的msg输出乱码
        request.setCharacterEncoding("UTF-8");
        //1.接收客户端的请求（接收参数：姓名、密码）
        String uname = request.getParameter("uname");
        String upwd = request.getParameter("upwd");

        //2.调用service层的方法，返回消息模型对象
        MessageModel messageModel = userLoginService.userLogin(uname,upwd);
        //3.判断消息模型状态码
        if(messageModel.getCode() == 1){//成功
            //将消息模型中的用户信息设置到session作用域中， 重定向 到指定页面user.jsp
            request.getSession().setAttribute("user",(User)messageModel.getObject());
            response.sendRedirect("userJSP/user.jsp");
        }else{//失败
            //将消息模型对象设置到request作用域中， 请求转发 跳转到登录页面 防止request域对象失效
            //Dispatcher 分发器
            request.setAttribute("messageModel",messageModel);
            request.getRequestDispatcher("login_user.jsp").forward(request,response);
//            response.sendRedirect("login_user.jsp");
        }

    }

}
