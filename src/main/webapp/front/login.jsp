<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%><!DOCTYPE html>
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
<script type="text/javascript">
   var navID = "2";
   var menuID="1";
   function getoIndex(){
       location="front/index.jsp";
   }
</script>
<style type="text/css">
.Banner{ background:url(front/uploadfiles/image/banner/Banner_About.jpg) no-repeat center top;}
</style>
</head>

<body>
<!--top-->
<header class="Toper" style="padding-top:20px;">
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

<section class="Contain">
	<section class="MainContent" style="min-height:610px; background:url(front/images/loginbg.jpg) no-repeat left top; margin-top:130px;">
    <div class="Content">
        <div class="Login">
            <form action="/user/login" method="post">
        	<table cellpadding="0" cellspacing="0" border="0">
            	<tr>
                	<td><span class="LoginLei1"><a href="front/login1.jsp">手机动态码登陆</a></span><p class="LoginTitle">用户登录</p></td>
                </tr>

            	<tr>
                	<td>
                    	<input type="text" name="phone" class="text textPhone" value="手机号码" onblur="if(this.value=='')this.value='手机号码';" onfocus="if(this.value=='手机号码')this.value='';" />
                    </td>
                </tr>
            	<tr>
                	<td><input type="password" name="password" class="text textPassword"   /></td>
                </tr>
            	<tr>
                	<td><input type="checkbox" name="rememberMe" class="checkbox"  />7天内自动登录 <a href="#" class="ForgetPassword">忘记密码?</a></td>
                </tr>
            	<tr>
                	<td><input type="submit" style="cursor: pointer" class="Btn_login" value="登 录" /></td>
                </tr>
            	<tr>
                	<td>
                    	<p class="IsReg">提示：还不是会员 ?  <a href="front/register.jsp" class="RegNow">立即注册</a></p>
                        <p class="LoginProtocol">提示：未注册纽派账号的手机号，登录时将自动<br />注册纽派账号，且代表您已同意<a href="#">《纽派用户协议》</a></p>
                    </td>
                </tr>
            </table>
            </form>
            <div class="WebPartners">
            	<p>使用合作网站账号登录</p>
                <div class="WebPartnersList">
                	<a href="#"><img src="front/images/bg42.jpg" width="18" height="18" /></a>
                	<a href="#"><img src="front/images/bg43.jpg" width="18" height="18" /></a>
                    <a href="#"><img src="front/images/bg44.jpg" width="18" height="18" /></a>
                </div>
            </div>
        </div>
    </div>
   </section>
   <div class="clear"></div>
</section>

<jsp:include page="bottom.jsp"/>


</body>

<script type="text/javascript">
    $(function () {
        var myMsg = "${msg}".trim();
        if(myMsg !== "" ){
            layui.use('layer', function(){
                var layer = layui.layer;

                layer.msg(myMsg, {
                    icon: 2,
                    time: 2000 //2秒关闭（如果不配置，默认是3秒）
                });
            });
        }
    })

</script>
</html>