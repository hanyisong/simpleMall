package com.Admin.LibManage.controller;

import com.Admin.GoodsManage.service.AddGoodsService;
import com.Admin.LibManage.entity.Lib;
import com.Admin.LibManage.service.AddLibService;
import com.Admin.LibManage.service.ListLibService;
import com.Admin.TypeManage.controller.TypeSelect;
import com.Admin.TypeManage.entity.Type;
import com.Admin.TypeManage.service.ListTypeService;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/AddLib")
public class AddLib extends HttpServlet {
    @Override
    public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");

        String goods_name = request.getParameter("goods_name");
        String goods_type = request.getParameter("goods_type");
        String num = request.getParameter("goods_num");
        String price = request.getParameter("goods_price");
        String goods_bzq = request.getParameter("goods_bzq");
        String goods_source = request.getParameter("goods_source");
        String goods_producer = request.getParameter("goods_producer");
        JSONObject jsonObject = new JSONObject();
        PrintWriter out = response.getWriter();
        int goods_num,goods_price;
        try{
            goods_num=Integer.parseInt(num);
        }catch (NumberFormatException e){
            jsonObject.put("msg","输入的**添加数量**应该为数字！");
            out.print(jsonObject);
            out.close();
            return;
        }
        try{
            goods_price = Integer.parseInt(price);
        }catch (NumberFormatException e){
            jsonObject.put("msg","添加的**商品价格**应该为数字！");
            out.print(jsonObject);
            out.close();
            return;
        }
        Lib lib = new Lib(goods_name,goods_type,goods_num,goods_price,goods_source,goods_bzq,goods_producer);
        //获得所有类型typelist，所有库存liblist
        ListTypeService listTypeService = new ListTypeService();
        List<Type> typeList = listTypeService.select();
        ListLibService listLibService = new ListLibService();
        List<Lib> libList = listLibService.select();
        //判断类目表中是否有该商品类型
        int flag1=0,flag2=0;
        for(Type type:typeList){
            if(type.getType_name().equals(goods_type)){
                //类目表存在该商品类型，允许添加
                flag1=1;
                //判断库存表中是否有该商品名称
                for(Lib lib1:libList){
                    if(lib1.getGoods_name().equals(goods_name)){
                        //库存表存在该商品名称
                        flag2=1;
                        break;
                    }
                }
                break;
            }
        }
        if(flag1 == 1){
            if(flag2 == 1){//直接增加库存数量（UpdateGoodsLib为减去所以传负数为加）
                listLibService.UpdateGoodsLib(goods_name,-goods_num);
            }else {//增加库存数据
                AddLibService addLibService = new AddLibService();
                addLibService.addLib(lib);
            }
            jsonObject.put("msg","商品:"+goods_name+"添加库存成功");
        }else {
            jsonObject.put("msg","添加失败！类目表中不存在商品类型："+goods_type);
        }
        out.print(jsonObject);
        out.close();
    }
}
