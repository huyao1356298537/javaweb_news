package com.zr.news.servlet;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.zr.news.dao.NewsDao;
import com.zr.news.dao.NewsTypeDao;
import com.zr.news.dao.daoimpl.NewsDaoImpl;
import com.zr.news.dao.daoimpl.NewsTypeDaoImpl;
import com.zr.news.entity.NewsType;
import com.zr.news.entity.ResultCode;
import com.zr.news.service.NewsTypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author : 张晋飞
 * date : 2019/3/21
 */
@WebServlet(name = "NewsTypeServlet",urlPatterns = "/NewsTypeServlet")
public class NewsTypeServlet extends HttpServlet {
    NewsTypeService service = new NewsTypeService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String action = request.getParameter("action");
        System.out.println(action);
        if("query".equals(action)){
            query(request,response);
        }else if("add".equals(action)){
            add(request,response);
        }else if("update".equals(action)){
            update(request,response);
        }else if("delete".equals(action)){
            delete(request,response);
        }else if("deleteAll".equals(action)){
            deleteAll(request,response);
        }else if("queryOne".equals(action)){
            queryOne(request,response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }


    protected void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<NewsType> typeList = service.findAll();
        JSONArray jsonArr = (JSONArray)JSONArray.toJSON(typeList);

        JSONObject array=new JSONObject();
        array.put("code",0);
        array.put("msg","");
        array.put("count",typeList.size());
        array.put("data",jsonArr);
        response.getWriter().print(array);

    }

    protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String typeId = request.getParameter("typeId");
        int id = Integer.parseInt(typeId);
        NewsDao newsDao = new NewsDaoImpl();
        int newsCount = newsDao.findNewsCountByType(id);
        ResultCode resultCode =  new ResultCode();

        if(newsCount==0){
            NewsTypeDao dao = new NewsTypeDaoImpl();
            int i = dao.deleteNewsType(id);
            if(i>0){
                resultCode.setCode("2001");
                resultCode.setMessage("新闻类型删除成功");
            }else{
                resultCode.setCode("2002");
                resultCode.setMessage("新闻类型已删除或不存在");
            }
        }else{
            resultCode.setCode("2003");
            resultCode.setMessage("新闻类型下有新闻不可删除");
        }
        String json = JSONObject.toJSONString(resultCode);
        System.out.println(json);
        response.getWriter().print(json);
    }

    protected void deleteAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void queryOne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
