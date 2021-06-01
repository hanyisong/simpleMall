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

@WebServlet("/MoneySelect")
public class MoneySelect extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");
        String user_name = request.getParameter("user_name");
        JSONObject jsonObject = new JSONObject();
        PrintWriter out = response.getWriter();
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        int Money = userMapper.queryMoney(user_name);
        String money = ""+Money;
        jsonObject.put("money",money);
        out.print(jsonObject);
        out.close();
        session.close();
    }
}
