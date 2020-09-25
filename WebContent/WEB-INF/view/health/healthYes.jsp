<%@ page import="com.lizhou.tools.DateTool" %>
<%@ page import="com.lizhou.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: Ziye Luo
  Date: 2020/9/18
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>健康打卡</title>
</head>
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="easyui/css/demo.css">
<link href="h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="h-ui/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="h-ui/lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
<link href="h-ui/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    .table th{font-weight:bold}
    .table th,.table td{padding:8px;line-height:20px}
    .table td{text-align:left}
    .table-border{border-top:1px solid #ddd}
    .table-border th,.table-border td{border-bottom:1px solid #ddd}
    .table-bordered{border:1px solid #ddd;border-collapse:separate;*border-collapse:collapse;border-left:0}
    .table-bordered th,.table-bordered td{border-left:1px solid #ddd}
    .table-border.table-bordered{border-bottom:0}
    .table-striped tbody > tr:nth-child(odd) > td,.table-striped tbody > tr:nth-child(odd) > th{background-color:#f9f9f9}
</style>
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/js/validateExtends.js"></script>
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="easyui/css/demo.css">

<script>
    $(function(){
        //单击按钮提交表单
        $("#butSure").click(function () {
            $.ajax({
                type: "post",
                url: "HealthServlet?method=assign",
                data: $("#form").serializeArray(),//form都是用txt的格式提交的
                dataType: "json", //返回数据类型
                success: function(msg) {
                    if(msg=="success")
                        $.messager.alert("消息提醒","提交成功!","info");
                    else if(msg=="fail"){
                        $.messager.alert("消息提醒","提交失败!","info");
                        $("input[id='HealthState']").val("");
                        $("input[id='tolocal']").val("");
                    }
                }
                })
        });
    })
</script>
<body>
<div>
    <p>每日健康填报</p>
    <%
        User user=(User)request.getSession().getAttribute("user");
        int id=user.getId();
    %>
    <form id="form" method="post">
        <div id="userName" style="text-align:center; ">
            <input class="easyui-textbox" AutoSize="false" data-options=""
                   value=<%=id%> style="height:80px;width:400px;" ><br>
        </div>>

        <div id="HealthState" style="text-align:center; padding: 30px " >
            <input class="easyui-textbox" AutoSize="false" data-options=""
                   value="luoziye" style="height:80px;width:400px;" ><br>
        </div>


        <div id="tolocal" style="text-align:center; padding: 30px " >
            <input class="easyui-textbox" AutoSize="false" data-options=""
                   style="height:80px;width:400px;" ><br>
        </div>

        <div id="todate" style="text-align:center; padding: 30px " >
            <input class="easyui-textbox" AutoSize="false" data-options=""
                   value=<%=DateTool.getToday()%> style="height:80px;width:400px;" ><br>
        </div>
        <div class="formControls col-8 col-offset-3">
            <input id="butSure" class="btn btn-default radius" type="button" value="提交">
        </div>
    </form>

</div>
</body>
</html>
