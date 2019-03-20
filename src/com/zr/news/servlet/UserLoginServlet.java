package com.zr.news.servlet;

import com.alibaba.fastjson.JSONObject;
import com.zr.news.dao.daoimpl.UserDaoImpl;
import com.zr.news.entity.ResultCode;
import com.zr.news.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author : 张晋飞
 * date : 2019/3/19
 */
@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        System.out.println("UserLoginServlet.post.....");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println("UserLoginServlet.post....."+username+"======="+password);
        UserDaoImpl dao =  new UserDaoImpl();
        User user = dao.queryOne(username);
        ResultCode rc = null;
        if(user!=null){
            //用户名正确
          //  rc = new ResultCode("1001","用户名正确");
            if(user.getPassword().equals(password)){
                //密码正确
                rc = new ResultCode("1001","登录成功");
            }else{
                //密码不正确
                rc = new ResultCode("1002","密码不正确");
            }
        }else{
            //用户名不存在
            rc = new ResultCode("1000","你是不是不知道账号密码！？？？");
        }
        response.getWriter().print(JSONObject.toJSONString(rc));

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
