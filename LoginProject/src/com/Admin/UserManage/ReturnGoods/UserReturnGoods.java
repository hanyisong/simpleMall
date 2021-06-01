package com.Admin.UserManage.ReturnGoods;

import com.Admin.OrderManage.entity.Order;
import com.Admin.OrderManage.entity.Order_id;
import com.Admin.mapper.OrderMapper;
import com.util.GetSqlSession;
import net.sf.json.JSONObject;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/UserReturnGoods")
public class UserReturnGoods extends HttpServlet {
    @Override
    public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");
        String orderId = request.getParameter("order_id");
        int order_id = Integer.parseInt(orderId);
        JSONObject jsonObject = new JSONObject();
        PrintWriter out = response.getWriter();
        SqlSession session = GetSqlSession.createSqlSession();
        //获取订单id对象
        OrderMapper orderMapper = session.getMapper(OrderMapper.class);
        Order_id order =  orderMapper.queryOrderId(order_id);
        //将订单设为未退货状态
        orderMapper.returnOrder(order_id);
        //在return_goods表中插入订单数据
        int num = orderMapper.insertReturnOrder(order.getOrder_id(),order.getGoods_id(),order.getUser_id());
        session.commit();
        if(num>0){
            jsonObject.put("msg","订单号："+orderId+", 进入退货状态成功！");
        }else {
            jsonObject.put("msg","订单号："+orderId+", 进入退货状态失败！");
        }
        out.print(jsonObject);
        out.close();
        session.close();
    }
}
