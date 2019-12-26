<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib prefix="text-align" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html >
<html >

<head>
	<base href="<%=request.getContextPath()%>/">
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>购物车页面</title>
    <link rel="stylesheet" href="back/style/layui/css/layui.css">
    <script type="text/javascript" src ="back/style/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src ="back/style/layui/layui.js"></script>
    <style>
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button{
            -webkit-appearance: none !important;
        }
        .shop-btn{
            font-size: 15px;
            width: 30px;
        }
        .settlement{
            float: right;
            width: 200px;
            height: 200px;
            right: 100px;
            border:5px #FF5722 solid;
        }
    </style>
<script type="text/javascript">
    $(function () {
        updateTotalPrice();
        function updateTotalPrice(){
            var total= 0;
            var Integral = 0;
            $(".total").each(function (index,element) {
                var id = $(this).attr("id").split("l")[1];
                Integral = Integral+Number($("#Integral"+id).text())*Number($("#num"+id).val());
                total = total+Number($(this).text());
            })

            $("#allIntegral").text(Integral);
            $("#totalPrice").text(total);
        }

        $(".increase").click(function () {
            var id = $(this).attr("id").split("i")[1];
            var price = Number($("#price"+id).text());
            var num = Number($("#num"+id).val());
            $("#num" + id).val(num+1);
            $("#total" + id).text((num+1) * price);
            updateTotalPrice();

            $.ajax({
                url:"food/addOneNum/"+id,
                success:function (data) {
                    console.log(data.data)
                }
            })
        })

        $(".reduce").click(function () {
            var id = $(this).attr("id").split("r")[1];
            var price = Number($("#price"+id).text());
            var num = Number($("#num"+id).val());
            if(num>1) {
                $("#num" + id).val(num-1);
                $("#total" + id).text((num-1) * price);
                updateTotalPrice();
                $.ajax({
                    url:"food/reduceOneNum/"+id,
                    success:function (data) {
                        console.log(data.data)
                    }
                })
            }
        })

        $(".delete-cart").click(function () {
            var id = $(this).attr("id").split("l")[1];
            $.ajax({
                url:"food/delCart/"+id,
                success:function (data) {
                    console.log(data.data)
                    location.reload();
                }
            })
        })
    })
</script>
</head>

<body>

	<jsp:include page="head.jsp"/>

	<!--购物车 -->
	<div class="layui-main">
        <table class="layui-table" lay-size="lg" >

            <thead>
            <tr style="background: #FF5722 ;color: white">
                <th>商品名</th>
                <th>商品图片</th>
                <th>适用人群</th>
                <th>产地</th>
                <th>单价</th>
                <th>积分</th>
                <th>数量</th>
                <th>总价</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>

            <c:if test="${sessionScope.shopcart.shopCart.size() == 0}">
                <tr>
                    <td colspan="9" rowspan="3" style="text-align: center;font-size: 20px">你的购物车空空如也，快去<a style="cursor: pointer;color:#FF5722 " href="/food/getListByType/1">买点东西</a>吧</td>
                </tr>
            </c:if>


            <c:if test="${sessionScope.shopcart.shopCart.size() != 0}">
            <c:forEach items="${sessionScope.shopcart.shopCart}" var="domain">
            <tr>
                <td>${domain.foodName}</td>
                <td><img height="100px" width="60px" src="back/style/img/${domain.foodpic}"></td>
                <td>${domain.foodtype}</td>
                <td>${domain.origin}</td>
                <td id="price${domain.id}">${domain.foodPrice}</td>
                <td id="Integral${domain.id}">${domain.integral}</td>
                <td style="width: 120px">
                    <button id="r${domain.id}"  class="shop-btn reduce">-</button>
                    <input type="number" min="1" id="num${domain.id}" class="myNum" style="text-align:center;width: 35px;border: 1px grey solid" disabled value="${domain.count}">
                    <button id="i${domain.id}" class="shop-btn increase">+</button>
                </td>
                <td id="total${domain.id}" class="total">${domain.foodPrice*domain.count}</td>
                <td ><a id="del${domain.id}" class="delete-cart" style="cursor: pointer">移除</a></td>
            </tr>
            </c:forEach>
            </c:if>
            </tbody>
        </table>
        <c:if test="${sessionScope.shopcart.shopCart.size() == 0}"/>
        <c:if test="${sessionScope.shopcart.shopCart.size() != 0}">
        <div class="settlement">

            <br/>
            <p align="right" style="font-size: 15px;"><span>您一共选购了</span><span style="font-size: 21px;color: red">${sessionScope.shopcart.shopCart.size()}</span>件商品&nbsp;&nbsp;&nbsp;</p><hr>
            <p align="right" style="font-size: 15px;"><span>可获得</span><span style="font-size: 21px;color: red" id="allIntegral">500</span>积分&nbsp;&nbsp;&nbsp;</p><hr>
            <p align="right" style="font-size: 18px;"><span>总价:</span><span id="totalPrice" style="font-size: 21px;color: red">1999</span>元&nbsp;&nbsp;&nbsp;</p><hr>
            <div style="float: right;padding-right: 15px;"><button id="jiesuan" type="button" class="layui-btn layui-btn-lg layui-btn-danger">提交订单</button></div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
        </c:if>
    </div>
    <script>
        $("#jiesuan").click(function () {
            location="user/toJieSuan/<shiro:principal property='id'/>";
        })
    </script>

		<jsp:include page="bottom.jsp"/>
</body>

</html>