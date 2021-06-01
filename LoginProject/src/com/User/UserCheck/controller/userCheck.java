package com.User.UserCheck.controller;

import com.User.entity.User;
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
import java.lang.reflect.Field;

@WebServlet("/userCheck")
public class userCheck extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");

        String user_name = request.getParameter("user_name");
        JSONObject jsonObject = new JSONObject();
        PrintWriter out = response.getWriter();
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        User user = userMapper.queryUser(user_name);
        jsonObject.put("flag",true); //默认关闭对话框
        if(user.getUser_tel() == null || user.getReal_name() == null || user.getUser_address() == null || user.getUser_age() == -999){
            //获得的user对象的int类型默认为0，可通过修改实体默认值为-999
            jsonObject.put("flag",false);
        }
//        //遍历User对象的所有属性值
//        Class cls = user.getClass();
//        Field[] fields = cls.getDeclaredFields();
//        for(int i=0; i<fields.length; i++){
//            Field f = fields[i];
//            //在Java中可以通过反射进行获取实体类中的字段值，当未设置Field的setAccessible方法为true时，
//            // 会在调用的时候进行访问安全检查，会抛出IllegalAccessException异常
//            f.setAccessible(true);
//            try{
//                if(f.get(user)==null){ //找到空值则打开对话框
//                    jsonObject.put("flag",false);
//                    System.out.println(f.get(user));
//                    break;
//                }
//            }catch (Exception e){
//                e.printStackTrace();
//            }
//        }
        session.close();
        out.print(jsonObject);
        out.close();
    }
}
