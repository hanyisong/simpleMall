package com.Admin.LibManage.controller;

import com.Admin.GoodsManage.entity.Goods;
import com.Admin.LibManage.entity.Lib;
import com.Admin.LibManage.service.ListLibService;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/ListLib")
public class ListLib extends HttpServlet {
    ListLibService listLibService = new ListLibService();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");
        List<Lib> list = listLibService.select();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("list", list);
        PrintWriter out = response.getWriter();
        out.print(jsonObject);
        out.close();
    }
}
