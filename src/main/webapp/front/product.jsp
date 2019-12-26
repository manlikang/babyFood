<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="zh-cn">
<head>
    <base href="<%=request.getContextPath()%>/"/>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="Author" content="">
<meta content=" shop116703760.taobao.com/index.htm" name="design">
<title>深圳优之优贸易有限公司</title>
<link rel="stylesheet" type="text/css" href="front/css/css_whir.css"/>
<script type="text/javascript" src="front/scripts/jquery-1.9.1.min.js"></script>
<!--[if lt IE 9]>
  <script type="text/javascript" src="front/scripts/html5shiv.v3.72.min.js"></script>
<![endif]-->
<script type="text/javascript">
   var navID = "3";
   var menuID="1";
</script>
<style type="text/css">
.Banner{ background:url(front/uploadfiles/image/banner/Banner_Product.jpg) no-repeat center top;}
</style>
    <script type="text/javascript">
        $(function () {
                var type=${type};

                console.log(type);
                $(".ProdCategoryList dl dt").removeClass("on")
                $("#aa"+type).addClass("on")

        })
    </script>
</head>

<body id="main">
<jsp:include page="head.jsp">
    <jsp:param name="navId" value="3"/>
</jsp:include>

<aside class="Banner">
</aside>

<div class="Current">
    <div class="CurrentMain">
        <dl><a href="#">产品中心</a>  <span>新西兰卓比</span></dl>
    </div>
</div>

<section class="Contain">
	<section class="MainContent">
    <div class="Content">
        <div class="Product">
        	<div class="ProductColumn">
            	<span>产品品类</span>
                <p>Product category</p>
            </div>
            <div class="ProdCategoryList">
            	<dl>
                	<dd><a href="#"><img src="front/images/logo.jpg" /></a></dd>
                    <dt id="aa1"><a href="food/getListByType/1" ><img src="front/images/ProdImg1.png" /><span>婴幼儿</span></a><p></p></dt>
                    <dt id="aa2"><a href="food/getListByType/2"  ><img src="front/images/ProdImg2.png" /><span>幼儿</span></a><p></p></dt>
                    <dt id="aa3"><a href="food/getListByType/3"  ><img src="front/images/ProdImg3.png" /><span>孕产妇</span></a><p></p></dt>
                    <div class="clear"></div>
                </dl>
            </div>
            <div class="ProductList">
                <c:forEach items="${pageInfo.list}" var="food">
            	<ul>
                	<li>
                    	<div class="ProductListImg"><a href="foodDetail/toProductinfo/${food.id}"><img src="back/style/img/${food.foodpic}" /></a></div>
                        <div class="ProductListCont">
                        	<a href="foodDetail/toProductinfo/${food.id}" class="ProductListTitle">${food.foodName}</a>
                            <table cellpadding="0" cellspacing="0" border="0">
                            	<tr>
                                	<td>配       料：</td>
                                    <td>${food.mixed}</td>
                                </tr>
                            	<tr>
                                	<td>净  含  量：</td>
                                    <td>${food.netContent}</td>
                                </tr>
                            	<tr>
                                	<td>原  产  国：</td>
                                    <td>${food.origin}</td>
                                </tr>
                            	<tr>
                                	<td>保  质  期：</td>
                                    <td>${food.qualityTime}</td>
                                </tr>
                            	<tr>
                                	<td>贮       藏：</td>
                                    <td>${food.storage}</td>
                                </tr>
                            	<tr>
                                	<td>食用方法：</td>
                                    <td>${food.eatMethod}</td>
                                </tr>
                                <tr>
                                    <td>食品类型：</td>
                                    <td>${food.foodtype}</td>
                                </tr>

                            </table>
                        </div>
                        <div class="clear"></div>
                    </li>

                </ul>
                </c:forEach>
            </div>
            <jsp:include page="../page.jsp"/>

        </div>
    </div>
   </section>
   <div class="clear"></div>
</section>

<script type="text/javascript">
$(".ProdCategoryList dl dt").each(function(){
	$(this).hover(function(){
		$(this).addClass("on1");
	},function(){
		$(this).removeClass("on1");
	});
});
</script>

<jsp:include page="bottom.jsp"/>
</body>
</html>