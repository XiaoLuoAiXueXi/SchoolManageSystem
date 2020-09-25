<%--
  Created by IntelliJ IDEA.
  User: Ziye Luo
  Date: 2020/9/18
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>所有打卡信息</title>
</head>
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="easyui/css/demo.css">

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
<script type="text/javascript">
    $(function() {
        $("#dataList").datagrid({
            title:'课程列表',
            iconCls:'icon-more',//图标
            border: true,
            collapsible: false,//是否可折叠的
            fit: true,//自动大小
            method: "post",
            url:"HealthServlet?method=PersonList&t="+new Date().getTime(),
            idField:'id',
            singleSelect: true,//是否单选
            pagination: false,//分页控件
            rownumbers: true,//行号
            sortName:'id',
            sortOrder:'DESC',
            remoteSort: false,
            columns: [[
                //{field:'chk',checkbox: true,width:50},
                {field:'id',title:'ID',width:50, sortable: true},
                {field:'date',title:'日期',width:200},
                {field:'location',title:'地点',width:200},
                {field:'state',title:'健康情况',width:200},
            ]],
            toolbar: "#toolbar"
        });
    })
</script>


<body>
<p>所有打卡信息</p>
<table id="dataList" cellspacing="0" cellpadding="0">

</table>
<!-- 工具栏 -->
<div id="toolbar">
    <div style="float: left;"><a id="add" href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a></div>
    <div style="float: left;" class="datagrid-btn-separator"></div>
    <div><a id="delete" href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-some-delete',plain:true">删除</a></div>
</div>
</body>
</html>
