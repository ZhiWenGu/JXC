<%@page import="SQLHelper.SqlHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>销售前台</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.css">
	<link rel="stylesheet" type="text/css" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.min.css">
	<script src="//cdn.bootcss.com/jquery/3.1.1/jquery.js"></script>
	<script src="//cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
	<script src="http://cdn.amazeui.org/amazeui/2.7.2/js/amazeui.js"></script>
	<script src="http://cdn.amazeui.org/amazeui/2.7.2/js/amazeui.min.js"></script>
	<script src="http://cdn.amazeui.org/amazeui/2.7.2/js/amazeui.widgets.helper.js"></script>
	<script type="text/javascript" src="http://cdn.amazeui.org/amazeui/2.7.2/js/amazeui.ie8polyfill.js"></script>
  </head>
  
  <body>
   <%if(session.getAttribute("manager")==null)
  response.sendRedirect("index.jsp"); %>
  <ul class="am-nav am-nav-pills" style="float:right;">
  <li ><a href="goods.jsp">货物管理</a></li>
  <li><a href="Pur.jsp">进货</a></li>
  <li><a href="people.jsp">人员管理</a></li>
</ul>
  <table class="am-table am-table-bordered am-table-striped am-table-hover">
    <thead>
        <tr>
            <th>用户编号</th>
            <th>姓名</th>
            <th>年龄</th>
            <th>等级</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody>
    <% SqlHelper sql = new SqlHelper();
    ResultSet res = sql.queryAllPeople();
    while(res.next()){ %>
        <tr class="am-active">
            <td><%=res.getString(1) %></td>
            <td><%=res.getString(2) %></td>
            <td><%=res.getString(3) %></td>
            <td><%=res.getString(5) %></td>
            <td><button type="button" class="am-btn am-btn-success" onclick="deletepeople('<%=res.getString(1) %>')" >删除</button></td>
        </tr>
        <%} %>
    </tbody>
</table>
<div style="text-align:center;">
<button type="button" class="am-btn am-btn-success" ><a href="addpeople.jsp">添加用户</a></button>
<script>
function deletepeople(id){
	$.post("servlet/DeletePeople",{"uid":id},function (data){
		alert(data);
	})
}
</script>
</div>
  </body>
</html>
