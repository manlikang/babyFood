

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
<script type="text/javascript" src="back/style/js/jquery-3.4.1.js"></script>

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


    
    <div class="formtitle"><span>编辑商品信息</span></div>
    <form action="/foodDetail/update" method="post">
    	<input type="hidden" name="id"	value="${foodDetail.id}" />
    	<ul class="forminfo">
	    <li><label>商品名</label><input id="detailName" name="detailName" type="text" class="dfinput" value="${foodDetail.detailName}" /></li>
	    <li><label>适用范围</label><input id="ageRange" name="ageRange" type="text" class="dfinput" value="${foodDetail.ageRange }" /></li>
			<li><label>包装</label><input id="packing" name="packing" type="text" class="dfinput" value="${foodDetail.packing }" /></li>
	     <li><label>简介</label><input id="profile" name="profile" type="text" class="dfinput" value="${foodDetail.profile }" /></li>
	      <li><label>详情</label><textarea style="border: #0e90d2 1px solid" rows="8" cols="40" name="detailProfile"  >${foodDetail.detailProfile}</textarea></li>
			<li><label>温馨提示</label><textarea style="border: #0e90d2 1px solid" rows="8" cols="40" name="warn"  >${foodDetail.warn}</textarea></li>
			<li><label>可获积分</label><input id="integral" name="integral" type="text" class="dfinput" value="${foodDetail.integral }" /></li>
	    
	  	<li><label>
	    &nbsp;</label><input id="save" type="submit" class="btn" value="确认保存"/></li>
	    </ul>
    </form>
    </div>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>

