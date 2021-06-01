package com.Admin.TypeManage.controller;

import com.Admin.mapper.TypeMapper;
import com.util.GetSqlSession;
import net.sf.json.JSONObject;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/AddType")
public class AddType extends HttpServlet {
    @Override
    public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");
        String goods_type =  request.getParameter("goods_type");
        JSONObject jsonObject = new JSONObject();
        SqlSession session = GetSqlSession.createSqlSession();
        PrintWriter out = response.getWriter();
        TypeMapper typeMapper  = session.getMapper(TypeMapper.class);
        if(typeMapper.QueryType(goods_type) != null){
            jsonObject.put("msg","类目表已存在类型:"+goods_type+",添加类目失败!");//类目表已存在类型添加失败
        }else{
            //不存在，可添加
            int num = typeMapper.addType(goods_type);
            if(num>0){
                jsonObject.put("msg","添加类型："+goods_type+"成功！");
            }
            session.commit();
        }
        out.print(jsonObject);
        out.close();
        session.close();
    }
}
