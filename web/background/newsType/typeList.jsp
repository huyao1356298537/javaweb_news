<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/21
  Time: 9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../commons/info.jsp"%>
<html>
<head>
    <title>新闻分类</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="#"><cite>首页</cite></a>
        <a><cite>新闻分类维护</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <table class="layui-hide" id="tab" lay-filter="test"></table>

   <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container">
              <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
              <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
              <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
          </div>
      </script>

    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
</div>
<script>
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#tab'
            // Servlet 返回一个json字符串
            ,url:'<%=request.getContextPath()%>/NewsTypeServlet?action=query'
            ,toolbar: '#toolbarDemo'
            ,title: '新闻分类表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'typeId', title:'ID', width:'20%', fixed: 'left', unresize: true, sort: true}
                ,{field:'typeName', title:'分类', width:'60%'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo'}
            ]]
            ,page: true
        });

        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：'+ data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选': '未全选');
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            //console.log(obj)

            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    layer.close(index);
                    $.ajax({
                        type:"post",
                        url:"<%=request.getContextPath()%>/NewsTypeServlet",
                        data:"action=delete&typeId="+data.typeId,
                        success:function(msg){

                            /*
                               删除分类时，可以直接删除吗？不可以，因为分类下可能有信息
                            */
                            var rc = eval("("+msg+")");
                            if(rc.code=="2003"){
                                layer.msg(rc.message,{icon:2,time:2000});
                            }else{
                                //发异步删除数据
                                obj.del();
                                layer.msg(rc.message,{icon:1,time:1000});
                            }
                        }
                    });
                });
            } else if(obj.event === 'edit'){
                layer.open({
                    title: "新闻类型修改",
                    scrollbar:false,
                    type: 2,
                    skin: 'layui-layer-rim', //加上边框
                    area: ['620px', '540px'], //宽高
                    content: 'http://www.baidu.com'
                });
            }
        });
    });
</script>

</body>
</html>
