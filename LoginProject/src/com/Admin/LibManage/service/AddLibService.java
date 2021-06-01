package com.Admin.LibManage.service;

import com.Admin.LibManage.entity.Lib;
import com.Admin.mapper.LibMapper;
import com.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class AddLibService {
    public void addLib(Lib lib){
        SqlSession session = GetSqlSession.createSqlSession();
        LibMapper libMapper = session.getMapper(LibMapper.class);
        libMapper.addLib(lib);
        session.commit();
        session.close();
    }

}
