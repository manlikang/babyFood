<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <base href="<%=request.getContextPath()%>/"/>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="Author" content="">
<title>深圳优之优贸易有限公司</title>
<link rel="stylesheet" type="text/css" href="front/css/css_whir.css"/>
    <link rel="stylesheet" href="back/style/layui/css/layui.css">
    <script type="text/javascript" src ="back/style/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src ="back/style/layui/layui.js"></script>
<!--[if lt IE 9]>
  <script type="text/javascript" src="front/scripts/html5shiv.v3.72.min.js"></script>
<![endif]-->
<script src="front/scripts/jquery.SuperSlide.js" type="text/javascript"></script>
<script type="text/javascript">
   var navID = "0";
</script>

</head>

<body>
<jsp:include page="head.jsp">
    <jsp:param name="navId" value="1"/>
</jsp:include>

<aside class="HomeBan">
    <div class="layui-carousel BanList" id="test1">
<%--        <ul>--%>
<%--            <li style="background:url(front/uploadfiles/image/banner/HomeBan.jpg) no-repeat center top;"><a href="foodDetail/toProductinfo/18"></a></li>--%>
<%--            <li style="background:url(front/uploadfiles/image/banner/HomeBan.jpg) no-repeat center top;"><a href="foodDetail/toProductinfo/18"></a></li>--%>
<%--            <li style="background:url(front/uploadfiles/image/banner/HomeBan.jpg) no-repeat center top;"><a href="foodDetail/toProductinfo/18"></a></li>--%>
<%--        </ul>--%>

        <div carousel-item>
            <div><a href="foodDetail/toProductinfo/18"><img src="front/uploadfiles/image/banner/HomeBan.jpg"></a></div>
            <div><a href="foodDetail/toProductinfo/18"><img src="front/uploadfiles/image/banner/HomeBan.jpg"></a></div>
            <div><a href="foodDetail/toProductinfo/18"><img src="front/uploadfiles/image/banner/HomeBan.jpg"></a></div>
            <div><a href="foodDetail/toProductinfo/18"><img src="front/uploadfiles/image/banner/HomeBan.jpg"></a></div>
            <div><a href="foodDetail/toProductinfo/18"><img src="front/uploadfiles/image/banner/HomeBan.jpg"></a></div>

        </div>

    </div>
    <div class="Tab">
    	<div class="TabList">
        	<span></span>
        	<span></span>
        	<span></span>
        </div>
    </div>
</aside>
<script type="text/javascript">
    layui.use('carousel', function(){
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1'
            ,width: '100%' //设置容器宽度
            ,height:'480px'
            ,arrow: 'hover' //始终显示箭头
            //,anim: 'updown' //切换动画方式
        });
    });

	jQuery(".HomeBan").slide({ mainCell: ".BanList ul",titCell:".Tab .TabList span", effect: "fold", autoPlay: true,interTime:5000,delayTime:1500 });
</script>


<section class="HomeContain">
    <div class="HomeContent">
    	<div class="Security">
        	<div class="SecurityTitle">
            	<span>防伪查询</span>
                <p>Security Check</p>
            </div>
            <div class="SecuritySearch">
            	<p>在线防伪检查系统&nbsp;&nbsp;&nbsp;&nbsp;请在下面的方框内输入防伪码</p>
                <div class="SecuritySreachBox">
                    <a href="javascript:void(0)" onclick="return GoSearchUrl1();" class="Security_sreach_btn"></a>
                    <input name="" type="text" class="Security_sreach_ipu" id="key1" value="请在方框内输入防伪码" onblur="if(this.value=='')this.value='请在方框内输入防伪码';" onfocus="if(this.value=='请在方框内输入防伪码')this.value='';" onkeydown="entersearch1()"/>
                    <div class="clear"></div>
                </div>
                <a href="#" class="SecurityKnow">点击了解防伪查询</a>
            </div>
            <div class="SecurityRight">
            	<p>恭喜您！你所购买防伪编码为<span>124505315</span>的产品是正品。</p>
                <a href="#" class="Integral" name="我要积分"></a>
            </div>
            <div class="clear"></div>
        </div>
        <div class="HomeCont">
            <div class="HomeBox1">
            	<span>产品申请试用</span>
                <a href="#"><img src="front/uploadfiles/image/HomeTryout.jpg" width="294" height="256" /></a>
            </div>
            <div class="HomeBox2">
            	<div class="HomeProdTitle">产品中心<span>Products</span></div>
                <div class="HomeProd">
                	<a href="javascript:void(0);" class="Prev"></a>
                	<a href="javascript:void(0);" class="Next"></a>
                	<div class="HomeProdList">
                    	<ul>

                            <c:if test="${babyFoodList==null}">
                                <li><a href="front/jump.jsp"><img src="front/uploadfiles/image/HomeProdImg1.jpg" /><p>新西兰纽派贝贝盖乳清粉</p></a></li>
                                <li><a href="front/jump.jsp"><img src="front/uploadfiles/image/HomeProdImg2.jpg" /><p>新西兰纽派叶酸片</p></a></li>
                                <li><a href="front/jump.jsp"><img src="front/uploadfiles/image/HomeProdImg3.jpg" /><p>新西兰纽派藻油DHA</p></a></li>
                                <li><a href="front/jump.jsp"><img src="front/uploadfiles/image/HomeProdImg1.jpg" /><p>新西兰纽派贝贝盖乳清粉</p></a></li>
                                <li><a href="front/jump.jsp"><img src="front/uploadfiles/image/HomeProdImg2.jpg" /><p>新西兰纽派叶酸片</p></a></li>
                                <li><a href="front/jump.jsp"><img src="front/uploadfiles/image/HomeProdImg3.jpg" /><p>新西兰纽派藻油DHA</p></a></li>
                            </c:if>

                            <c:if test="${babyFoodList!=null}">
                            <c:forEach items="${babyFoodList}" var="list">
                                <li> <a href="foodDetail/toProductinfo/${list.id}">
                                    <img src="back/style/img/${list.foodpic}" /><p>${list.foodName}</p></a></li>
                            </c:forEach>
                            </c:if>

                        </ul>
                    </div>
                </div>
            </div>
            <div class="clear"></div>
        </div>
        <div class="HomeCont">
        	<div class="HomeBox3">
            	<div class="HomeBox3Title">新闻资讯<span>News</span></div>
                <div class="HomeNewsTab">
                	<ul>
                    	<li><span>企业动态</span></li>
                    	<li><span>行业动态</span></li>
                    </ul>
                </div>
                <div class="HomeNews1">
                	<dl>
                    	<dt>
                        	<div class="HomeNewsImg"><a href="#"><img src="front/uploadfiles/image/HomeNewsImg1.jpg" width="99" height="70" /></a></div>
                            <div class="HomeNewsCont">
                            	<a href="#">好孕好吸收，健康胎宝宝</a>
                                <p>炎热的夏季来临，各式凉鞋也粉墨登场颇让人眼花缭乱...</p>
                            </div>
                            <div class="clear"></div>
                        </dt>
                        <dd><span>[2014-09-30]</span><a href="#">2000份孕妇奶粉免费试用！</a></dd>
                        <dd><span>[2014-09-30]</span><a href="#">90后辣妈分享孕期营养巧搭配</a></dd>
                        <dd><span>[2014-09-30]</span><a href="#">2000份孕妇奶粉免费试用！</a></dd>
                        <dd><span>[2014-09-30]</span><a href="#">90后辣妈分享孕期营养巧搭配</a></dd>
                        <dd><span>[2014-09-30]</span><a href="#">2000份孕妇奶粉免费试用！</a></dd>
                        <dd><span>[2014-09-30]</span><a href="#">90后辣妈分享孕期营养巧搭配</a></dd>
                        <dd><span>[2014-09-30]</span><a href="#">2000份孕妇奶粉免费试用！</a></dd>
                    </dl>
                </div>
                <div class="HomeNews1">
                	<dl>
                    	<dt>
                        	<div class="HomeNewsImg"><a href="#"><img src="front/uploadfiles/image/HomeNewsImg1.jpg" width="99" height="70" /></a></div>
                            <div class="HomeNewsCont">
                            	<a href="#">好孕好吸收，健康胎宝宝1</a>
                                <p>炎热的夏季来临，各式凉鞋也粉墨登场颇让人眼花缭乱...</p>
                            </div>
                            <div class="clear"></div>
                        </dt>
                        <dd><span>[2014-09-30]</span><a href="#">2000份孕妇奶粉免费试用！</a></dd>
                        <dd><span>[2014-09-30]</span><a href="#">90后辣妈分享孕期营养巧搭配</a></dd>
                        <dd><span>[2014-09-30]</span><a href="#">2000份孕妇奶粉免费试用！</a></dd>
                        <dd><span>[2014-09-30]</span><a href="#">90后辣妈分享孕期营养巧搭配</a></dd>
                        <dd><span>[2014-09-30]</span><a href="#">2000份孕妇奶粉免费试用！</a></dd>
                        <dd><span>[2014-09-30]</span><a href="#">90后辣妈分享孕期营养巧搭配</a></dd>
                        <dd><span>[2014-09-30]</span><a href="#">2000份孕妇奶粉免费试用！</a></dd>
                    </dl>
                </div>
            </div>
            <div class="HomeBox4">
            	<div class="HomeBox4Title">在线问答<span>Q & A</span><a href="#">more+</a></div>
                <div class="HomeQA">
                	<dl>
                    	<dt>
                        	<p>我们可以帮助您找到问题答案，让您的孩子健康快乐成长!</p>
                            <div class="HomeQACont">
                            	<textarea>输入您的问题</textarea>
                                <input type="button" class="HomeBTN" value="提问" />
                                <div class="SelectBox">
                                    <span class="SelectText">请选择</span>
                                    <dl class="SelectList">
                                        <dt><a href="javascript:void(0)">婴幼儿</a></dt>
                                        <dt><a href="javascript:void(0)">小孩</a></dt>
                                    </dl>
                                </div>
                            </div>
                            <div class="clear"></div>
                        </dt>
                        <dd><span>[2014-09-30]</span><a href="#">2000份孕妇奶粉免费试用！</a></dd>
                        <dd><span>[2014-09-30]</span><a href="#">90后辣妈分享孕期营养巧搭配</a></dd>
                        <dd><span>[2014-09-30]</span><a href="#">2000份孕妇奶粉免费试用！</a></dd>
                        <dd><span>[2014-09-30]</span><a href="#">90后辣妈分享孕期营养巧搭配</a></dd>
                        <dd><span>[2014-09-30]</span><a href="#">2000份孕妇奶粉免费试用！</a></dd>
                        <dd><span>[2014-09-30]</span><a href="#">90后辣妈分享孕期营养巧搭配</a></dd>
                    </dl>
                </div>
            </div> 
            <div class="HomeBox5">
            	<div class="HomeBox5Title">育儿知识<span>Parenting</span><a href="#">more+</a></div>
                <div class="HomeKnow">
                	<dl>
                    	<dt>
                        	<div class="HomeKnowImg"><a href="#"><img src="front/uploadfiles/image/HomeKnowImg1.jpg" width="99" height="70" /></a></div>
                            <div class="HomeKnowCont">
                            	<a href="#">好孕好吸收，健康胎</a>
                                <p>炎热的夏季来临，各式凉鞋也粉墨登场颇让人...</p>
                            </div>
                            <div class="clear"></div>
                        </dt>
                        <dd><span>[2014-09-30]</span><a href="#">2000份孕妇奶粉免费试用！</a></dd>
                        <dd><span>[2014-09-30]</span><a href="#">90后辣妈分享孕期营养巧搭配</a></dd>
                        <dd><span>[2014-09-30]</span><a href="#">2000份孕妇奶粉免费试用！</a></dd>
                        <dd><span>[2014-09-30]</span><a href="#">90后辣妈分享孕期营养巧搭配</a></dd>
                        <dd><span>[2014-09-30]</span><a href="#">2000份孕妇奶粉免费试用！</a></dd>
                        <dd><span>[2014-09-30]</span><a href="#">90后辣妈分享孕期营养巧搭配</a></dd>
                        <dd><span>[2014-09-30]</span><a href="#">2000份孕妇奶粉免费试用！</a></dd>
                    </dl>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</section>

<script type="text/javascript">
	jQuery(".HomeProd").slide({ mainCell: ".HomeProdList ul", effect: "leftLoop",prevCell:".Prev",nextCell:".Next", autoPlay: true,vis:3,scroll:1});
	$(".HomeNewsTab ul li:first").addClass("on");
	$(".HomeNews1:first").show();
	$(".HomeNewsTab ul li").each(function(i){
		$(this).click(function(){
			$(".HomeNewsTab ul li").removeClass("on");
			$(this).addClass("on");
			$(".HomeNews1").hide();
			$(".HomeNews1").eq(i).show();
		});
	});
	
</script>

<script type="text/javascript">
	$(".HomeQACont textarea").focus(function(){
		$(this).text("");
	});
	$(".HomeQACont textarea").blur(function(){
		$(this).text("输入您的问题");
	});
  $(".SelectBox").each(function(){
		$(this).find(".SelectText").click(function(){
			 var SelectListStatis = $(this).next(".SelectList").css("display");
			 if(SelectListStatis == "none"){
					$(this).next(".SelectList").show();
				 }
			 else{
					$(this).next(".SelectList").hide();
				 }
		 });
		 $(this).find(".SelectList").children("dt").click(function(){
				 var Value = $(this).find("a").text();
				 $(this).parents(".SelectList").prev(".SelectText").text(Value);
				 $(this).parents(".SelectList").hide();
			 });
		 $(this).mouseleave(function(){ $(this).find(".SelectList").hide(); });
	});
</script>

<jsp:include page="bottom.jsp"/>

<script type="text/javascript">
function GoSearchUrl1() {
	var searchinput = document.getElementById("key1");
	if (searchinput.value == "" || searchinput.value == "请在方框内输入防伪码") {
		alert("请输入防伪码！");
		searchinput.focus();
		return false;
	}
	if (searchinput.value.length > 50) {
		alert("输入的关键字字数不要过多！");
		searchinput.focus();
		return false;
	}
	CheckString(searchinput.value);
}
function entersearch1() {
	//alert(dd);
	var event = window.event || arguments.callee.caller.arguments[0];
	if (event.keyCode == 13) {
		GoSearchUrl();
	}
}

</script>
</body>
</html>