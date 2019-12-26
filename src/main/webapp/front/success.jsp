<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <base href="<%=request.getContextPath()%>/">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>付款成功页面</title>
    <link rel="stylesheet" type="text/css" href="back/style/AmazeUI-2.4.2/assets/css/amazeui.css"/>
    <link href="back/style/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="back/style/basic/css/demo.css" rel="stylesheet" type="text/css"/>

    <link href="back/style/css/sustyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="back/style/layui/css/layui.css">
    <script type="text/javascript" src="back/style/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="back/style/layui/layui.js"></script>

    <style>
        .myOrder {
            position: relative;
            float: right;
            border: 1px solid #008000;
            right: 20px;
        }
    </style>
    <script>
            function getoIndex(){
                location="front/index.jsp";
            }

    </script>

</head>

<body>

<!--top-->
<header class="Toper" style="padding-top:20px;">
    <div class="Top">
        <div class="LogoDiv">
            <ul>
                <li class="Logo"><a href="front/index.jsp"><img src="front/images/logo.jpg"/></a></li>
                <li class="LogoRight" style="background:none;"><img src="front/images/logoRight.jpg"/></li>
                <div class="clear"></div>
            </ul>
        </div>
        <div style="float: right; right: 180px">
            <button type="button" onclick="getoIndex()" class="layui-btn layui-btn-lg layui-btn-danger">返回首页</button>
        </div>
        <div class="clear"></div>
    </div>
</header>

<!--top End-->


<div class="take-delivery">
    <div class="status">
        <h2>您已成功付款</h2>
        <div class="successInfo">
            <ul>
                <li>付款金额<em>¥${money}元</em></li>
                <div class="user-info">
                    <p>收货人：${shouhuoren }</p>
                    <p>联系电话：${phone}</p>
                    <p>收货地址：${address}</p>
                </div>
                请认真核对您的收货信息，如有错误请联系客服

            </ul>
            <div class="option">
                <span class="info">您可以</span>
                <a href="/user/toMember/<shiro:principal property='id'/>/4" class="J_MakePoint">查看<span>已买到的宝贝</span></a>
                <a href="person/orderinfo.html" class="J_MakePoint">查看<span>交易详情</span></a>
            </div>
        </div>



    </div>
</div>


<jsp:include page="bottom.jsp"/>


</body>
</html>