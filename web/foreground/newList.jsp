<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="data_list ">
<div id="newsListNav">
    ${newsListNav}
</div>
    <div class="datas type_news_list" >
        <ul>
            <c:forEach items="${newsList}" var="news">
                <li>
                    <a  href="NewsServlet?action=queryOne&newsId=${news.newsId}" title="${news.title}">
                        [ <fmt:formatDate value="${news.publishDate}" pattern="yyyy-MM-dd"/> ]&nbsp;
                            ${fn:substring(news.title, 0, 15)}
                    </a>
                </li>
            </c:forEach>
        </ul>
    </div>
<div class="newListPage">
    ${newListPager}
</div>
</div>