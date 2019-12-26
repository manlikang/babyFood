
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html >
<html >
<head>
    <base href="<%=request.getContextPath()+"/"%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="back/style/css/backstyle.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="back/style/layui/css/layui.css">
    <script type="text/javascript" src ="back/style/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src ="back/style/layui/layui.js"></script>

    <style type="text/css">
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button{
            -webkit-appearance: none !important;
        }
    </style>
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

        $("#serachId").click(function () {
            var text =$("#serachText").val();
            console.log(text);
            location.href ="order/serachOrderDetailByOrderId/"+text;
        })



	})
</script>

</head>

<body >


	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">数据表</a></li>
    <li><a href="#">基本内容</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools" style="position: relative">
    
    	<ul class="toolbar">
        <li class="click"><a href="#"><span><img src="back/style/images/t01.png" /></span>添加</a></li>
        <li class="click"><a href="#"><span><img src="back/style/images/t02.png" /></span>修改</a></li>
        <li class="click" id="delChecked"><span><img src="back/style/images/t03.png" /></span>删除</li>
        <li><span><img src="back/style/images/t04.png" /></span>统计</li>

        </ul>
        <div style="position: absolute;left: 500px;">
            <input id="serachText" style="padding-left: 20px; height: 33px;width: 250px;border: 1px grey solid;border-radius:20px;font-size: 16px" placeholder="搜订单ID" type="number" >
            <button id="serachId" class="layui-btn layui-btn-radius layui-btn-normal">查询</button>
        </div>
        <ul class="toolbar1">
        <li><span><img src="back/style/images/t05.png" /></span>设置</li>
        </ul>
    
    </div>
    
    
      <table class="tablelist">
    	<thead>
    	<tr>
        <th><input name=""  id="all-checkbox" type="checkbox" /></th>
        <th>详情编号</th>
        <th>订单ID</th>
        <th>商品名字</th>
        <th>商品图片</th>
            <th>单价</th>
        <th>数量</th>
        <th>总价</th>
            <th>订单日期</th>
        </tr>
        </thead>
        <tbody>
       
        	
       
       <c:forEach items="${pageInfo.list}" var = "order">
            <tr>
         	 <td><input name="" value="${order.id }" class="checkbox"  type="checkbox" value=""/></td>
		        <td>${order.id}</td>
		        <td>${order.orderid}</td>
		        <td>${order.foodname}</td>
		        <td><img width="10%" height="10%" src="back/style/img/${order.foodpic}" alt="${order.foodname}"/></td>
                <td>${order.foodprice}</td>
		        <td>${order.foodnum}</td>
		        <td>${order.foodTotalPrice}</td>
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
