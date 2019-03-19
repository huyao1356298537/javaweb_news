package com.zr.news.util;

import com.zr.news.entity.NewsType;

/**
 * @author : 张晋飞
 * date : 2019/3/18
 */
public class NavUtil {

    public static  String getNavNewsListByType(NewsType newsType){
        StringBuffer sb = new StringBuffer("<ul class=\"breadcrumb\">");

         sb.append("<li><a href=\"goIndex\">主页</a></li>");
         sb.append("<li><a href=\"NewsServlet?action=query&typeId="+newsType.getTypeId()+"\">"+newsType.getTypeName()+"</a></li>");
        sb.append("</ul>");
        return sb.toString();
    }
    public static  String getavNewsById(int typeId,String typeName,String title){
        StringBuffer sb = new StringBuffer("<ul class=\"breadcrumb\">");

         sb.append("<li><a href=\"goIndex\">主页</a></li>");
         sb.append("<li><a href=\"NewsServlet?action=query&typeId="+typeId+"\">"+typeName+"</a></li>");
         sb.append("<li class=\"active\">"+title+"</li>");

         sb.append("</ul>");
        return sb.toString();
    }

}
