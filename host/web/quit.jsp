<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/8/15
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="room.roomDao,room.room" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>退房</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap-3.3.7-distcss/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap-3.3.7-distcsscss/recordSearchResult.css">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/bootstrap-3.3.7-distcssjs/bootstrap-paginator.min.js"></script>
</head>
<body style="background: url(images/1.jpg)" >
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" >酒店管理系统</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li>
                <% if(session.getAttribute( "name")!=null){
                    session.setAttribute("name",session.getAttribute("name"));
                %>
                <h4 class="text-success text-left">
                    你好，管理员
                </h4>
                <a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span> 注销</a>
                <%}else{%>
                <a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a>
                <%}%>
            </li>
        </ul>
    </div>
</nav>  
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="main.jsp">房间管理系统</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <% if(session.getAttribute( "name")!=null) {%>
                <li class="active"><a href="add.jsp">添加房间</a></li>
                <li class="active"><a href="search.jsp">房间搜索</a></li>
                <li class="active"><a href="count.jsp">下单结算</a></li>
                <li class="active"><a href="quit.jsp">退房处理</a></li>
                <li class="active"><a href="order.jsp">预定房间</a></li>
                <%}else {%>
                <li class="active"><a href="main.jsp">添加房间</a></li>
                <li class="active"><a href="main.jsp">房间搜索</a></li>
                <li class="active"><a href="main.jsp">下单结算</a></li>
                <li class="active"><a href="main.jsp">退房处理</a></li>
                <li class="active"><a href="main.jsp">预定房间</a></li>
                <%}%>
            </ul>
        </div>
    </div>
</nav>
<form id="q" method="post" action="q" >
    <div class="input-group">
        <span class="input-group-addon">房间号</span>
        <input type="text" class="form-control" placeholder="room" name="room" style="width: 200px;">
    </div>
    <button type="submit" class="btn btn-info">提交</button>
</form>
<br>
<div style="overflow:auto;">
    <table class="table">
        <thead>
        <tr>
            <th>room/房间号</th>
            <th>num/人数</th>
            <th>price/价格</th>
        </tr>
        </thead>
        <% roomDao dao=new roomDao(); List<room> list =dao.readFirstTitle(); for(room r:list) { if(r.getIs()==1){%>
        <tr class="danger">
            <td>
                <%=r.getRoom() %>
            </td>
            <td>
                <%=r.getNum() %>
            </td>
            <td>
                <%=r.getMoney() %>
            </td>
        </tr>
        <%}else if(r.getIs()==0){ %>
        <tr class="success">
            <td>
                <%=r.getRoom() %>
            </td>
            <td>
                <%=r.getNum() %>
            </td>
            <td>
                <%=r.getMoney() %>
            </td>
        </tr>
        <%}}%>
    </table>
</div>
</body>

</html>
