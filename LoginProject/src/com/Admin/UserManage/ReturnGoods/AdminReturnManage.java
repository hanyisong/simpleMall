package com.Admin.UserManage.ReturnGoods;

import com.Admin.GoodsManage.controller.AddGoods;
import com.Admin.mapper.GoodsMapper;
import com.Admin.mapper.OrderMapper;
import com.User.mapper.UserMapper;
import com.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/AdminReturnManage")
public class AdminReturnManage extends HttpServlet {
    @Override
    public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");
        PrintWriter out = response.getWriter();
        String ID = request.getParameter("id");
        String Order_id = request.getParameter("order_id");
        String Number = request.getParameter("number");
        String Total = request.getParameter("total");
        String goods_name = request.getParameter("goods_name");
        String user_name = request.getParameter("user_name");
        int id = Integer.parseInt(ID);
        int order_id = Integer.parseInt(Order_id);
        int number = Integer.parseInt(Number);
        int total = Integer.parseInt(Total);
        //退货表、订单表同时设置状态为 已退货状态
        SqlSession session = GetSqlSession.createSqlSession();
        OrderMapper orderMapper = session.getMapper(OrderMapper.class);
        //退货表(1)设置状态为 已退货状态
        orderMapper.finishReturnOrder(id);
        session.commit();
        //订单表(2)设置状态为 已退货状态
        orderMapper.finishOrder(order_id);
        session.commit();
        //用户余额加上订单总价，对应商品数量加上订单的商品数量（数据回滚）
        GoodsMapper goodsMapper = session.getMapper(GoodsMapper.class);
        goodsMapper.AddGoods(goods_name,number);
        session.commit();
        UserMapper userMapper =session.getMapper(UserMapper.class);
        userMapper.addMoney(user_name,total);
        session.commit();
        session.close();
        out.print(true);//不返回会中断
        out.close();
    }
}
