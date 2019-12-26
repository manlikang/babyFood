<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<script type="text/javascript" src="front/scripts/jquery-1.9.1.min.js"></script>
<!--[if lt IE 9]>
  <script type="text/javascript" src="front/scripts/html5shiv.v3.72.min.js"></script>
<![endif]-->
<script type="text/javascript">
   var navID = "5";
   var menuID="2";
</script>
<style type="text/css">
.Banner{ background:url(front/uploadfiles/image/banner/Banner_Interact.jpg) no-repeat center top;}
</style>


</head>

<body>

<jsp:include page="head.jsp">
    <jsp:param name="navId" value="5"/>
</jsp:include>
<aside class="Banner">
</aside>

<div class="Current">
    <div class="CurrentMain">
        <dl><a href="#">会员中心</a>  <span>互动专区</span></dl>
        <aside class="SildeBar">
         <nav class="MenuList">
   <ul>
      <li id="menu1"><a href="interact_inquiry.html">防伪查询</a></li>
      <li id="menu2"><a href="interact_child.jsp">互动专区</a></li>
      <li id="menu3"><a href="online.html">在线问答</a></li>
      <li id="menu4"><a href="knowledge.html">育儿知识</a></li>
   </ul>
</nav>
<script type="text/javascript">
    $("#menu2").addClass("onmenu");
</script>
        </aside>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $(".like").click(function () {
            var data =$(this).attr("data");
            var num = Number($(this).text());
            var id =$(this).attr("idValue");
            if(data == "off"){
                $(this).html(num+1);
                $(this).attr("data","on");
                $(this).css({
                    'background':'url(front/images/bg351.jpg)'
                })

            }else{
                $(this).html(num-1);
                $(this).attr("data","off");
                $(this).css({
                    'background':'url(front/images/bg35.jpg)'
                })

            }
            num = $(this).html();
            console.log(num,id);
            $.ajax({
                url:"/baby/updatelike/"+id+"/"+num,
                success:function (data) {
                    console.log(data.data);
                }
            })
        })
    })
</script>
<section class="Contain">
	<section class="MainContent">
    <div class="Content">
        <div class="Interact">
        	<div class="InteractColumn">
                <a href="interact_table.html">上传照片</a>
            	<span>宝贝照片展示</span>
                <p>Baby photos show</p>
            </div>
            <div class="Interact_Child">
            	<ul>
                    <c:forEach items="${pageInfo.list}" var="baby">
                	<li>
                    	<img src="back/style/img/${baby.pic}" width="112" height="112" />
                        <div class="ChildInfo" onselectstart="return false">
                        	<div class="ChildCont">
                            	<p>${baby.name}</p>
                                <p>${baby.age}</p>
                                <a style="cursor: pointer" idValue="${baby.id}" class="like" data="off">${baby.like}</a>
                            </div>
                        </div>
                    </li>
                    </c:forEach>

                    <div class="clear"></div>
                </ul>

            </div>
            <jsp:include page="../page.jsp"/>
        </div>
    </div>
   </section>
   <div class="clear"></div>
</section>

<script type="text/javascript">
$(".Condition table tr:even").css("background","#f5f5f5");
</script>

<jsp:include page="bottom.jsp"/>
</body>
</html>