package com.Admin.GoodsManage.controller;

import com.Admin.GoodsManage.entity.Goods;
import com.Admin.GoodsManage.service.ListGoodsService;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

@WebServlet("/ListGoods")
public class ListGoods extends HttpServlet {
    ListGoodsService listGoodsService = new ListGoodsService();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");
        List<Goods> list = listGoodsService.select();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("list", list);
        PrintWriter out = response.getWriter();
        out.print(jsonObject);
        out.close();
    }
}
