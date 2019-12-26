<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<base href="<%=request.getContextPath()%>/">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>地址管理</title>

		<link href="back/style/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="back/style/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="back/style/css/personal.css" rel="stylesheet" type="text/css">
		<link href="back/style/css/addstyle.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="front/css/css_whir.css"/>
		<link rel="stylesheet" href="back/style/layui/css/layui.css">
		<script type="text/javascript" src ="back/style/js/jquery-3.4.1.js"></script>
		<script type="text/javascript" src ="back/style/layui/layui.js"></script>
		<script src="back/style/AmazeUI-2.4.2/assets/js/amazeui.js"></script>

	</head>
	<script>
		function getoIndex(){
			location="front/index.jsp";
		}
	</script>
	<body>
	<!--top-->
	<header class="Toper" style="padding-top:20px;">
		<div class="Top">
			<div class="LogoDiv">
				<ul>
					<li class="Logo"><a href="front/index.jsp"><img src="front/images/logo.jpg" /></a></li>
					<li class="LogoRight" style="background:none;"><img src="front/images/logoRight.jpg" /></li>
					<div class="clear"></div>
				</ul>
			</div>
			<div style="float: right; right: 180px" ><button type="button" onclick="getoIndex()" class="layui-btn layui-btn-lg layui-btn-danger">返回首页</button></div>
			<div class="clear"></div>
		</div>
	</header>


		<b class="line"></b>

		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-address">
						<!--标题 -->
						
						
						<ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">

							
						</ul>
						<div class="clear"></div>
						<a class="new-abtn-type" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
						<!--例子-->
						<div class="am-modal am-modal-no-btn" id="doc-modal-1">

							<div class="add-dress">

								<!--标题 -->
								<div class="am-cf am-padding">
									<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small></div>
								</div>
								<hr/>

								<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
									<form class="am-form am-form-horizontal" action="user/addAddress/<shiro:principal property='id'/>" method="post">

										<div class="am-form-group">
											<label  class="am-form-label">收货人</label>
											<div class="am-form-content">
												<input type="text" name="shouhuoren" placeholder="收货人" >
											</div>
										</div>

										<div class="am-form-group">
											<label  class="am-form-label">手机号码</label>
											<div class="am-form-content">
												<input name="phone" placeholder="手机号必填" type="text">
											</div>
										</div>

										<div class="am-form-group">
											<label  class="am-form-label">详细地址</label>
											<div class="am-form-content">
												<textarea class="" rows="3" name="address" placeholder="输入详细地址"></textarea>
												<small>100字以内写出你的详细地址...</small>
											</div>
										</div>

										<div class="am-form-group">
											<div class="am-u-sm-9 am-u-sm-push-3">
												<input  class="am-btn am-btn-danger" type="submit" value="保存">
												<a href="user/toJieSuan/<shiro:principal property='id'/>" class="am-close am-btn am-btn-danger" data-am-modal-close>返回</a>
											</div>
										</div>
									</form>
								</div>

							</div>

						</div>

					</div>

					<script type="text/javascript">
						$(document).ready(function() {							
							$(".new-option-r").click(function() {
								$(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
							});
							
							var $ww = $(window).width();
							if($ww>640) {
								$("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
							}
							
						})
					</script>

					<div class="clear"></div>

				</div>
				<jsp:include page="bottom.jsp"/>
			</div>
		</div>

	</body>

</html>