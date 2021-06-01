package com.Admin.TypeManage.controller;

import com.Admin.TypeManage.entity.Type;
import com.Admin.TypeManage.service.ListTypeService;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/ListType")
public class ListType extends HttpServlet {
    ListTypeService listTypeService = new ListTypeService();
    @Override
    public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");
        List<Type> list = listTypeService.select();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("list",list);
        PrintWriter out = response.getWriter();
        out.print(jsonObject);
        out.close();
    }
}
