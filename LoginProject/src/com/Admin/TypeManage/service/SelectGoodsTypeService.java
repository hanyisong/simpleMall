package com.Admin.TypeManage.service;

import com.Admin.GoodsManage.entity.Goods;
import com.Admin.mapper.TypeMapper;
import com.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class SelectGoodsTypeService {
    public List<Goods> select(String goods_type) {
        SqlSession session = GetSqlSession.createSqlSession();
        TypeMapper typeMapper = session.getMapper(TypeMapper.class);
        return typeMapper.queryGoodsType(goods_type);
    }
}
