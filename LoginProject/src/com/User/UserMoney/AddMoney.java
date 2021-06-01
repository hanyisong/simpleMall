package com.User.UserMoney;

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

@WebServlet("/AddMoney")
public class AddMoney extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");
        String user_name = request.getParameter("user_name");
        String num = request.getParameter("number");
        int number = Integer.parseInt(num);
        JSONObject jsonObject = new JSONObject();
        PrintWriter out = response.getWriter();
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        int k = userMapper.addMoney(user_name,number);
        session.commit();
        if(k>0)
            jsonObject.put("msg","余额充值成功！");
        else
            jsonObject.put("msg","余额充值失败！");
        out.print(jsonObject);
        out.close();
        session.close();
    }
}
