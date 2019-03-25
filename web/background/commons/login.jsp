<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/19
  Time: 17:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台登录-天天新闻</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />

    <link rel="stylesheet" href="../../static/css/font.css">
    <link rel="stylesheet" href="../../static/css/xadmin.css">
    <script type="text/javascript" src="../../static/js/jquery.min.js"></script>
    <script src="../../static/layui/layui.js" charset="utf-8"></script>
    <script src="../../static/js/xadmin.js"></script>
</head>
<body class="login-bg">

<div class="login layui-anim layui-anim-up">
    <div class="message">天天新闻1.0-管理登录</div>
    <div id="darkbannerwrap"></div>

    <form method="post" class="layui-form" >
        <input name="username" placeholder="用户名"  type="text" lay-verify="username" class="layui-input" >
        <hr class="hr15">
        <input name="password" lay-verify="password" placeholder="密码"  type="password" class="layui-input">
        <hr class="hr15">
        <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
        <hr class="hr20" >
    </form>
</div>

<script>
    $(function  () {
        layui.use('form', function(index){
            var form = layui.form;
            form.verify({
                username: function(value, item){ //value：表单的值、item：表单的DOM对象
                    if(!new RegExp("^[a-zA-Z][a-zA-Z0-9_]{4,15}$").test(value)){
                        return '用户名字母开头，允许5-16字节，允许字母数字下划线';
                    }
                }
                //我们既支持上述函数式的方式，也支持下述数组的形式
                //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
                ,password: [
                    /^[a-zA-Z]\w{5,17}$/,'密码以字母开头，长度在6~18之间，只能包含字母、数字和下划线'
                ]
            });
            //监听提交
            form.on('submit(login)', function(data){
                $.ajax({
                    type: "POST",
                    url: "<%=request.getContextPath()%>/UserLoginServlet",
                    data: "username="+data.field.username+"&password="+data.field.password,
                    success: function(msg){
                        var obj = eval("("+msg+")");
                        if(obj.code=="1001"){
                            layer.msg(obj.message,function(){
                                location.href='backgroundIndex.jsp'
                            })
                            if(${username!=null}){
                                // 获得frame索引
                                var index = parent.layer.getFrameIndex(window.name);
                                //关闭当前frame
                                parent.layer.close(index);
                                window.parent.location.reload();
                            }
                        }else{
                            layer.msg(obj.message);
                        }
                    }
                });
                return false;
            });
        });
    })
</script>
<!-- 底部结束 -->
</body>
</html>