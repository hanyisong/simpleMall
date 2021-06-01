package com.Admin.UserManage.ReturnGoods;

import com.Admin.UserManage.entity.ReturnGoods;
import com.Admin.mapper.OrderMapper;
import com.User.mapper.UserMapper;
import com.util.GetSqlSession;
import net.sf.json.JSONObject;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/AllReturnGoodsList")
public class AllReturnGoodsList extends HttpServlet {
    @Override
    public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");
        JSONObject jsonObject = new JSONObject();
        PrintWriter out = response.getWriter();
        SqlSession session = GetSqlSession.createSqlSession();
        //获得当前用户退货单集合
        OrderMapper orderMapper = session.getMapper(OrderMapper.class);
        List<ReturnGoods> list =  orderMapper.QueryReturnGoods();
        List<ReturnGoods> finishList = new ArrayList<>();//已退货
        List<ReturnGoods> finishedList =  new ArrayList<>();//未退货
        for(ReturnGoods returnGoods:list){
            if(returnGoods.getState().equals("3")){
                returnGoods.setState("正在退货");
                finishedList.add(returnGoods);
            }else if(returnGoods.getState().equals("2")){
                returnGoods.setState("已退货");
                finishList.add(returnGoods);
            }
        }
        String flag = request.getParameter("flag");
        if(flag.equals("0")){
            jsonObject.put("list",finishedList);
        }else {
            jsonObject.put("list",finishList);
        }
        out.print(jsonObject);
        out.close();
        session.close();
    }

}
