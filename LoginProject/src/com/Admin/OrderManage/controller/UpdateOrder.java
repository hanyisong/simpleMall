package com.Admin.OrderManage.controller;

import com.Admin.OrderManage.service.UpdateOrderService;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/UpdateOrder")
public class UpdateOrder extends HttpServlet {
    @Override
    public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");
        String id = request.getParameter("order_id");
        int order_id = Integer.parseInt(id);
        JSONObject jsonObject = new JSONObject();
        PrintWriter out = response.getWriter();
        UpdateOrderService updateOrderService = new UpdateOrderService();
        if(updateOrderService.UpdateShipped(order_id) == 1){
            jsonObject.put("msg","订单号："+order_id+",发货成功！");
        }else {
            jsonObject.put("msg","订单号："+order_id+",发货失败！");
        }
        out.print(jsonObject);
        out.close();
    }
}
