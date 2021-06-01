package com.Admin.GoodsManage.service;

import com.Admin.mapper.GoodsMapper;
import com.mysql.cj.Session;
import com.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

public class DeleteGoodsService {
    public int delete(int Id){
        SqlSession session = GetSqlSession.createSqlSession();
        GoodsMapper goodsMapper = session.getMapper(GoodsMapper.class);
        int num = goodsMapper.deleteGoods(Id);
        session.commit();//只有手动提交业务才能成功插入
        return num;
    }
}
