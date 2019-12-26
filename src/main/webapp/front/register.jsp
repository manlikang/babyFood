<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="zh-cn">
<head>
    <base href="<%=request.getContextPath()%>/"/>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="Author" content="">
<meta content=" shop116703760.taobao.com/index.htm" name="design">
<title>深圳优之优贸易有限公司</title>
<link rel="stylesheet" type="text/css" href="front/css/css_whir.css"/>
    <link rel="stylesheet" href="back/style/layui/css/layui.css">

<script type="text/javascript" src="front/scripts/jquery-1.9.1.min.js"></script>
<!--[if lt IE 9]>
  <script type="text/javascript" src="front/scripts/html5shiv.v3.72.min.js"></script>
<![endif]-->
<script src="front/scripts/jquery.SuperSlide.js" type="text/javascript"></script>


<script type="text/javascript">
   var navID = "2";
   var menuID="1";
</script>
    <style type="text/css">

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
        <div class="clear"></div>
    </div>
</header>

<!--top End-->
<script type="text/javascript">
    $(function () {
        var phoneFlag = false;

        setInterval(function () {
            if(phoneFlag){
                $("#next").removeAttr("disabled");
            }else{
                $("#next").attr("disabled","disabled");
            }
        },200)


        $("#phone").bind('input propertychange',function () {
            var phone = $(this).val().trim();
            if(phone!=null && phone!=''){
                $.get("user/isPhone/"+phone,function (data) {
                    if(data.result){
                        $("#phone + span").html("<span style='color: #00B83F'>恭喜可用</span>")
                        $("#phone").attr("style","border:1px green solid")
                        phoneFlag = true;
                    }else{
                        $("#phone + span").html("<span style='color:red'>该手机号已被注册</span>")
                        $("#phone").attr("style","border:1px red solid")
                        phoneFlag = false
                    }
                })
            }else{
                $("#phone + span").html("<span style='color:red'>手机号不能为空</span>")
                $("#phone").attr("style","border:1px red solid")
                phoneFlag = false;
            }
        })

        var userNameFlag=false

        $("#username").bind('input propertychange',function () {
            var username = $(this).val().trim();
            if(username!=null && username!=''){
                $.get("user/isUserName/"+username,function (data) {
                    if(data.result){
                        $("#username + span").html("<span style='color: #00B83F'>恭喜可用</span>")
                        $("#username").attr("style","border:1px green solid")
                        userNameFlag = true;
                    }else{
                        $("#username + span").html("<span style='color:red'>该用户名已被注册</span>")
                        $("#username").attr("style","border:1px red solid")
                        userNameFlag= false
                    }
                })
            }else{
                $("#username + span").html("<span style='color:red'>用户名不能为空</span>")
                $("#username").attr("style","border:1px red solid")
                userNameFlag= false;
            }
        })

        $("#submit").click(function () {
           if(userNameFlag){
               $.post("user/register",$("form").serialize(),function (data) {
                   if(data.result){
                       $(".Speed3").addClass("onSpeed");
                       $(".Speed2").removeClass("onSpeed");
                       $(".SpeedCont .SpeedCont2").hide();
                       $(".SpeedCont .SpeedCont3").show();
                   }
               })

           }

        })
        
        
        $("#next").click(function () {
            if(!$("#checkbox").prop("checked")){
                alert("您必须同意用户协议!!!")
            }else{
                $(".Speed2").addClass("onSpeed");
                $(".Speed1").removeClass("onSpeed");
                $(".SpeedCont .SpeedCont1").hide();
                $(".SpeedCont .SpeedCont2").show();
            }


        })
    })

</script>


<section class="Contain">
	<section class="MainContent">
        <div class="RegCurrent">
        	<span class="IsHave">已有纽派账号?<a href="front/login.jsp">登录</a></span>
            <span class="RegTitle">注册纽派账号</span>
        </div>
        <div class="Content">
            <div class="Speed">
            	<a href="javascript:void(0);" class="Speed1"><span>1</span>设置登录名</a>
            	<a href="javascript:void(0);" class="Speed2"><span>2</span>填写账户信息</a>
            	<a href="javascript:void(0);" class="Speed3"><span>√</span>注册成功</a>
            </div>
           	<div class="SpeedCont">
                <form >
            	<div class="SpeedContDiv SpeedCont1">
                	<table style="width: 600px" cellpadding="0" cellspacing="0" border="0">
                    	<tr>
                        	<td width="100">手机号码：</td>
                            <td width="500px">
                            	<input  id="phone" type="text" name="phone" class="text" />
                                <span></span>
                            </td>
                        </tr>

                    	<tr>
                        	<td>设置密码：</td>
                            <td><input type="text" name="password" class="text" /></td>
                        </tr>
                    	<tr>
                        	<td></td>
                            <td>
                            	<input type="button" disabled="disabled"  style="cursor: pointer" id="next" class="Btn_Reg" value="同意以下协议并下一步" />
                                <input type="checkbox" id="checkbox" class="checkbox" /><span class="Reg_Protocol">《纽派用户协议》</span>
                            </td>
                        </tr>

                    </table>
                </div>
                <div class="SpeedContDiv SpeedCont2" >
                    <table style="width: 600px"  cellpadding="0" cellspacing="0" border="0">
                    	<tr>
                        	<td width="100">&nbsp;&nbsp;&nbsp;用户名：</td>
                            <td>
                            	<input id="username" name="username" type="text" class="text" />
                                <span></span>
                            </td>
                        </tr>


                    	<tr>
                        	<td>真实姓名：</td>
                            <td><input type="text" name="truename" class="text" /></td>
                        </tr>

                        <tr>
                            <td width="100"> &nbsp;&nbsp;&nbsp;&nbsp;昵&nbsp;称：</td>
                            <td><input name="nickname" type="text" class="text" /></td>
                        </tr>
                        <tr>
                            <td width="100"> &nbsp;&nbsp;&nbsp;&nbsp;性&nbsp;别：</td>
                            <td><select name="sex">
                                <option value="男" selected>男</option>
                                <option value="女">女</option>
                            </select></td>
                        </tr>
                        <tr>
                            <td>出生日期：</td>
                            <td><input name="birthday" id="date" type="text" class="text"  /></td>
                        </tr>
                        <tr>
                            <td>邮箱地址：</td>
                            <td><input name="email" type="text" class="text"/></td>
                        </tr>

                    	<tr>
                        	<td></td>
                            <td>
                            	<input type="button" id="submit" class="Btn_Next" value="立即注册" />
                            </td>
                        </tr>
                    </table>
                </div>

                </form>
                <div class="SpeedContDiv SpeedCont3">
                    <div style="height: 200px;width: 600px; padding-left: 300px;padding-top: 100px"><h1 style="font-size: 30px">恭喜您,注册成功!!!  赶快<a style="color: red" href="front/login.jsp">登录</a>吧</h1></div>
                </div>
            </div>
        </div>
	</section>
</section>
<script type="text/javascript" src ="back/style/layui/layui.js"></script>
<script type="text/javascript">

$(".Speed a:first").addClass("onSpeed");
$(".SpeedCont .SpeedContDiv:first").show();
//$(".SpeedCont .SpeedContDiv").eq(1).show();

layui.use('laydate', function(){
    var laydate = layui.laydate;
    laydate.render({
        elem: '#date' ,//指定元素
        format: 'yyyy年MM月dd日' ,//可任意组合
        value: '2008年08月18日' //必须遵循format参数设定的格式

    });
});
</script>

<jsp:include page="bottom.jsp"/>
</body>
</html>