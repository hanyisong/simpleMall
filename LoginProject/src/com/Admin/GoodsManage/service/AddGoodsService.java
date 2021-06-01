package com.Admin.GoodsManage.service;

import com.Admin.LibManage.entity.Lib;
import com.Admin.mapper.GoodsMapper;
import com.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

public class AddGoodsService {
    //在对应商品名称的数量修改成 原来+添加
    public void AddGoods(String goods_name,int goods_num){
        SqlSession session = GetSqlSession.createSqlSession();
        GoodsMapper goodsMapper = session.getMapper(GoodsMapper.class);
        goodsMapper.AddGoods(goods_name,goods_num);
        session.commit();
    }
    //直接在商品表添加一条数据（数据来源：库存表中对应的商品名称）
    public void InsertGoods(Lib lib,int goods_num){
        SqlSession session = GetSqlSession.createSqlSession();
        GoodsMapper goodsMapper = session.getMapper(GoodsMapper.class);
        goodsMapper.InsertGoods(lib,goods_num);//goods_num为添加数量
        session.commit();
    }
}
