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
                    <li>
                        <a href="#">娱乐新闻</a>
                    </li>
                    <li>
                        <a href="#">政治新闻</a>
                    </li>
                    <li>
                        <a href="#">经济新闻</a>
                    </li>
                    <li>
                        <a href="news?action=list&typeId=4">文化新闻</a>
                    </li>
                    <li>
                        <a href="news?action=list&typeId=5">小道新闻</a>
                    </li>
                    <li>
                        <a href="news?action=list&typeId=6">屌炸天新闻</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>
