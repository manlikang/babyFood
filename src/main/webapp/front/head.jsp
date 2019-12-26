<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/11
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=request.getContextPath()%>/"/>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="front/css/css_whir.css"/>
    <script type="text/javascript" src="front/scripts/jquery-1.9.1.min.js"></script>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="front/scripts/html5shiv.v3.72.min.js"></script>
    <![endif]-->
    <script src="front/scripts/jquery.SuperSlide.js" type="text/javascript"></script>
    <script type="text/javascript">
        var navID = "${param.navId}";
        console.log(navID)
        var menuID="1";
    </script>
    <style type="text/css">
        .TopSideMain a.shopcar{ background:url(front/images/shopcart.png) no-repeat left center;}
    </style>
</head>
<body>
<!--top-->
<header class="Toper">
    <div class="TopSide"><div class="TopSideMain">
        <shiro:user>
            欢迎您,<span style="color: red">${user.nickname} </span> ! |
            <shiro:hasRole name="admin">
            <a href="back/page/main.jsp">后台管理</a>|
            </shiro:hasRole>
            <a href="/user/myLogOut/<shiro:principal property='phone'/>">退出登录</a>

            <a href="front/shopcat.jsp" class="shopcar">购物车<strong id="cartnum">${sessionScope.shopcart.shopCart.size()}</strong></a>
        </shiro:user>

        <shiro:guest>
            <a href="front/login.jsp" class="TopLogin">登录</a>
            <a href="front/register.jsp" class="TopRegister">注册</a>
        </shiro:guest>


    </div></div>
    <div class="Top">
        <div class="LogoDiv">
            <ul>
                <li class="Logo"><a href="index.jsp"><img src="front/images/logo.jpg" /></a></li>
                <li class="LogoRight"><img src="front/images/logoRight.jpg" /></li>
                <div class="clear"></div>
            </ul>
        </div>
        <div class="TopRight">
            <div class="TopPhone">咨询热线: <span>400 6133-118</span></div>
            <div class="SreachBox">
                    <a style="cursor: pointer" onclick="serach()"  class="sreach_btn"></a>
                    <input  id="foodName" type="text"  class="sreach_ipu"  placeholder="输入食品名搜索"   />
                    <div class="clear"></div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="Nav">
        <nav class="MainNav">
            <ul>
                <li id="nav1" class="fuhan"><a class="navA" id="1" href="front/index.jsp"><span>首页</span></a></li>
                <li id="nav2" class="fuhan">
                    <a class="navA" id="2" href="front/about.jsp"><span>关于纽派</span></a>
                    <div class="SubNav">
                        <dl>
                            <dt><a href="#"><span>公司简介</span></a></dt>
                            <dt><a href="#"><span>发展历程</span></a></dt>
                            <dt><a href="#"><span>合作伙伴</span></a></dt>
                            <dt><a href="#"><span>联系我们</span></a></dt>
                            <div class="clear"></div>
                        </dl>
                    </div>
                </li>
                <li id="nav3" class="fuhan">
                    <a class="navA" id="3" href="/food/getListByType/1"><span>产品中心</span></a>
                    <div class="SubNav">
                        <dl>
                            <dt><a href="#"><span>公司简介</span></a></dt>
                            <dt><a href="#"><span>发展历程</span></a></dt>
                            <dt><a href="#"><span>合作伙伴</span></a></dt>
                            <dt><a href="#"><span>联系我们</span></a></dt>
                            <div class="clear"></div>
                        </dl>
                    </div>
                </li>
                <li id="nav4" class="fuhan">
                    <a class="navA" id="4" href="user/toMember/<shiro:principal property='id'/>/1"><span>个人中心</span></a>
                    <div class="SubNav">
                        <dl>
                            <dt><a href="#"><span>公司简介</span></a></dt>
                            <dt><a href="#"><span>发展历程</span></a></dt>
                            <dt><a href="#"><span>合作伙伴</span></a></dt>
                            <dt><a href="#"><span>联系我们</span></a></dt>
                            <div class="clear"></div>
                        </dl>
                    </div>
                </li>
                <li id="nav5" class="fuhan">
                    <a class="navA" id="5" href="baby/toInteract_child"><span>互动专区</span></a>
                    <div class="SubNav">
                        <dl>
                            <dt><a href="#"><span>公司简介</span></a></dt>
                            <dt><a href="#"><span>发展历程</span></a></dt>
                            <dt><a href="#"><span>合作伙伴</span></a></dt>
                            <dt><a href="#"><span>联系我们</span></a></dt>
                            <div class="clear"></div>
                        </dl>
                    </div>
                </li>
                <li id="nav6" class="fuhan">
                    <a class="navA" id="6" href="#"><span>联系我们</span></a>
                    <div class="SubNav">
                        <dl>
                            <dt><a href="#"><span>公司简介</span></a></dt>
                            <dt><a href="#"><span>发展历程</span></a></dt>
                            <dt><a href="#"><span>合作伙伴</span></a></dt>
                            <dt><a href="#"><span>联系我们</span></a></dt>
                            <div class="clear"></div>
                        </dl>
                    </div>
                </li>
                <li id="nav7" class="fuhan" ><a id="7" class="navA" href="#"><span>官方授权网店</span></a></li>
                <div class="clear"></div>
            </ul>
        </nav>
    </div>
</header>
<script type="text/javascript">
    //导航选中
    $("#nav" + navID).addClass("onnav");
    $(".MainNav ul li:last").css("background","none");

    // $(".navA").click(function () {
    //     var id = $(this).attr("id")
    //     $(".fuhan").removeClass("onnav")
    //     $("#nav"+id).addClass("onnav")
    // })


    function serach(){
        var foodName = $("#foodName").val();
        location="food/serach/"+foodName;
    }
    $(".MainNav ul li").each(function(i){
        $(this).find(".SubNav dl dt:last").css("background","none");
        if(i<$(".MainNav ul li").size()-1){
            $(this).hover(function(){
                $(this).addClass("onnav1").find(".SubNav").stop(true,true).slideDown("slow");
            },function(){
                $(this).removeClass("onnav1").find(".SubNav").stop(true,true).slideUp("slow");
            });
        }
    });
</script>
</body>
</html>
