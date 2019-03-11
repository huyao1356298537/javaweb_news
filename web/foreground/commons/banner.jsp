<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
    <div class="col-md-9">
        <!-- Carousel  start -->
        <div id="myCarousel" class="carousel slide">
            <!-- 轮播（Carousel）指标 -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
            </ol>
            <!-- 轮播（Carousel）项目 -->
            <div class="carousel-inner">
                <div class="item active">
                    <a href="#1"><img style="overflow: hidden;" src="<%=request.getContextPath() %>/newsImg/1.jpg" alt="First slide"
                                      title="标题 1"></a>
                    <div class="text-caption">标题 1</div>
                </div>
                <div class="item">
                    <a href="#2"><img style="overflow: hidden;" src="<%=request.getContextPath() %>/newsImg/2.jpg" alt="Second slide"
                                      title="标题 2"></a>
                    <div class="text-caption">标题 2</div>
                </div>
                <div class="item">
                    <a href="#3"><img style="overflow: hidden;" src="<%=request.getContextPath() %>/newsImg/3.jpg" alt="Third slide"
                                      title="标题 3"></a>
                    <div class="text-caption">标题 33333333333333</div>
                </div>
                <div class="item">
                    <a href="#4"><img style="overflow: hidden;" src="<%=request.getContextPath() %>/newsImg/4.jpg" alt="Third slide"
                                      title="标题 4"></a>
                    <div class="text-caption">标题 33333333333333</div>
                </div>
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
            <div class="newsHeader">
                <h3><a href="news?action=show&newsId=104" title="香港少女穿热裤短裙便利店偷零食被捕2">香港少女穿热裤短裙便</a></h3>
                <p>  中新网月日电据香港《文汇报》报道，香港牛头角彩盈鸷发生店铺盗窃案，名少年男女...
                    <a href="news?action=show&newsId=104">[查看全文]</a>
                </p>
            </div>
            <div class="currentUpdate">
                <div class="currentUpdateHeader">最近更新</div>
                <div class="currentUpdateDatas">
                    <table width="100%">
                        <tr>
                            <td width="50%">
                                <a href="news?action=show&newsId=105" title="吊">吊</a>
                            </td>
                            <td width="50%">
                                <a href="news?action=show&newsId=104" title="香港少女穿热裤短裙便利店偷零食被捕2">香港少女穿热裤短裙便利店</a>
                            </td>
                        </tr>
                        <tr>
                            <td width="50%">
                                <a href="news?action=show&newsId=103"
                                   title="昆明火车站暴恐案直击:暴徒见人就砍现场混乱血腥">昆明火车站暴恐案直击:暴</a>
                            </td>
                            <td width="50%">
                                <a href="news?action=show&newsId=102" title="西安幼儿园被指近3年都给孩子吃过药">西安幼儿园被指近3年都给</a>
                            </td>
                        </tr>
                        <tr>
                            <td width="50%">
                                <a href="news?action=show&newsId=94" title="小道新闻1">小道新闻1</a>
                            </td>
                            <td width="50%">
                                <a href="news?action=show&newsId=95" title="小道新闻5">小道新闻5</a>
                            </td>
                        </tr>
                        <tr>
                            <td width="50%">
                                <a href="news?action=show&newsId=96" title="小道新闻5">小道新闻5</a>
                            </td>
                            <td width="50%">
                                <a href="news?action=show&newsId=97" title="小道新闻5">小道新闻5</a>
                            </td>
                        </tr>
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
                    <li>
                        <a href="news?action=show&newsId=104" title="香港少女穿热裤短裙便利店偷零食被捕2">香港少女穿热裤短裙便利店偷零食</a>
                    </li>
                    <li>
                        <a href="news?action=show&newsId=103" title="昆明火车站暴恐案直击:暴徒见人就砍现场混乱血腥">昆明火车站暴恐案直击:暴徒见人</a>
                    </li>
                    <li>
                        <a href="news?action=show&newsId=102" title="西安幼儿园被指近3年都给孩子吃过药">西安幼儿园被指近3年都给孩子吃</a>
                    </li>
                    <li>
                        <a href="news?action=show&newsId=53" title="娱乐新闻2">娱乐新闻2</a>
                    </li>
                    <li>
                        <a href="news?action=show&newsId=52" title="娱乐新闻1">娱乐新闻1</a>
                    </li>
                    <li>
                        <a href="news?action=show&newsId=51" title="马来西亚巫师作法再寻失联飞机：这次更奇葩">马来西亚巫师作法再寻失联飞机：</a>
                    </li>
                    <li>
                        <a href="news?action=show&newsId=50" title="汪峰是互联网上名副其实的King">汪峰是互联网上名副其实的Kin</a>
                    </li>
                    <li>
                        <a href="news?action=show&newsId=49" title="2133啊">2133啊</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
