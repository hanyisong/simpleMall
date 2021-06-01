package com.User.MyOrder;

import com.Admin.OrderManage.entity.Order;
import com.Admin.OrderManage.service.ListOrderService;
import com.Admin.UserManage.entity.ReturnGoods_id;
import com.Admin.mapper.OrderMapper;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/myOrder")
public class myOrder extends HttpServlet {
    public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");

        String user_name = request.getParameter("user_name");
        SqlSession session = GetSqlSession.createSqlSession();
        OrderMapper orderMapper = session.getMapper(OrderMapper.class);
        //获得该用户的所有订单表
        List<Order> list = orderMapper.queryUserOrder(user_name);
        List<Order> Orderlist = new ArrayList<>();
        for(Order order: list){
            if(order.getState().equals("0")){
                order.setState("未发货");
                Orderlist.add(order);
            }else  if(order.getState().equals("1")){
                order.setState("已发货");
                Orderlist.add(order);
            }
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("list",Orderlist);
        PrintWriter out = response.getWriter();
        out.print(jsonObject);
        out.close();
        session.commit();
    }

}
