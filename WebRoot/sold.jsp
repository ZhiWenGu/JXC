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
	<link rel="stylesheet" type="text/css" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.min.css" >
	<script src="//cdn.bootcss.com/jquery/3.1.1/jquery.js"></script>
	<script src="//cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
	<style>
	input{
	text-align:right;
	width:300px;}</style>
  </head>
  
  <body>
  <%if(session.getAttribute("sold")==null)
  {response.sendRedirect("index.jsp");}
  else{ %>
  <label id="uid" style="float:right;">销售员<%=session.getAttribute("sold") %></label>
  <%} %>
  <div style="width:400px;margin:0 auto;text-align:center;">
    <p><label>商品编号：</label><input type="text" class="am-form-field am-round" onblur="QueryGoods()" name="goodid" id="goodid" placeholder="商品编号"/></p>
  	<p><label>购买数量：</label><input type="text" class="am-form-field am-round" onblur="computtotal()" name="goodcount" value="1" id="goodcount" placeholder="销售数量"/></p>
  	<p><label>商品名称：</label><input type="text" class="am-form-field am-round" id="goodname" placeholder="商品名称"disabled/></p>
  	<p><label>商品单价：</label><input type="text" class="am-form-field am-round" value=0 id="goodprice" placeholder="商品单价" disabled/></p>
  	<p><label>时间：</label><input type="text" class="am-form-field am-round" id="datetime" placeholder="<%=new Date() %>" disabled/></p>
  	<p><label>总计：</label><input type="text" class="am-form-field am-round" id="goodtotal" value=0 placeholder="小计" disabled/></p>
  	<P><button type="button" onclick="computersold()" class="am-btn am-btn-success am-round">&nbsp&nbsp&nbsp&nbsp结算&nbsp&nbsp&nbsp&nbsp</button></P>
  </div>
  <script type="text/javascript">
  function computersold()
  {
  var goodid = $("#goodid").val();
  var count = $("#goodcount").val();
  var uid = $("#uid").html();
  
  $.post("servlet/soldCom",{"UID":uid,"goodid":goodid,"goodcount":count},function(data){
  	if(data==1){
  	alert('结算成功');}
  	else
  	{
  		alert("结算出现了一点问题");
  	}
  });
  }
  
  function QueryGoods(){
  	var goodid = $("#goodid").val();
  	$.post("servlet/QueryGood",{"goodid":goodid},
  	function(data){
  	if(data!=0){
  	 var json = $.parseJSON(data);
		  $("#goodname").val(json["goodname"]);
		  $("#goodprice").val(json["price"]);
  	}
		 else{
		 $("#goodname").val("出现错误！！请核对商品编号");
		 }
  	});
  }
  	function computtotal(){
  		var price = $("#goodprice").val();
  		var count = $("#goodcount").val();
  		var total =price*count;
  		$("#goodtotal").val(total);
  	}
  </script>
  </body>
</html>