package com.Admin.LibManage.service;

import com.Admin.GoodsManage.entity.Goods;
import com.Admin.LibManage.entity.Lib;
import com.Admin.mapper.GoodsMapper;
import com.Admin.mapper.LibMapper;
import com.util.GetSqlSession;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class ListLibService {
    public List<Lib> select(){
        SqlSession session = GetSqlSession.createSqlSession();
        LibMapper libMapper = session.getMapper(LibMapper.class);
        List<Lib> libList = libMapper.queryLib();
        return libList;
    }
    //库存的商品数量修改为 原来-添加
    public int UpdateGoodsLib(String goods_name,int goods_num){
        SqlSession session = GetSqlSession.createSqlSession();
        LibMapper libMapper = session.getMapper(LibMapper.class);
        int num = libMapper.UpdateLibNum(goods_name,goods_num);
        session.commit();
        return num;
    }

}
