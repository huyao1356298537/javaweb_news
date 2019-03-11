<%@ page import="com.zr.news.service.NewsTypeService" %>
<%@ page import="com.zr.news.entity.NewsType" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
    <div class="col-md-8">
        <a href="toIndex">
            <img src="<%=request.getContextPath() %>/static/img/logo.png" alt="天天新闻" />
        </a>
    </div>
    <div class="col-md-4"></div>
</div>
<div class="row">
    <div class="col-md-12">
        <nav class="navbar navbar-default navbar-static-top">
            <div class="container">
                <ul class="nav nav-pills">
                    <li class="active">
                        <a href="#">首页</a>
                    </li>
                   <%
                       NewsTypeService service = new NewsTypeService();
                       List<NewsType> list = service.findAll();
                       if(list!=null){
                           for (NewsType newsType:list) {
                   %>
                    <li>
                        <a href="#?<%=newsType.getTypeId() %>"><%=newsType.getTypeName() %></a>
                    </li>
                    <%
                            }
                        }
                    %>
                </ul>
            </div>
        </nav>
    </div>
</div>
