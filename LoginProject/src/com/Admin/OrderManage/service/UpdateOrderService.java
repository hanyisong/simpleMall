package com.Admin.OrderManage.service;

import com.Admin.mapper.OrderMapper;
import com.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

public class UpdateOrderService {
    //shipped 已发货状态
    public int UpdateShipped(int order_id){
        SqlSession session = GetSqlSession.createSqlSession();
        OrderMapper orderMapper = session.getMapper(OrderMapper.class);
        int num = orderMapper.updateOrder(order_id);
        session.commit();
        session.close();
        return num;
    }
}
