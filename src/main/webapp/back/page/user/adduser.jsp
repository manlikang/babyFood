<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=request.getContextPath()+"/"%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="back/style/css/backstyle.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="back/style/layui/css/layui.css">
	<script type="text/javascript" src ="back/style/js/jquery-3.4.1.js"></script>
	<script type="text/javascript" src ="back/style/layui/layui.js"></script>

</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">表单</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>添加用户信息</span></div>
    <form id="form" action="/user/add" method="post">
    	<ul class="forminfo">
	    <li><label>用户名</label><input name="username" id="username" type="text" class="dfinput" /></li>
	    <li><label>密码</label><input name="password" id="password" type="text" class="dfinput"/></li>
	     <li><label>手机号</label><input id="phone" name="phone" type="text" class="dfinput"  /></li>
	      <li><label>邮箱</label><input id="email" name="email" type="text" class="dfinput" /></li>


	    <li><label>性别</label><select name="sex" class="dfinput" id="sex">
			<option value="null" selected>请选择</option>
			<option value="男">男</option>
			<option value="女">女</option>
		</select>
		</li>



			<li>
				<label>会员等级</label>
				<select name="memberRank" class="dfinput" >
					<option value="null" selected>请选择</option>
					<option value="超级会员">超级会员</option>
					<option value="普通会员" >普通会员</option>
				</select>
			</li>

			<li>
	    <li><label>&nbsp;</label><input name="" type="submit" class="btn" id="saveAdd" value="确认保存"/></li>
	    </ul>
    </form>
    </div>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
<script>

	$(function () {
		var submitFlag =false;

		$("#form").submit(function () {

			if(!submitFlag){
				layui.use('layer', function(){
					var layer = layui.layer;
					layer.msg("该手机号已存在", {
						icon: 2,
						time: 2000 //2秒关闭（如果不配置，默认是3秒）
					});
				});
			}
			return submitFlag;
			});


			$("#phone").bind('input propertychange',function () {
				var phone = $("#phone").val();
				$.ajax({
					url:"user/hasPhone/"+phone,
					success:function (data) {
						submitFlag = !data.result;
						console.log(!data.result);
					}
				})

			});



		})

		function sleep(n) {
			var start = new Date().getTime();
			//  console.log('休眠前：' + start);
			while (true) {
				if (new Date().getTime() - start > n) {
					break;
				}
			}
		}

</script>
</html>

