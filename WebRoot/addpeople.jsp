<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addgood.jsp' starting page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.css">
	<link rel="stylesheet" type="text/css" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.min.css">
	<script src="//cdn.bootcss.com/jquery/3.1.1/jquery.js"></script>
	<script src="//cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
	<style>
		input{
		text-align:center;}
	</style>
  </head>
  
  <body>
    <ul class="am-nav am-nav-pills" style="float:right;">
  <li ><a href="goods.jsp">货物管理</a></li>
  <li><a href="Pur.jsp">进货</a></li>
  <li><a href="people.jsp">人员管理</a></li>
</ul>
    <div style="width:400px;margin:0 auto;text-align:center;">
  	<p><label>姓名：</label><input type="text" class="am-form-field am-round" id="name" placeholder="姓名"/></p>
  	<p><label>年龄：</label><input type="text" class="am-form-field am-round" id="age" placeholder="年龄" /></p>
  	<p><label>密码：</label><input type="text" class="am-form-field am-round"  id="pwd" placeholder="密码" /></p>
  	<p><label>等级：</label><input type="text" class="am-form-field am-round" id="rank" placeholder="等级" /></p>
  	<P><button type="button" onclick="addgood()"  class="am-btn am-btn-success am-round">&nbsp&nbsp&nbsp&nbsp添加用户&nbsp&nbsp&nbsp&nbsp</button></P>
  </div>
  <script>
  	function addgood(){
  		var goodname = $("#name").val();
  		var pprice = $("#age").val();
  		var sprice = $("#pwd").val();
  		var count = $("#rank").val();
  		$.post("servlet/addpeople",{"name":goodname,"age":pprice,"pwd":sprice,"rank":count},function(data){
  			alert(data);
  		})
  	}
  </script>
  </body>
</html>
