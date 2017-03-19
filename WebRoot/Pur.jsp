<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
	<link rel="stylesheet" type="text/css" href=“http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.min.css">
	<script src="//cdn.bootcss.com/jquery/3.1.1/jquery.js"></script>
	<script src="//cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
  </head>
  
  <body>
     <%if(session.getAttribute("manager")==null)
  response.sendRedirect("index.jsp"); %>
  <div style="width:400px;margin:0 auto;text-align:center;">
  <p><input type="text" class="am-form-field am-round" name="goodid" id="purid" placeholder="进货商编号"/></p>
    <p><input type="text" class="am-form-field am-round" onblur="QueryGoods()" name="goodid" id="goodid" placeholder="商品编号"/></p>

  	<p><input type="text" class="am-form-field am-round" onblur="computtotal()" name="goodcount" id="goodcount" placeholder="进货数量"/></p>
  	    <p><input type="text" class="am-form-field am-round" name="goodcount" id="goodprice" placeholder="单价" disable/></p>
  	<p><input type="text" class="am-form-field am-round" id="goodname" placeholder="商品名称" /></p>
  	<p><input type="text" class="am-form-field am-round" id="datetime" placeholder="<%=new Date() %>" disabled/></p>
  	<p><input type="text" class="am-form-field am-round" id="goodtotal" placeholder="小计" disabled/></p>
  	<P><button type="button" onclick="computerpur()" class="am-btn am-btn-success am-round">&nbsp&nbsp进货&nbsp&nbsp</button></P>
  </div>
  <script type="text/javascript">
   function computerpur()
  {
  var goodid = $("#goodid").val();
  var count = $("#goodcount").val();
  var pur = $("#purid").val();
  
  $.post("servlet/Pur",{"pur":pur,"goodid":goodid,"goodcount":count},function(data){
  	if(data==1){
  	alert('进货成功');}
  	else
  	{
  		alert("进货出现了一点问题");
  	}
  });
  }
  
  function QueryGoods(){
  	var goodid = $("#goodid").val();
  	$.post("servlet/QueryGoodPur",{"goodid":goodid},
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
