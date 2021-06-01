package com.Admin.TypeManage.controller;

import com.Admin.LibManage.service.DeleteLibService;
import com.Admin.TypeManage.service.DeleteTypeService;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/DeleteType")
public class DeleteType extends HttpServlet {
    DeleteTypeService deleteTypeService = new DeleteTypeService();
    @Override
    public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");

        String id = request.getParameter("type_id");
        int Id = Integer.parseInt(id);
        int num = deleteTypeService.delete(Id);
        JSONObject jsonObject = new JSONObject();
        if(num>0){
            jsonObject.put("flag",true);
        }else{
            jsonObject.put("flag",false);
        }
        PrintWriter out = response.getWriter();
        out.print(jsonObject);
        out.close();
    }


}
