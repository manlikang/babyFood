<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <base href="<%=request.getContextPath()%>/"/>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="Author" content="">

    <title>深圳优之优贸易有限公司</title>
    <link rel="stylesheet" type="text/css" href="front/css/css_whir.css"/>
    <link rel="stylesheet" href="back/style/layui/css/layui.css">
    <link rel="stylesheet" href="back/style/layui/css/layui.css">
    <script type="text/javascript" src ="back/style/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src ="back/style/layui/layui.js"></script>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="front/scripts/html5shiv.v3.72.min.js"></script>
    <script type="text/javascript" src="back/style/layui/layui.js"></script>
    <![endif]-->
    <script type="text/javascript">
        var navID = "3";
        var menuID = "1";
    </script>
    <style type="text/css">
        .Banner {
            background: url(front/uploadfiles/image/banner/Banner_Product.jpg) no-repeat center top;
        }
    </style>
</head>

<body>
<jsp:include page="head.jsp">
    <jsp:param name="navId" value="3"/>
</jsp:include>

<aside class="Banner">
</aside>

<div class="Current">
    <div class="CurrentMain">
        <dl><a href="#">产品中心</a> <a href="/food/getListByType/<c:if test="${foodDetail.foodType.equals('婴幼儿')}">1</c:if>
<c:if test="${foodDetail.foodType.equals('幼儿')}">2</c:if>
<c:if test="${foodDetail.foodType.equals('孕产妇')}">3</c:if>">${foodDetail.foodType}系列</a> <span>新西兰纽派婴幼儿乳钙60粒装</span>
        </dl>
    </div>
</div>

<section class="Contain">
    <section class="MainContent">
        <div class="Content">
            <div class="Product">
                <div class="ProductInfo">
                    <div class="ProductInfo1">
                        <div class="ProductImg">
                            <img src="back/style/img/${foodDetail.pic}"/>
                            <a href="#" class="MoreProd">更多适合产品</a>
                            <a href="#" class="NewProd">最新推荐产品</a>
                        </div>
                        <div class="ProductBrief">
                            <div class="ProductTitle">${foodDetail.detailName}<span>婴幼儿配方奶粉</span></div>
                            <div class="ProductBriefCont" style="position: relative">
                                <p style="font-size:14px;"><b style="color:#ec071e;">适用年龄段：</b>${foodDetail.ageRange}
                                </p>
                                <p style="font-size:14px;"><b style="color:#ec071e;">价格:</b><strong style="color: red;font-size: 30px;">&nbsp￥${foodDetail.price}</strong></p>
                                <p style="font-size:14px;"><b style="color:#ec071e;">购买可得积分:</b>${foodDetail.integral}
                                </p>
                                <p style="font-size:14px;"><b style="color:#ec071e;">包装规格：</b>${foodDetail.packing}</p>
                                <p style="font-size:14px;"><b style="color:#ec071e;">产品简介:</b><br/>
                                    ${foodDetail.profile}
                                </p>
                                <div style="position: absolute; float: right;right: 150px;bottom: 0px;">
                                    <button id="addCart" class="layui-btn layui-btn-lg layui-btn-danger" type="button">
                                        加入购物车
                                    </button>
                                </div>

                            </div>
                            <div class="ProductLinkList">
                                <a href="#"><img src="front/uploadfiles/image/bgMall1.jpg" width="99" height="40"/></a>
                                <a href="#"><img src="front/uploadfiles/image/bgMall2.jpg" width="99" height="40"/></a>
                                <a href="#"><img src="front/uploadfiles/image/bgMall3.jpg" width="99" height="40"/></a>
                                <a href="#"><img src="front/uploadfiles/image/bgMall4.jpg" width="99" height="40"/></a>
                                <a href="#"><img src="front/uploadfiles/image/bgMall5.jpg" width="99" height="40"/></a>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="ProductInfo2">
                        <div class="ProductTab">产品介绍<span>Product introduction</span></div>
                        <div class="ProductCont">
                            <p style="font-size:13px; color:#828282;">${foodDetail.detailProfile}</p><br/>

                            <p style="font-size:13px; color:#828282;"><b
                                    style="font-size:14px; color:#ec071e;">温馨提示</b> ${foodDetail.warn}</p><br/><br/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="clear"></div>
</section>

<script>
    $(function () {
        $("#addCart").click(function () {
            var id = "${foodDetail.foodId}";
            $.ajax({
                url:"food/addCart/" + id,
                success:function (data) {
                    if(data.result){


                        layui.use('layer', function(){
                            var layer = layui.layer;
                            layer.msg('添加成功', {
                                icon: 1,
                                time: 1000}//2秒关闭（如果不配置，默认是3秒）
                                ,function(){
                                    location.reload();
                            });
                        });


                    }else{
                        layui.use('layer', function(){
                            var layer = layui.layer;
                            layer.msg('该商品已在购物车', {
                                icon: 2,
                                time: 2000 //2秒关闭（如果不配置，默认是3秒）
                            });
                        });
                    }
                }
            });

        })

    })
</script>

</body>
</html>