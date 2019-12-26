<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../style/css/backstyle.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../style/js/jquery-3.4.1.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>通讯录</div>
    
    <dl class="leftmenu">
        
    <dd>
    <div class="title">
    <span><img src="../style/images/leftico01.png" /></span>管理信息
    </div>
    	<ul class="menuson">
        
            <li><cite></cite><a href="/baby/list" target="rightFrame">婴儿管理</a><i></i></li>
            <li ><cite></cite><a href="/user/list" target="rightFrame" >用户管理</a><i></i></li>
            <li ><cite></cite><a href="/food/list" target="rightFrame">商品管理</a><i></i></li>
            <li ><cite></cite><a href="/foodDetail/list" target="rightFrame">商品详情管理</a><i></i></li>
            <li ><cite></cite><a href="/order/list" target="rightFrame">订单管理</a><i></i></li>
            <li ><cite></cite><a href="/order/detaillist" target="rightFrame">订单详情管理</a><i></i></li>
        </ul>    
    </dd>
    </dl>
</body>
</html>
