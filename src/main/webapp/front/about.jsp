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
   var navID = "2";
   var menuID="1";
</script>
<style type="text/css">
.Banner{ background:url(front/uploadfiles/image/banner/Banner_About.jpg) no-repeat center top;}
</style>
</head>

<body>
<jsp:include page="head.jsp">
    <jsp:param name="navId" value="2"/>
</jsp:include>

<aside class="Banner">
</aside>

<div class="Current">
    <div class="CurrentMain">
        <dl><a href="#">关于纽派</a>  <span>公司介绍</span></dl>
        <aside class="SildeBar">
          <nav class="MenuList">
   <ul>
      <li id="menu1"><a href="#">公司简介</a></li>
      <li id="menu2"><a href="#">发展历程</a></li>
      <li id="menu3"><a href="#">合作伙伴</a></li>
      <li id="menu4"><a href="#">联系我们</a></li>
   </ul>
</nav>
<script type="text/javascript">
  $("#menu"+menuID).addClass("onmenu");
</script>
        </aside>
    </div>
</div>

<section class="Contain">
	<section class="MainContent">
    <div class="Content">
        <article class="SinglePage">
        <br />
        <p style="color:#4c4142; font-size:2em; line-height:1.5;">深圳优之优贸易有限公司</p>
        <p style="font-size:1.33em; color:#fa172d; line-height:1.5;">深圳优之优贸易有限公司是新西兰纽派品牌在中国大陆的营销公司</p><br /><br />
        <p style="color:#897e7f; line-height:1.7;">深圳优之优贸易有限公司是新西兰纽派品牌在中国大陆的营销公司，公司有雄厚的经济基础，完备的技术和人员配置,拥有一支业务精英，操作能力强的骨干队伍，提供专业化、个性化、全天候、全方位的服务。</p><br />
        <p style="color:#897e7f; line-height:1.7;">新西兰纽派婴幼儿辅食营养补充品的生产厂商新西兰GMP制药有限公司，是新西兰最大的制药厂商。企业通过了ISO9001国际质量管理体系，世界卫生组织药品生产质量管理规范（GMP），国际食品安全危害控制体系</p><br />
        <p style="color:#897e7f; line-height:1.7;">（HACCP），以及新西兰奶制品风险管理体系（RMP）等食品安全管理体系的认证，产品质量安全可靠，均获得新西兰国家食品安全局（NZFSA）颁布的产品出口自由销售证书。</p><br />
        <p style="color:#897e7f; line-height:1.7;">我们的宗旨是：“用服务与真诚来换取您的信任与支持，互惠互利，共创双赢！”我公司愿与国内各界同仁志士竭诚合作，共创未来！</p><br /><br />
        <img src="front/uploadfiles/image/AboutImg.jpg" />
        <br /><br /><br /><br /><br />
        </article>
    </div>
   </section>
   <div class="clear"></div>
</section>

<jsp:include page="bottom.jsp"/>
</body>
</html>