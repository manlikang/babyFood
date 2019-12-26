

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
    <c:if test="${user.sex=='男' }">
    	<script >
    		$(function(){
    			$("#sex").val('男')

    		})
    	</script>
    	</c:if>


   <c:if test="${user.sex=='女' }">
    	<script >
    		$(function(){
    			$("#sex").val('女')

    		})
    	</script>

   </c:if>

		<c:if test="${user.memberRank=='普通会员' }">
			<script >
				$(function(){
					$("#rank").val('普通会员')

				})
			</script>
		</c:if>


		<c:if test="${user.memberRank=='超级会员' }">
			<script >
				$(function(){
					$("#rank").val('超级会员')

				})
			</script>
		</c:if>

    
    <div class="formtitle"><span>编辑用户信息</span></div>
    <form id="form" action="/user/update" method="post">
    	<input type="hidden" name="id"	value="${user.id}" />
    	<ul class="forminfo">
	    <li><label>用户名</label><input id="username" name="username" type="text" class="dfinput" value="${user.username }" /></li>
	      <li><label>邮箱</label><input id="email" name="email" type="text" class="dfinput" value="${user.email }" /></li>
	    <li>
		    <label>性别</label>
		     <select name="sex" class="dfinput" id="sex">
			  		<option value="null">请选择</option>
			    	<option value="男">男</option>
			    	<option value="女" >女</option>
		    </select>
	    </li>

			<li>
				<label>会员等级</label>
				<select name="memberRank" class="dfinput" id="rank">
					<option value="null">请选择</option>
					<option value="超级会员">超级会员</option>
					<option value="普通会员" >普通会员</option>
				</select>
			</li>
	    
	  	<li>

	    </li><li><label>
	    &nbsp;</label><input id="save" type="submit" class="btn" value="确认保存"/></li>
	    </ul>
    </form>
    </div>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>

</html>

