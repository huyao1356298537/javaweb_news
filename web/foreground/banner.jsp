<%@ page import="com.zr.news.service.NewsService" %>
<%@ page import="com.zr.news.entity.News" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
    <div class="col-md-9">
        <!-- Carousel  start -->
        <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="3000">
            <!-- 轮播（Carousel）指标 -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
            </ol>
            <!-- 轮播（Carousel）项目 -->
            <div class="carousel-inner" >
                <%--<div class="item active">
                    <a href="#1"><img style="overflow: hidden;" src="<%=request.getContextPath() %>/newsImg/1.jpg" alt="First slide"
                                      title="标题 1"></a>
                    <div class="text-caption">标题 1</div>
                </div>--%>
                <%
                    NewsService service = new NewsService();
                    List<News> imglist = service.findImageNews();
//                        for (News news : imglist) {
                        for (int i = 0; i < imglist.size(); i++) {
                        if(i==0){


                    %>
                     <div class="item active">
                    <a href="#<%=imglist.get(i).getNewsId()%>"><img src="<%=request.getContextPath() %>/newsImg/<%=imglist.get(i).getImageUrl()%>"
                                      alt="<%=imglist.get(i).getTitle()%>"
                                      title="<%=imglist.get(i).getTitle()%>"></a>
                    <%--  <div class="text-caption"><%=news.getTitle()%></div>--%>
                    </div>
                    <%
                        }else{
                    %>

                    <div class="item">
                        <a href="#<%=imglist.get(i).getNewsId()%>"><img src="<%=request.getContextPath() %>/newsImg/<%=imglist.get(i).getImageUrl()%>"
                                          alt="<%=imglist.get(i).getTitle()%>"
                                          title="<%=imglist.get(i).getTitle()%>"></a>
                      <%--  <div class="text-caption"><%=news.getTitle()%></div>--%>
                    </div>

                    <%
                            }
                        }
                    %>

            </div>
            <!-- 轮播（Carousel）导航 -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <!-- Carousel  end -->
        <div class="newsHeader_list">
            <%
                News headNews = service.findHeadNews();
            %>
            <div class="newsHeader">
                <h3><a href="#?<%=headNews.getNewsId() %>" title="<%=headNews.getTitle() %>">
                    <%=headNews.getTitle().length()>=8?headNews.getTitle().substring(0,8)+"...":headNews.getTitle() %>
                </a></h3>
                <p>  <%=headNews.getContext()%> ...
                    <a href="#?<%=headNews.getNewsId() %>">[查看全文]</a>
                </p>
            </div>
            <div class="currentUpdate">
                <div class="currentUpdateHeader">最近更新</div>
                <div class="currentUpdateDatas">
                    <table width="100%">
                        <%
                            List<News> newNews = service.findNewNews();
                            for (int i = 0; i <newNews.size() ; i++) {
                                String title = newNews.get(i).getTitle().length() >= 8 ? newNews.get(i).getTitle().substring(0, 8) + "..." : newNews.get(i).getTitle();
                                if(i%2==0){
                                %>
                                <tr>
                                <%
                                 }
                                %>

                                <td width="50%">
                                    <a href="#?<%=newNews.get(i).getNewsId()%>" title="<%=title %>"><%=title %></a>
                                </td>

                                <%
                                  if(i%2==1){
                                %>
                                </tr>
                                <%
                                 }
                            }
                        %>

                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="data_list hotspot_news_list">
            <div class="dataHeader">热点新闻</div>
            <div class="datas">
                <ul>

                    <%
                        List<News> hotNews = service.findHotNews();
                        if(hotNews!=null)
                            for (News news:hotNews) {
                                String title =news.getTitle().length() >= 15 ? news.getTitle().substring(0, 15) + "..." : news.getTitle();

                    %>

                    <li>
                        <a href="#?<%=news.getNewsId() %>" title="<%=news.getTitle() %>"><%=title%></a>
                    </li>
                    <%
                            }
                    %>

                </ul>
            </div>
        </div>
    </div>
</div>
