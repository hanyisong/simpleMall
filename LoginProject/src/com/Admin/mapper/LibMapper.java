package com.Admin.mapper;

import com.Admin.LibManage.entity.Lib;
import com.util.GetSqlSession;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public interface LibMapper {
    //库存管理
    List<Lib> queryLib();
    int deleteLib(int lib_id);
    //库存商品数量修改
    int UpdateLibNum(@Param("goods_name") String goods_name,@Param("goods_num") int goods_num);
    void addLib(@Param("lib")Lib lib);  //没加@Param会后台中断
}
