<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html >
<html >

<head>
    <base href="<%=request.getContextPath()%>/">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>结算页面</title>
    <link rel="stylesheet" href="back/style/layui/css/layui.css">
    <link href="back/style/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css"/>

    <link href="back/style/basic/css/demo.css" rel="stylesheet" type="text/css"/>
    <link href="back/style/css/cartstyle.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" type="text/css" href="front/css/css_whir.css"/>
    <link href="back/style/css/jsstyle.css" rel="stylesheet" type="text/css"/>
<style>
    .sl input::-webkit-outer-spin-button,
    .sl input::-webkit-inner-spin-button{
        -webkit-appearance: none !important;
    }

</style>

    <script type="text/javascript" src ="back/style/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src ="back/style/layui/layui.js"></script>
    <script type="text/javascript">

        $(function () {




            $(".dell").click(function () {
                var id = $(this).attr("id").split("l")[1];
                $("#addressMenu"+id).remove();
                $.ajax({
                    url:"user/removeAddress/"+id,
                    success:function (data) {
                        if(data.result){
                            console.log("成功");
                        }

                    }
                })
            })


            reLoadTotal();
            var trueMoney = Number($("#J_ActualFee1").text());
            $("#integral-dikou").click(function () {
                var integral = Number("${user.integral}");
                $("#can-get-Integral").text("您有"+integral+"积分,可抵扣金额:");
                var money = integral/100;
                if(trueMoney<money){
                    $("#allIntegral").text(toDecimal(trueMoney));
                    $("#J_ActualFee1").text(toDecimal(0));
                }else{
                    $("#allIntegral").text(toDecimal(money));
                    $("#J_ActualFee1").text(toDecimal(trueMoney-money));
                }
                $("#danwei").text("元")

            })

            $("#allplay").click(function () {
                $("#can-get-Integral").text("可获得积分:");
                $("#danwei").text("分")
                reLoadTotal();
            })




            $("ul[class='addressChoose'] li").each(function () {
                $(this).unbind();
                $(this).click(function () {
                    $("ul[class='addressChoose'] li").removeClass("defaultAddr");
                    $(this).addClass("defaultAddr");
                    var shouhuoren = $("li[class='user-addresslist defaultAddr'] span[class='buy-user']").html();
                    var dianhua = $("li[class='user-addresslist defaultAddr'] span[class='buy-phone']").html();
                    var dizhi = $("li[class='user-addresslist defaultAddr'] span[class='buy--address-detail']").html();
                    $("#buy_user").val(shouhuoren);
                    $("#phone").val(dianhua);
                    $("#address").val(dizhi);
                    console.log(shouhuoren);
                    $("#send").html(dizhi);
                    $("#person").html(shouhuoren);
                    $("#tel").html(dianhua);
                })
            })

            $("ul[class='op_express_delivery_hot'] li").each(function () {
                $(this).unbind();
                $(this).click(function () {
                    var express = $(this).children("span").attr("id");
                    /* alert(express); */
                    $("#express").val(express);
                    $("ul[class='op_express_delivery_hot'] li").removeClass("selected");
                    $(this).addClass("selected");
                })
            })

            $("ul[class='pay-list'] li").each(function () {
                $(this).unbind();
                $(this).click(function () {
                    var paytype = $(this).children("span").attr("id");
                    $("#paytype").val(paytype);
                    $("ul[class='pay-list'] li").removeClass("selected");
                    $(this).addClass("selected");
                })
            })


            $("#go").click(function () {

                var expressli = $("ul[class='op_express_delivery_hot'] li");
                var payli = $("ul[class='pay-list'] li");
                var expressflag = false;
                var payflag = false;
                $(expressli).each(function (index, element) {
                    if ($(this).hasClass("selected")) {
                        expressflag = true;
                    }
                })
                $(payli).each(function (index, element) {
                    if ($(this).hasClass("selected")) {
                        payflag = true;
                    }
                })
                if (!expressflag) {
                    alert("请选择物流方式");
                    return;
                }
                if (!payflag) {
                    alert("请选择支付方式");
                    return;
                }
                var danwei = $("#danwei").text();

                var userid="<shiro:principal property='id'/>";
                var should_pay = $("#J_ActualFee").text();
                var infact_pay = $("#J_ActualFee1").text();
                var getIntegral = 0;
                var integral_dikou = 0;
                if(danwei == "元"){
                    integral_dikou = $("#allIntegral").text();
                }else{
                    getIntegral = $("#allIntegral").text();
                }
                var member_dikou = $("#dikou").text();
                var shouhuoren = $("#person").text();
                var phone = $("#tel").text();
                var address = $("#send").text().trim();
                var express = $("ul[class='op_express_delivery_hot'] .selected").text();
                var payMethod = $("ul[class='pay-list'] .selected").text();
                console.log(userid,should_pay,infact_pay,getIntegral,integral_dikou,member_dikou,shouhuoren,phone,address,express,payMethod)
                var obj = new Object();
                obj.userId=Number(userid);
                obj.shouldPay = Number(should_pay);
                obj.infactPay = Number(infact_pay);
                obj.getIntegral = Number(getIntegral);
                obj.integralDikou = Number(integral_dikou);
                obj.memberDikou = Number(member_dikou);
                obj.shouhuoren = shouhuoren;
                obj.phone = phone;
                obj.address = address;
                obj.express =express;
                obj.payMethod = payMethod;
                $.ajax({
                     url:"user/pay",
                     async:true,
                     type:"post",
                     data:JSON.stringify(obj),
                        contentType : 'application/json',
                     success:function (data) {
                         if(data.result){
                             location.href="user/toSuccess/"+infact_pay+"/"+shouhuoren+"/"+phone+"/"+address;
                         }else{
                             alert("系统故障，请稍后再试")
                         }
                     }
                 })
            })





            function toDecimal(x) {
                var f = parseFloat(x);
                if (isNaN(f)) {
                    return;
                }
                f = Math.round(x*100)/100;
                return f;
            }
            function reLoadTotal(){
                var Integral = 0;
                var total = 0;
                $(".J_ItemSum").each(function(index,element){
                    var id = $(this).attr("id").split("l")[1];
                    console.log("id:"+id);
                    Integral = Integral+Number($("#Integral"+id).val())*Number($("#num"+id).val());
                    console.log($("#Integral"+id).val());
                    var price = $(this).html();
                    total=total+Number(price);
                })
                $("#allIntegral").text(Integral);
                var memberRank = "<shiro:principal property='memberRank'/>";
                if(memberRank == "普通会员"){
                    $("#dikou").text(toDecimal(total*0.01));
                    $("#J_ActualFee1").html(toDecimal((total+10)*0.99));
                }else{
                    $("#dikou").text(toDecimal(total*0.05));
                    $("#J_ActualFee1").html(toDecimal((total+10)*0.95));
                }
                $("#J_ActualFee").html(total+10);

            }


            $(".address-left").click(function () {
                $(".addressChoose li").removeClass("defaultAddr");
                $(this).parent(".user-addresslist").addClass("defaultAddr");
            })

        })
        function getoIndex(){
            location="front/index.jsp";
        }

    </script>

</head>

<body >

<!--top-->
<header class="Toper " style="padding-top:20px;">
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

<!--top End-->
<div class="concent " >
    <!--地址 -->
    <div class="paycont ">
        <div class="address ">
            <h3>确认收货地址 </h3>
            <div class="control">
                <div class="tc-btn createAddr theme-login am-btn am-btn-danger"><a href="front/addAddress.jsp"
                                                                                   style="color: white;">使用新地址</a></div>
            </div>
            <div class="clear"></div>
            <ul class="addressChoose">

                <!-- 默认地址：class="user-addresslist defaultAddr" -->
                <c:forEach items="${addresses}" var="address">
                    <c:if test="${address.isdefault == '是'}">
                        <li id="addressMenu${address.id}" class="user-addresslist defaultAddr">
                            <div class="address-left">

                                <div class="user DefaultAddr">
                                    <span class="buy-address-detail"></span>
                                    <span class="buy-user">${address.shouhuoren}</span>
                                    <input type="hidden" class="shouhuoren" value="${ address.shouhuoren}"/>
                                    <span class="buy-phone">${address.phone}</span>
                                </div>

                                <div class="default-address DefaultAddr">
                                    <span class="buy-line-title buy-line-title-type">收货地址：</span>
                                    <span class="buy--address-detail">${address.address}</span>
                                </div>
                                <ins class="deftip" style="background: #FF5722">默认地址</ins>
                            </div>
                            <div class="new-addr-btn">
                                <span class="new-addr-bar hidden">|</span>
                                <a href="user/toUpdateAddress/${address.id}">编辑</a>
                                <span class="new-addr-bar">|</span>
                                <a  style="cursor: pointer" id="del${address.id}" class="dell" >删除</a>
                            </div>
                        </li>
                    </c:if>
                    <c:if test="${address.isdefault == '否'}">
                        <li id="addressMenu${address.id}" class="user-addresslist">
                            <div class="address-left">
                                <div class="user ">
                                    <span class="buy-address-detail"></span>
                                    <span class="buy-user">${address.shouhuoren}</span>
                                    <input type="hidden" class="shouhuoren" value="${address.shouhuoren}"/>
                                    <span class="buy-phone">${address.phone}</span>
                                </div>

                                <div class="default-address ">
                                    <span class="buy-line-title buy-line-title-type">收货地址：</span>
                                    <span class="buy--address-detail">${address.address}</span>
                                </div>
                                <ins class="deftip">默认地址</ins>
                            </div>
                            <div class="new-addr-btn">
                                <span class="new-addr-bar hidden">|</span>
                                <a href="user/toUpdateAddress/${address.id}">编辑</a>
                                <span class="new-addr-bar">|</span>
                                <a  style="cursor: pointer" id="del${address.id}" class="dell" >删除</a>
                            </div>
                        </li>
                    </c:if>
                </c:forEach>
            </ul>

            <div class="clear"></div>
        </div>
        <!--物流 -->
        <div class="logistics">
            <h3>选择物流方式</h3>
            <ul class="op_express_delivery_hot">
                <li data-value="yuantong" class="OP_LOG_BTN "><i class="c-gap-right"
                                                                 style="background-position:0px -468px"></i>圆通<span
                        id="圆通"></span></li>
                <li data-value="shentong" class="OP_LOG_BTN "><i class="c-gap-right"
                                                                 style="background-position:0px -1008px"></i>申通<span
                        id="申通"></span></li>
                <li data-value="yunda" class="OP_LOG_BTN "><i class="c-gap-right"
                                                              style="background-position:0px -576px"></i>韵达<span
                        id="韵达"></span></li>
                <li data-value="zhongtong" class="OP_LOG_BTN op_express_delivery_hot_last"><i class="c-gap-right"
                                                                                              style="background-position:0px -324px"></i>中通<span
                        id="中通"></span></li>
                <li data-value="shunfeng" class="OP_LOG_BTN  op_express_delivery_hot_bottom"><i class="c-gap-right"
                                                                                                style="background-position:0px -180px"></i>顺丰<span
                        id="顺丰"></span></li>
            </ul>
        </div>
        <div class="clear"></div>

        <!--支付方式-->
        <div class="logistics ">
            <h3>选择支付方式</h3>
            <ul class="pay-list" >
                <li class="pay card "><img src="back/style/images/wangyin.jpg"/>银联<span id="银联"></span></li>
                <li class="pay qq"><img src="back/style/images/weizhifu.jpg"/>微信<span id="微信"></span></li>
                <li class="pay taobao"><img src="back/style/images/zhifubao.jpg"/>支付宝<span id="支付宝"></span></li>
            </ul>
        </div>


        <div class="clear"></div>

        <!--订单 -->
        <div class="concent">
            <div id="payTable">
                <h3>确认订单信息</h3>
                <div class="cart-table-th" >
                    <div class="wp">

                        <div class="th th-item">
                            <div class="td-inner">商品信息</div>
                        </div>
                        <div class="th th-price">
                            <div class="td-inner">单价</div>
                        </div>
                        <div class="th th-amount">
                            <div class="td-inner">数量</div>
                        </div>
                        <div class="th th-sum">
                            <div class="td-inner">金额</div>
                        </div>
                        <div class="th th-oplist">
                            <div class="td-inner">配送方式</div>
                        </div>

                    </div>
                </div>
                <div class="clear"></div>

                <c:forEach items="${sessionScope.shopcart.shopCart}" var="cart">
                    <input id="Integral${cart.id}" type="hidden" value="${cart.integral}"/>
                    <!-- 购物车 -->
                    <tr class="item-list"  >
                        <div class="bundle  bundle-last" style="border: 1px red solid">

                            <div class="bundle-main">
                                <ul class="item-content clearfix">
                                    <div class="pay-phone">
                                        <li class="td td-item">
                                            <div class="item-pic">
                                                <a href="#" class="J_MakePoint">
                                                    <img src="back/style/img/${cart.foodpic}"
                                                         style="width: 80px; height: 80px"
                                                         class="itempic J_ItemImg"></a>
                                            </div>
                                            <div class="item-info">
                                                <div class="item-basic-info" style="text-align: center">
                                                    <a href="#" class="item-title J_MakePoint"
                                                       data-point="tbcart.8.11" >${cart.foodName}</a>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="td td-price">
                                            <div class="item-price price-promo-promo">
                                                <div class="price-content">
                                                    <div class="price-line">
                                                        <em class="J_Price price-now">${cart.foodPrice}</em>
                                                    </div>

                                                </div>
                                            </div>
                                        </li>
                                    </div>
                                    <li class="td td-amount">
                                        <div class="amount-wrapper ">
                                            <div class="item-amount ">
                                                <span class="phone-title"></span>
                                                <div class="sl">

                                                    <input disabled class="text_box" id="num${cart.id}"  type="number"
                                                           value="${cart.count }"
                                                           style="width: 30px; text-align: center;"/>

                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="td td-sum">
                                        <div class="td-inner">
                                            <em tabindex="0" id="dl${cart.id}" class="J_ItemSum number">
                                                    ${cart.count*cart.foodPrice}
                                                    </em>
                                        </div>
                                    </li>
                                    <li class="td td-oplist">
                                        <div class="td-inner">
                                            <span class="phone-title">配送方式</span>
                                            <div class="pay-logis">
                                                快递<b class="sys_item_freprice">10</b>元
                                            </div>
                                        </div>
                                    </li>

                                </ul>
                                <div class="clear"></div>

                            </div>
                        </div>
                    </tr>

                </c:forEach>

                <div class="clear"></div>
            </div>


            <!--信息 -->
            <div class="order-go clearfix layui-bg-gray" >
                <div class="pay-confirm clearfix">
                    <div class="box">
                        <ul class="layui-tab-title">
                            <li class="layui-this" id="allplay">全额支付</li>
                            <li id="integral-dikou">积分抵扣</li>
                        </ul>
                        <div class="layui-tab-content">
                            <div class="layui-tab-item layui-show">
                                <div tabindex="0" id="holyshit267" class="realPay"><em class="t">应付款：</em>
                                    <span class="price g_price ">
                                    <span>¥</span> <em class="style-large-bold-red " id="J_ActualFee">88888</em>
											</span>
                                </div>

                                <div tabindex="0" id="holyshit26712" class="realPay"><em class="t" id="can-get-Integral">可获积分：</em>
                                    <span class="price g_price ">
                                     <em class="style-large-bold-red " id="allIntegral">10</em><span style="font-size: 18px;" id="danwei">分</span>
											</span>
                                </div>
                                <div tabindex="0" id="dikou1" class="realPay"><em class="t">您是<shiro:principal property="memberRank"/>可抵扣</em>
                                    <span class="price g_price ">
                                    <span>¥</span> <em class="style-large-bold-red " id="dikou">88888</em>
											</span>
                                </div>
                                <div tabindex="0" id="holyshit2671" class="realPay"><em class="t">实付款：</em>
                                    <span class="price g_price ">
                                    <span>¥</span> <em class="style-large-bold-red " id="J_ActualFee1">88888</em>
											</span>
                                </div>

                                <div id="holyshit268" class="pay-address">

                                    <p class="buy-footer-address">
                                        <span class="buy-line-title buy-line-title-type">寄送至：</span>
                                        <span class="buy--address-detail" id="send">
                                            ${defalutAddress.address}
                                        </span>
                                    </p>
                                    <p class="buy-footer-address">
                                        <span class="buy-line-title">收货人：</span>
                                        <span class="buy-address-detail">
                                         <span class="buy-user" id="person">${defalutAddress.shouhuoren} </span>
												<span class="buy-phone" id="tel">${defalutAddress.phone}</span>
												</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div id="holyshit269" class="submitOrder">
                            <div class="go-btn-wrap">
                                <button id="updateOrder" class="layui-btn layui-btn-danger" style="margin-right: 20px;">修改订单</button>
                                <button id="go" class="layui-btn layui-btn-danger" >立即结算</button>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <script>
                        $("#updateOrder").click(function () {
                            location = "front/shopcat.jsp";
                        })
                    </script>
                </div>
            </div>
        </div>

        <div class="clear"></div>
    </div>
</div>
<jsp:include page="bottom.jsp"/>
<script>
    //注意：选项卡 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;

        //…
    });
    



</script>

</body>

</html>