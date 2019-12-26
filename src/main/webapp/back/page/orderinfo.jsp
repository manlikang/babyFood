
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=request.getContextPath()+"/"%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="back/style/css/backstyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="back/style/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function(){





		$(".del").click(function(){
			var id =$(this).attr("userID");
			var msg =confirm("是否确认删除");
			if(msg == true){
				$.get("user/del/"+id,function (data) {
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
        <li class="click"><a href="#"><span><img src="back/style/images/t01.png" /></span>添加</a></li>
        <li class="click"><a href="#"><span><img src="back/style/images/t02.png" /></span>修改</a></li>
        <li class="click" id="delChecked"><span><img src="back/style/images/t03.png" /></span>删除</li>
        <li><span><img src="back/style/images/t04.png" /></span>统计</li>
        </ul>
        <ul class="toolbar1">
        <li><span><img src="back/style/images/t05.png" /></span>设置</li>
        </ul>
    
    </div>
    
    
      <table class="tablelist">
    	<thead>
    	<tr>
        <th><input name=""  id="all-checkbox" type="checkbox" /></th>
        <th>订单编号</th>
        <th>发送方式</th>
        <th>支付方式</th>
        <th>支付金额</th>
            <th>收货人</th>
        <th>手机号</th>
        <th>收获地址</th>
            <th>订单日期</th>
        </tr>
        </thead>
        <tbody>
       
        	
       
       <c:forEach items="${pageInfo.list}" var = "order">
            <tr>
         	 <td><input name="" value="${order.id }" class="checkbox"  type="checkbox" value=""/></td>
		        <td>${order.id}</td>
		        <td>${order.sendtype}</td>
		        <td>${order.paytype}</td>
		        <td>${order.paycount}</td>
                <td>${order.shperson}</td>
		        <td>${order.shphone}</td>
		        <td>${order.shaddress}</td>
                <td><fmt:formatDate value="${order.orderdate}" pattern="yyyy年MM月dd日" /></td>
	        </tr> 
	       </c:forEach>

        </tbody>
    </table>
        <jsp:include page="/page.jsp"/>



    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

        <script type="text/javascript">
            var msg = "${msg}".trim();
            if(msg != "" ){
                alert(msg);
            }
        </script>
</body>
</html>
