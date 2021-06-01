package com.Admin.mapper;

import com.Admin.OrderManage.entity.Order;
import com.Admin.OrderManage.entity.Order_id;
import com.Admin.UserManage.entity.ReturnGoods;
import com.User.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
//接口方法不可重名
public interface OrderMapper {
    List<Order> queryOrder();//获得所有订单（通过id映射）
    int updateOrder(int order_id);//设置订单id为已发货状态
    int returnOrder(@Param("id")int order_id);//将订单设为未退货状态
    int finishReturnOrder(int id);//退货表(1)设置状态为 已退货状态
    int finishOrder(int id);//订单表(2)设置状态为 已退货状态
    int insertReturnOrder(@Param("order_id")int order_id,@Param("goods_id")int goods_id,@Param("user_id")int user_id);//将订单进入退货表
    Order_id queryOrderId(int order_id);//获得特定订单id的对象
    //插入一条新订单（id）
    int insertOrder(@Param("goods_id") int goods_id, @Param("user_id")int user_id, @Param("number")int number,@Param("total") int total);
    List<Order> queryUserOrder(@Param("user_name") String user_name);//获得该用户id的所有订单
    List<ReturnGoods> queryReturnGoods(@Param("user_id")int user_id);//获得该用户id的所有退货单
    List<ReturnGoods> QueryReturnGoods();//获得所有退货单
}
