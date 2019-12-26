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
<script type="text/javascript" src="back/style/js/jquery-3.4.1.js"></script>
<script >
	$(function(){

		
		$("#uploadFile").change(function(){
			var url = window.URL.createObjectURL(this.files[0]);
			$("#img").attr("src",url);
			$("#img").css("height","150px");
			$("#img").css("width","220px");
		})
		
		
		

		
		
	})
</script>
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
    
    <div class="formtitle"><span>添加婴儿信息</span></div>
    <form method="post" action="baby/add" enctype="multipart/form-data">
    	<ul class="forminfo">
	    <li><label>婴儿名字</label><input name="name" id="name" type="text" class="dfinput" /><i></i></li>
	    <li><label>婴儿年纪</label><input name="age" id="age" type="text" class="dfinput" /><i></i></li>

	    <li><label>婴儿图片</label><img id="img"  /></li>
	     <li><label>选择图片</label><input id="uploadFile" name="pic" type="file" /></li>
	    <li><label>点赞数</label><input name="like" type="text" class="dfinput" /></li>
	    <li><label>&nbsp;</label><input name="" type="submit" id="cfmsave" class="btn"  value="确认保存"/></li>
	    </ul>
    
    </form>
    </div>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>

