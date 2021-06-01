package com.Admin.TypeManage.controller;

import com.Admin.GoodsManage.entity.Goods;
import com.Admin.TypeManage.service.SelectGoodsTypeService;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/TypeSelect")
public class TypeSelect extends HttpServlet {
    SelectGoodsTypeService selectGoodsTypeService = new SelectGoodsTypeService();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");
        String goods_type = request.getParameter("goods_type");
        List<Goods> list = selectGoodsTypeService.select(goods_type);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("list",list);
        PrintWriter out = response.getWriter();
        out.print(jsonObject);
        out.close();
    }
}
