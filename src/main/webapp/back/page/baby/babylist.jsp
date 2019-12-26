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
    <style>
        td a:hover{
            color: #01AAED;
        }
    </style>
<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});
</script>

    <script type="text/javascript">
	$(function(){
		$(".delGoods").click(function(){
			var id =$(this).attr("goodsId");
			var msg =confirm("是否确认删除");
			if(msg == true){
				$.get("baby/del/"+id,function (data) {
                    alert(data.data);
                    location.reload();
            	})
			}
			
		})

	})
</script>


</head>
<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">数据表</a></li>
    <li><a href="#">基本内容</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
            <a href="back/page/baby/babyadd.jsp"><li class="click"><span><img src="back/style/images/t01.png" /></span>添加</li></a>
        <li class="click"><span><img src="back/style/images/t02.png" /></span>修改</li>
        <li id="delChecked"><span><img src="back/style/images/t03.png" /></span>删除</li>
        <li><span><img src="back/style/images/t04.png" /></span>统计</li>
        </ul>
        
        
        <ul class="toolbar1">
        <li><span><img src="back/style/images/t05.png" /></span>设置</li>
        </ul>
    
    </div>
    <table class="tablelist" >
    	<thead>
    	<tr>
            <th><input name="" id="all-checkbox" type="checkbox" value="" /></th>
            <th>婴儿编号</th>
            <th>婴儿名字</th>
            <th>婴儿年纪</th>
            <th>婴儿图片</th>
            <th>点赞数</th>
            <th>操作</th>
       
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.list}" var ="baby">
	        <tr>
	            <td><input name="" class="checkbox" type="checkbox" value="${baby.id}" /></td>
	            <td>${baby.id}</td>
	            <td>${baby.name}</td>

                <td>${baby.age}</td>
	            <td align="center"><img src="back/style/img/${baby.pic}" onerror="this.src='back/style/images/wenhao.jpg'" style="width: 120px;height: 90px;" align="middle"/></td>
	            <td>${baby.like}</td>
	            <td>
	                <a href="baby/toUpdate/${baby.id}" >编辑</a>|
			        <a  class="delGoods" style="cursor: pointer" goodsId="${baby.id}" > 删除</a>
                </td>
	        </tr>
	        </c:forEach>
        </tbody>
    </table>

    
    <jsp:include page="/page.jsp"/>
    
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>


	
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>

    <script type="text/javascript">
        $(function () {
            var msg = "${msg}".trim();
            if(msg != "" ){
                alert(msg);
            }
        })

    </script>
</body>
</html>
