<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="data_list ">
<div id="newsListNav">
    ${newsNav}
</div>
    <div class="datas" >
        <input type="hidden" id="newsId" value="${news.newsId}">
        <h3 class="news_title" style="text-align: center;">${news.title}</h3>
        <div class="row news_info" style="text-align: center;">
           <div class="col-md-4">
               日期：【<fmt:formatDate value="${news.publishDate}" type="date" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>】
           </div>
            <div class="col-md-4">
                作者：${news.author}
            </div>
            <div class="col-md-4">
                访问次数：[${news.click}]
            </div>
        </div>
        <div class="news_content" style="margin-top: 10px;margin-bottom: 20px; padding: 10px;">
        ${news.context}
        </div>
    </div>
<div class="newsUpAndDown">
    ${newsUpAndDown}
</div>
<div style="border-top: 1px dashed black" >
       <h4>发表评论</h4>
       <textarea wrap="virtual" maxlength="200" style="resize:none;width:90%;height: 100px;
       border:1px solid gray; margin: 10px 30px; padding: 10px;
       border-radius: 5px" id="comment_text"></textarea>
       <div>
           <input style="float: right;margin: 10px;" type="button" class="btn btn-primary" value="评论提交"/>
       </div>
       <div class="comment-list" style="clear: both">
           <ul class="list-group">
              <c:forEach items="${commentList}" var="comment">
                  <li class="list-group-item" style='word-break: break-all;'><b>${comment.ipAddr}:[<fmt:formatDate value="${comment.commentDate}" pattern="yyyy-MM-dd HH:mm:ss"  />]:</b>${comment.content}</li>
              </c:forEach>
           </ul>
       </div>
</div>

    <script>
        $(function() {

            $("input[value=评论提交]").click(function () {
                var strContent = $("#comment_text").val();
             if(strContent.trim()==""){
                 alert("请在评论区写入信息")
                 return;
             }
                $.ajax({
                    type:"post",
                    url:"CommentServlet",
                    data:"action=add&newsId="+$("#newsId").val()+"&content="+strContent,
                    success:function(msg){
                        if(msg!=""){
                            //如果成功就评论一下
                            alert("评论成功！");
                            // 清空评论框
                            $("#comment_text").val("");
                            // 后台传的是json字符串  将json字符串转为js对象
                            var comment = eval("("+msg+")");
                            // 获取到的时间
                            var commentDate = getcommentDate(comment.commentDate);

                            // 用jquery创建一个li标签
                            var oLi = $("<li class='list-group-item' style='word-break: break-all;'><b>"+comment.ipAddr+":["+commentDate+"]:</b>"+comment.content+"</li>");
                            if($(".list-group").children().length==0){
                                $(".list-group").append(oLi)
                            }else{
                                $(oLi).insertBefore($(".list-group").children().eq(0));
                            }
                        }
                    }
                })
            })
        })

        function getcommentDate(commentDate){
            var date = new Date(commentDate);
            var year = date.getFullYear();
            var month = date.getMonth()+1;
            var day = date.getDate();


            var hours = date.getHours();
            var minutes = date.getMinutes();
            var seconds = date.getSeconds();

            month = getStNumberr(month)
            day = getStNumberr(day)
            hours = getStNumberr(hours)
            minutes = getStNumberr(minutes)
            seconds = getStNumberr(seconds)
            return year+"-"+month+"-"+day+" "+hours+":"+minutes+":"+seconds;
        }

        function getStNumberr(num) {
            if(num<10){
                num="0"+num;
            }
            return num;

        }





    </script>

</div>