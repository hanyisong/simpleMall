package com.Admin.OrderManage.controller;

import com.Admin.OrderManage.entity.Order;
import com.Admin.OrderManage.service.ListOrderService;
import net.sf.json.JSON;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ListOrder")
public class ListOrder extends HttpServlet {
    ListOrderService listOrderService = new ListOrderService();
    @Override
    public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");

        List<Order> list = listOrderService.select();
        List<Order> orderList = new ArrayList<>();
        for(Order order: list){
            if(order.getState().equals("0")){
                order.setState("未发货");
                orderList.add(order);
            }else if(order.getState().equals("1")){
                order.setState("已发货");
                orderList.add(order);
            }
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("list",orderList);
        PrintWriter out = response.getWriter();
        out.print(jsonObject);
        out.close();
    }
}
