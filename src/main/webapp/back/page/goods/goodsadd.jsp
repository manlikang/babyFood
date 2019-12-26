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
    
    <div class="formtitle"><span>添加商品信息</span></div>
    <form method="post" action="food/add" enctype="multipart/form-data">
    	<ul class="forminfo">
	    <li><label>商品名称</label><input name="foodName" id="goods_name" type="text" class="dfinput" /><i></i></li>
	    <li><label>商品类别</label>
	    		<select name="foodtype" >
	    			<option value="null" selected="selected">请选择</option>
					<option value="婴幼儿" >婴幼儿</option>
					<option value="幼儿" >幼儿</option>
					<option value="孕产妇" >孕产妇</option>
	    		</select>
	    </li>
	    <li><label>图片展示</label><img id="img"  /></li>
	     <li><label>商品图片</label><input id="uploadFile" name="foodpic" type="file" /></li>
	    <li><label>商品价格</label><input name="foodPrice" type="text" class="dfinput" /></li>
	    <li><label>有效日期</label><input name="qualityTime" type="text" class="dfinput"/></li>
	    <li><label>&nbsp;</label><input name="" type="submit" id="cfmsave" class="btn"  value="确认保存"/></li>
	    </ul>
    
    </form>
    </div>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>

