<%@page import="java.sql.ResultSet"%>
<%@page import="SQLHelper.SqlHelper"%>
<%@ page language="java" import="java.util.*,SQLHelper.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" />
    <script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        a {
            font-size: large;
            text-decoration: none;
        }

        h1 {
            color: #0e88eb;
        }

        h2 {
            font-size: medium;
        }

        .signin {
            margin: 0 auto;
            width: 300px;
            height: 510px;
            vertical-align: middle;
        }

        .col-sm-10 {
            width: 100%;
        }

        .test {
            text-align: center;
            width: 100%;
            height: 100%;
            margin: 0 auto;
            vertical-align: middle;
        }
    </style>
    <base href="<%=basePath%>">
    
    <title>进销存</title>
  </head>
  
  <body>

    <div class="test">
        <h1><strong>Lover</strong></h1>
        <h2><strong>红星超市进销存管理系统</strong></h2>
        <hr width="300px" style="margin-top: 0;" />
        <form id="form1" action="login.jsp" method="get" class="form-horizontal" role="form">
            <div class="signin" id="signin">


                <div class="form-group">

                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="signin-phone" name="UID"
                            placeholder="用户ID">
                    </div>
                </div>
                <div class="form-group">

                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="signin-password" name="pwd"
                            placeholder="密码">
                    </div>
                </div>
                <div class="form-group">
                    <div class=" col-sm-10" style="text-align: center">
                        <button type="submit" class="btn btn-default" style="width: 80%; background-color: #5bb8ff; color: white;">登录</button>
                    </div>

                </div>

            </div>

            <!------------------------------------------------------------------------------------------>
          

        </form>

    </div>
  </body>
</html>
