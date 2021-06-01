package com.Admin.GoodsManage.controller;

import com.Admin.GoodsManage.service.DeleteGoodsService;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/DeleteGoods")
public class DeleteGoods extends HttpServlet {
    DeleteGoodsService deleteGoodsService = new DeleteGoodsService();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=utf-8");
        String id = request.getParameter("goods_id");
        int Id = Integer.parseInt(id);
        JSONObject jsonObject = new JSONObject();
        int num = deleteGoodsService.delete(Id);
        if(num>0){
            jsonObject.put("flag",true);
        }else{
            jsonObject.put("flag",false);
        }
        PrintWriter out = response.getWriter();
        out.print(jsonObject);
        out.close();
    }
}
