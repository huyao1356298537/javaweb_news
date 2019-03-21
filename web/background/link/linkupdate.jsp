<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/20
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>天天新闻</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <%@include file="../commons/info.jsp"%>
</head>

<body>
<div class="x-body">
    <form class="layui-form">
        <div class="layui-form-item">
            <label for="linkId" class="layui-form-label">
                <span class="x-red"></span>
            </label>
            <div class="layui-input-inline">
                <input value="${link.linkId}" type="hidden" id="linkId" name="linkId" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="linkName" class="layui-form-label">
                <span class="x-red">*</span>链接名称
            </label>
            <div class="layui-input-inline">
                <input value="${link.linkName}" type="text" id="linkName" name="linkName" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="linkUrl" class="layui-form-label">
                <span class="x-red">*</span>链接地址
            </label>
            <div class="layui-input-inline">
                <input value="${link.linkUrl}" type="url" id="linkUrl" name="linkUrl" required="" lay-verify="url"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="email" class="layui-form-label">
                <span class="x-red">*</span>联系方式
            </label>
            <div class="layui-input-inline">
                <input  value="${link.email}" type="email" id="email" name="email" required="" lay-verify="email"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="linkOrder" class="layui-form-label">
                <span class="x-red">*</span>链接排名
            </label>
            <div class="layui-input-inline">
                <input  value="${link.linkOrder}" type="number" id="linkOrder" name="linkOrder" required="" lay-verify="number"
                       autocomplete="off" class="layui-input">
            </div>

        </div>

        <div class="layui-form-item">
            <label  class="layui-form-label">
            </label>
            <button  class="layui-btn" lay-filter="update" lay-submit="">
                修改
            </button>
        </div>
</form>
</div>
<script>
    layui.use(['form','layer'], function(){
        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer;
        //监听提交
        form.on('submit(update)', function(data){
            var linkId=data.field.linkId;
            var linkName=data.field.linkName;
            var linkUrl=data.field.linkUrl;
            var email=data.field.email;
            var linkOrder=data.field.linkOrder;
            console.log(data)
            $.ajax({
                type:"post",
                url:"<%=request.getContextPath()%>/LinkServlet",
                data:{
                    "action":"update",
                    "linkId":linkId,
                    "linkName":linkName,
                    "linkUrl":linkUrl,
                    "email":email,
                    "linkOrder":linkOrder
                },
                success:function(msg){
                      if(msg=="1"){
                          //发异步，把数据提交给java
                          layer.alert("修改成功", {icon: 6},function () {
                              // 获得frame索引
                              var index = parent.layer.getFrameIndex(window.name);
                              //关闭当前frame
                              parent.layer.close(index);
                              window.parent.location.reload();
                          });
                      }else{
                          layer.msg("信息不存在，修改失败")
                      }
                },
                error:function () {
                    layer.msg("修改异常")
                }
            })
            return false;
        });
    });
</script>
</body>

</html>