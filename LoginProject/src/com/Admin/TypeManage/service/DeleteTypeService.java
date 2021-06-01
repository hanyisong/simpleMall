package com.Admin.TypeManage.service;

import com.Admin.mapper.TypeMapper;
import com.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

public class DeleteTypeService {
    public int delete(int type_id){
        SqlSession session = GetSqlSession.createSqlSession();
        TypeMapper typeMapper = session.getMapper(TypeMapper.class);
        int num = typeMapper.deleteType(type_id);
        session.commit();
        return num;
    }
}
