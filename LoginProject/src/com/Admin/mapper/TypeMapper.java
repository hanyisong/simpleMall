package com.Admin.mapper;

import com.Admin.GoodsManage.entity.Goods;
import com.Admin.TypeManage.entity.Type;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TypeMapper {
    //类目管理
    List<Type> queryType();
    int deleteType(int type_id);
    List<Goods> queryGoodsType(String goods_type);
    int addType(@Param("goods_type")String goods_type);
    Type QueryType(@Param("type") String type);
}
