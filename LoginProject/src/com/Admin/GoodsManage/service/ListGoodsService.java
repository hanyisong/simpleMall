package com.Admin.GoodsManage.service;

import com.Admin.GoodsManage.entity.Goods;
import com.Admin.mapper.GoodsMapper;
import com.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class ListGoodsService {
    public List<Goods> select(){
        //2.调用dao层的查询方法，通过用户名查询对象
        SqlSession session = GetSqlSession.createSqlSession();
        GoodsMapper goodsMapper = session.getMapper(GoodsMapper.class);
        List<Goods> goodsList = goodsMapper.queryGoods();
        return goodsList;
    }

}
