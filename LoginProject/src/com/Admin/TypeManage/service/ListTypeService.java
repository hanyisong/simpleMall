package com.Admin.TypeManage.service;

import com.Admin.TypeManage.entity.Type;
import com.Admin.mapper.TypeMapper;
import com.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class ListTypeService {
    public List<Type> select(){
        SqlSession session = GetSqlSession.createSqlSession();
        TypeMapper typeMapper = session.getMapper(TypeMapper.class);
        List<Type> list = typeMapper.queryType();
        return list;
    }
}
