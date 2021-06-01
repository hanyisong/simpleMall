package com.Admin.mapper;

import com.Admin.GoodsManage.entity.Goods;
import com.Admin.LibManage.entity.Lib;
import com.Admin.TypeManage.entity.Type;
import com.login_register.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodsMapper {
    //商品管理
    List<Goods> queryGoods();
    int deleteGoods(int goods_id);
    void AddGoods(@Param("goods_name") String goods_name, @Param("goods_num")int goods_num);
    void InsertGoods(@Param("lib") Lib lib,@Param("goods_num") int goods_num);
    int updateGoodsNum(@Param("goods_id")int goods_id,@Param("number")int number);
}
