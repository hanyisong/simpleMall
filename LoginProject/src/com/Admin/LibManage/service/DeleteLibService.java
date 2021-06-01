package com.Admin.LibManage.service;

import com.Admin.LibManage.entity.Lib;
import com.Admin.mapper.GoodsMapper;
import com.Admin.mapper.LibMapper;
import com.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

public class DeleteLibService {
    public int delete(int Id){
        SqlSession session = GetSqlSession.createSqlSession();
        LibMapper libMapper = session.getMapper(LibMapper.class);
        int num = libMapper.deleteLib(Id);
        session.commit();//只有手动提交业务才能成功插入
        return num;
    }
}
