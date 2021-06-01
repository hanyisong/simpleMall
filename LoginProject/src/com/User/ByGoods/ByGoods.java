package com.User.ByGoods;

import com.Admin.mapper.GoodsMapper;
import com.Admin.mapper.OrderMapper;
import com.User.mapper.UserMapper;
import com.util.GetSqlSession;
import net.sf.json.JSONObject;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/ByGoods")
public class ByGoods extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");
        JSONObject jsonObject = new JSONObject();
        PrintWriter out = response.getWriter();
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        String id = request.getParameter("goods_id");
        String num = request.getParameter("number");
        String gnum = request.getParameter("goods_num");
        String total = request.getParameter("total");
        String user_name = request.getParameter("user_name");
        String goods_name = request.getParameter("goods_name");
        int goods_total = Integer.parseInt(total);//商品总价
        int goods_id = Integer.parseInt(id);//商品id
        int goods_num = Integer.parseInt(gnum);//商品数量
        int number = Integer.parseInt(num);//购买数量

        //判断商品数量是否足够提供
        if(goods_num<number){
            //商品数量小于购买数量,返回
            jsonObject.put("msg","购买失败！商品数量小于购买数量");
            out.print(jsonObject);
            out.close();
            return;
        }
        //计算总价 判断用户余额是否足够购买
        int user_surplus = userMapper.queryMoney(user_name);
        if(user_surplus>=goods_total){
            //用户余额足够购买，更新用户余额
            userMapper.addMoney(user_name,-goods_total);//减少余额
            //更新商品数量
            GoodsMapper goodsMapper = session.getMapper(GoodsMapper.class);
            goodsMapper.updateGoodsNum(goods_id,number);
            //获得用户id
            int user_id = userMapper.queryUserId(user_name);
            //生成订单信息，商品id 用户id 购买数量 购买总价
            OrderMapper orderMapper = session.getMapper(OrderMapper.class);
            orderMapper.insertOrder(goods_id,user_id,number,goods_total);
            //手动提交事务，防止回滚
            session.commit();
            //提示用户购买成功
            jsonObject.put("msg","商品："+goods_name+"，购买数量："+number+"，购买成功！"+",总花费："+goods_total+"元");
        }else {
            //提示用户余额不足
            jsonObject.put("msg","亲，您的用户余额不足购买，请充值余额！");
        }
        out.print(jsonObject);
        out.close();
        session.close();
    }
}
