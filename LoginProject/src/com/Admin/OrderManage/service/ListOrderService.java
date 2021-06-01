package com.Admin.OrderManage.service;

import com.Admin.OrderManage.entity.Order;
import com.Admin.mapper.OrderMapper;
import com.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class ListOrderService {
    public List<Order> select(){
        SqlSession session = GetSqlSession.createSqlSession();
        OrderMapper orderMapper = session.getMapper(OrderMapper.class);
        List<Order> list = orderMapper.queryOrder();
        return list;
    }
}
