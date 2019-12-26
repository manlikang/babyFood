<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/13
  Time: 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="<%=request.getContextPath()%>/">
    <link rel="stylesheet" href="back/style/layui/css/layui.css">
    <script type="text/javascript" src ="back/style/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src ="back/style/layui/layui.js"></script>
    <title>Title</title>
</head>

<body>

</body>
<div style="height: 300px;width: 600px;padding-left: 700px;padding-top: 300px"><p style="font-size: 20px">很抱歉,您不是管理员,<span id="ddd" style="color:#FF5722 ">3</span>秒后跳转至<a style="color: #01AAED" href="/front/index.jsp">首页</a></p></div>
<script>

    var time = 3;
    $("#ddd").html(time);
    setTimeout(function () {
        location="front/index.jsp";
    },3000);

    setInterval(function () {
        if(time>0) {
            time = time - 1;
            $("#ddd").html(time);

        }
    },1000);


</script>
</html>
