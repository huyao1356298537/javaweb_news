<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="row">
        <div class="col-md-12">
            <div class="link ">
                <div class="linkHeader ">友情链接</div>
                <div class="datas">
                    <ul>

                       <c:forEach var="link" items="${linkList}">
                        <li>
                            <a href="${link.linkUrl}" target="_blank ">${link.linkName}</a>
                        </li>
                       </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
</div>
