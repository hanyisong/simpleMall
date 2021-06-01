package com.Admin.GoodsManage.controller;

import com.Admin.GoodsManage.entity.Goods;
import com.Admin.GoodsManage.service.AddGoodsService;
import com.Admin.GoodsManage.service.ListGoodsService;
import com.Admin.LibManage.entity.Lib;
import com.Admin.LibManage.service.ListLibService;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/AddGoods")
public class AddGoods extends HttpServlet {
    @Override
    public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");
        String goods_name = request.getParameter("goods_name");
        String number = request.getParameter("goods_num");
        System.out.println(goods_name);
        System.out.println(number);
        int goods_num = Integer.parseInt(number);
        JSONObject jsonObject = new JSONObject();
        //分别获得 libList 和 goodsList
        ListLibService listLibService = new ListLibService();
        List<Lib> libList = listLibService.select();
        ListGoodsService listGoodsService = new ListGoodsService();
        List<Goods> goodsList = listGoodsService.select();

        int flag1=0,flag2=0,flag3=0;
        Lib insertlib = null;
        for(Lib lib:libList){
            //查询库存是否有该商品名称
            if(lib.getGoods_name().equals(goods_name)){
                //库存存在该商品名称标记1
                flag1=1;
                //查询当前库存是否足够提供所添加的数量
                if(lib.getGoods_num()>=goods_num){
                    //库存足够提供所添加的数量标记1
                    flag2=1;
                    //获得该库存对象
                    insertlib = lib;
                    for (Goods goods:goodsList) {
                        //查询商品表是否已有该商品名称
                        if(goods.getGoods_name().equals(goods_name)){
                            //商品表存在该商品名称标记1
                            flag3=1;
                            break;
                        }
                    }
                }
                //库存不足够提供所添加的数量 和 查询完商品表，直接退出遍历
                break;
            }
        }

        if(flag1==1){
            //库存存在该商品名称
            AddGoodsService addGoodsService = new AddGoodsService();
            if(flag2==1){
                //库存足够提供所添加的数量
                if(flag3==1){
                    //商品表存在该商品名称,在对应商品id的数量修改成 原来+添加
                    addGoodsService.AddGoods(goods_name,goods_num);
                }else {
                    //直接在商品表添加一条数据（数据来源：库存表中对应的商品名称）
                    addGoodsService.InsertGoods(insertlib,goods_num);
                }
                //库存的商品数量修改为 原来-添加
                int num2 = listLibService.UpdateGoodsLib(goods_name,goods_num);
                if(num2>0){
                    jsonObject.put("msg","添加商品："+goods_name+"成功");
                }else{
                    jsonObject.put("msg","添加商品："+goods_name+"成功！"+"商品库存数量修改失败！");
                }
            }else{
                //提示库存数量不足
                jsonObject.put("msg","添加失败：库存商品："+goods_name+"不足！");
            }
        }else{
            //提示库存中不存在该商品
            jsonObject.put("msg","添加失败：库存中不存在该商品："+goods_name+"！");
        }
        PrintWriter out = response.getWriter();
        out.print(jsonObject);
        out.close();
    }
}
