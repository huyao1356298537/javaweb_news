<%@ page import="com.zr.news.service.NewsService" %>
<%@ page import="com.zr.news.entity.News" %>
<%@ page import="java.util.List" %>
<%@ page import="com.zr.news.service.NewsTypeService" %>
<%@ page import="com.zr.news.entity.NewsType" %>
<%@ page import="com.zr.news.util.DateUtil" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/8
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>天天新闻网</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/static/css/news.css">
</head>
<body>

<div class="container">
    <%--  动态引入文件  --%>
        <jsp:include page="foreground/commons/header.jsp"></jsp:include>
        <jsp:include page="foreground/banner.jsp"></jsp:include>

        <%
       NewsService service = new NewsService();
       NewsTypeService typeService = new NewsTypeService();

        List<NewsType> typeList = typeService.findAll();
        List<List<News>> newsByType = service.findNewsByType();
       for (int i = 0; i < newsByType.size(); i++) {
            // 行开始
           if(i%3==0){
        %>
        <div class="row">
        <%
           }
        %>
            <div class="col-md-4">
                <div class="data_list news_list">
                    <div class="dataHeader"><%=typeList.get(i).getTypeName()%><span class="more"><a href="#?<%=typeList.get(i).getTypeId()%>">更多...</a></span></div>
                    <div class="datas">
                        <ul>
                            <%
                                List<News> newsList = newsByType.get(i);
                                if(newsList.get(0).getTypeId()==typeList.get(i).getTypeId())
                                    for (News news:newsList) {
                                        String date = DateUtil.formatDate(news.getPublishDate(), "yyyy-MM-dd");
                                        String title = news.getTitle().length() >= 10 ? news.getTitle().substring(0, 10) + "..." : news.getTitle();
                            %>
                            <li>
                                <a href="#?<%=news.getNewsId()%>" title="<%=news.getTitle() %>">[<%=date %>]&nbsp; <%=title%></a>
                            </li>
                            <%
                                    }
                            %>

                        </ul>
                    </div>
                </div>

            </div>

        <%
           // 行结束
           if(i%3==2 || i==newsByType.size()-1){
            %>
        </div>
            <%
           }
         }
        %>

    <jsp:include page="foreground/commons/link.jsp"></jsp:include>
    <jsp:include page="foreground/commons/footer.jsp"></jsp:include>
</div>
</body>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="<%=request.getContextPath() %>/static/js/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="<%=request.getContextPath() %>/bootstrap/js/bootstrap.min.js"></script>
<script>
    $(function(){
        var nav = document.getElementsByClassName("nav")[0];
        var olis = nav.getElementsByTagName("li");
        for (var i=0; i<olis.length;i++){
            olis[i].onclick=function (ev) {
                for (var j = 0; j <olis.length ; j++) {
                    olis[j].className="";
                }
                this.className="active";
            }
        }

    })


</script>

</html>
