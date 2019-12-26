<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
    <link rel="stylesheet" href="back/style/layui/css/layui.css">
    <script type="text/javascript" src ="back/style/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src ="back/style/layui/layui.js"></script>
<!--[if lt IE 9]>
  <script type="text/javascript" src="front/scripts/html5shiv.v3.72.min.js"></script>
<![endif]-->
    <style>
        .new-address{
            float: right;
            width: 100px;
            height: 50px;
            backgroung: green;
        }

        .default{
            color: #FF5722;
        }
        .default a{
            color: #FF5722;
        }

    </style>
    <script>



        $(function () {

            var menuId = "${menuId}";
            console.log("menuID::"+menuId);
            $(".my-menu").removeClass("onmenuID");
            $("#m"+menuId).addClass("onmenuID");
            $(".ttt").attr("style","display: none");
            $("#title"+menuId).attr("style","display: inline");

            $(".my-menu").click(function () {
                $(".my-menu").removeClass("onmenuID");
                $(this).addClass("onmenuID");
                var id = $(this).attr("id").split("m")[1];
                $(".ttt").attr("style","display: none");
                $("#title"+id).attr("style","display: inline");
            });



            $(".deladdress").click(function () {
                var id =$(this).attr("id").split("n")[1];
                $("#addressId"+id).remove();
                $.ajax({
                    url:"user/removeAddress/"+id,
                    success:function (data) {
                        if(data.result){
                            console.log("成功");
                        }
                    }
                })
            })
        })
    </script>
</head>

<body>
<jsp:include page="head.jsp">
    <jsp:param name="navId" value="4"/>
</jsp:include>

<div class="Current">
    <div class="CurrentMain">
        <dl><a href="#">个人中心</a>  <span>账户信息</span></dl>
    </div>
</div>

<section class="Contain">
	<section class="MainContent">
    <div class="Content">
        <!--menu-->
		<div class="MemberMenu">
    <ul>
        <li style="cursor: pointer" id="m1" class="my-menu"><a style="cursor: pointer">账户信息</a></li>
        <li style="cursor: pointer" id="m2" class="my-menu"><a style="cursor: pointer">修改个人信息</a></li>
        <li style="cursor: pointer" id="m3" class="my-menu"><a style="cursor: pointer">我的积分</a></li>
        <li style="cursor: pointer" id="m4" class="my-menu"><a style="cursor: pointer">已买宝贝</a></li>
        <li style="cursor: pointer" id="m5" class="my-menu"><a style="cursor: pointer">我的地址</a></li>
        <li style="cursor: pointer" id="m6" class="my-menu"><a style="cursor: pointer">安全中心</a></li>
    </ul>
</div>

        <!--menu End-->

            <%--基本信息--%>
        <div id="title1" class="ttt" style="display: inline">
            <div class="MemberCurrent" style="background:none; border-bottom:1px dashed #cbbdbe;">
        	<span style="color:#2e0406;">我的账户</span>
        </div>
            <div class="MemberCont">
        	<div class="MemberTitle">
            	<span>账户信息</span>
            </div>
        	<div class="MemberContTable">
            	<table cellpadding="0" cellspacing="0" border="0">
                	<tr>
                    	<td rowspan="5" width="150" class="MemberTableImg"><img src="back/style/img/${user.picPath}"  onerror="front/images/MemberImg1.jpg" width="115" height="115" /></td>
                        <td colspan="3"><span class="MemberName">欢迎 ${user.truename}</span></td>
                    </tr>
                    <tr>
                    	<td width="250"><p>用户编号：${user.id}</p></td>
                    	<td width="320"><p>出生日期：${user.birthday}</p></td>
                    	<td><p>总积分：${user.integral}</p></td>
                    </tr>
                    <tr>
                    	<td><p>用户名：${user.username}</p></td>
                    	<td><p>手机号码：${user.phone}</p></td>
                    </tr>
                    <tr>
                    	<td><p>昵 称：${user.nickname}</p></td>
                    	<td><p>电子邮件：${user.email}</p></td>
                    	<td><p>已用积分：${user.usedIntegral}</p></td>
                    </tr>
                    <tr>
                    	<td><p>性 别：${user.sex}</p></td>
                    	<td><p>会员等级：${user.memberRank}<em><c:if test="${user.memberRank.equals('普通会员')}">（可享受0.1折优惠）</c:if>
                            <c:if test="${user.memberRank.equals('超级会员')}">（可享受0.5折优惠）</c:if></em></p></td>
                    	<td><p>冻结积分：${user.frozen}</p></td>
                    </tr>
                </table>
            </div>
        </div>
        </div>
        <c:if test="${user.sex=='男' }">
            <script >
                $(function(){
                    $("#sex").val('男')

                })
            </script>
        </c:if>


        <c:if test="${user.sex=='女' }">
            <script >
                $(function(){
                    $("#sex").val('女')

                })
            </script>

        </c:if>

            <%--修改信息--%>
        <div id="title2" class="ttt" style="display: none">
            <div class="MemberCurrent">
                <span>修改个人信息</span>
            </div>
            <div class="MemberUpdate">
                <div class="UpdateMenu">
                    <ul>
                        <li id="UpdateMenu1" class="onUpdateMenu"><a href="javascript:void(0);">信息详情</a></li>
                        <div class="clear"></div>
                    </ul>
                </div>
                <div class="UpdateContDiv">
                    <div class="UpdateExchange">
                        <span class="UpdateImg"><img src="front/images/Member_Information.jpg" /></span>
                        <div class="UpdateColumn">
                            <span>修改个人信息</span>
                            <div class="UpdateColCont">
                                <p>· 可以修改注册时的相关信息</p>
                                <p>· 可以上传头像或修改头像</p>
                            </div>
                        </div>
                    </div>
                    <div class="UpdateCont">
                        <div class="UpdateContMenu">
                            <ul>
                                <li><a href="javascript:void(0)">基本信息</a></li>
                                <li><a href="javascript:void(0)">头像照片</a></li>
                                <div class="clear"></div>
                            </ul>
                        </div>
                        <div class="UpdateContList">
                            <ul>
                                <li class="UpdateContList1">
                                    <form action="user/frontUpdate" method="post">
                                        <input type="hidden" name="id" value="${user.id}">
                                    <table class="UpdateContTable1" cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td width="100">当前头像：</td>
                                            <td>
                                                <img width="200px" height="200px"   src="back/style/img/${user.picPath}" onerror="front/images/MemberImg1.jpg" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="100">用&nbsp;户&nbsp;名&nbsp;：</td>
                                            <td>
                                                <input type="text" name="username" class="text" value="${user.username}" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="100">昵&nbsp;称&nbsp;：</td>
                                            <td>
                                                <input type="text" name="nickname" class="text" value="${user.nickname}" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="100">真实姓名&nbsp;：</td>
                                            <td>
                                                <input type="text" name="truename" class="text" value="${user.truename}" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="100">我的手机：</td>
                                            <td>
                                                <span>${user.phone}</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="100">性别&nbsp;：</td>
                                            <td>
                                                <select name="sex" id="sex">
                                                    <option value="男">男</option>
                                                    <option value="女">女</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>出生日期：</td>
                                            <td><input name="birthday" id="date" type="text" class="text"  /></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <input type="submit" class="Btn_Next" value="保存修改" />
                                            </td>
                                        </tr>
                                    </table>
                                    </form>
                                </li>
                                <li class="UpdateContList1">
                                    <div class="PostImage">
                                        <div class="PostList">
                                            <ul>
                                                <li><a href="javascript:void(0);">
                                                    <form id="form" action="/user/updateImg"  enctype="multipart/form-data" method="post">
                                                        <input type="hidden" name="id" value="${user.id}">
                                                        <input type="file" name="file" id="uploadFile" class="UploadImg" />
                                                    </form>
                                                    <img src="front/images/BenDi.jpg" />
                                                </a></li>
                                                <div class="clear"></div>
                                            </ul>
                                            <p>仅支持JPG、GIF、PNG图片文件，切文件小于5M</p>
                                        </div>
                                        <div class="PostWay">
                                            <div class="PostWayLeft">
                                                <div class="PostWayImgCont">
                                                    <img id="img" width="300px" height="300px" src="back/style/img/${user.picPath}" />
                                                </div>
                                            </div>
                                            <div class="PostWayRight">
                                                <p class="PostWayRightTitle">您上传的头像会自动生成三种尺寸，<br />请注意中小迟勋的头像是否清晰</p>
                                                <div class="PostWayRightBottom">
                                                    <div class="PostWayRightBottom">
                                                        <div class="PostWayBig">
                                                            <div class="PostWayBigImg"><span>没有预览可用</span></div>
                                                            <p>大尺寸头像，160×160像素</p>
                                                        </div>
                                                        <div class="PostWayMiddle">
                                                            <div class="PostWayMiddleImg"><span>没有预览可用</span></div>
                                                            <p>中尺寸头像60×60像素</p>
                                                        </div>
                                                        <div class="PostWaySmall">
                                                            <div class="PostWaySmallImg"><span></span></div>
                                                            <p>小尺寸头像30×30像素</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="clear"></div>
                                        </div>
                                        <a id="updateImg" ><button class="layui-btn layui-btn-danger">更新头像</button></a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>



            <%--我的积分--%>
        <div id="title3" class="ttt" style="display: none;">
            <div class="MemberCurrent">
                <span>我的积分</span>
            </div>

            <div >
            <table class="layui-table">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>用处</th>
                    <th>明细</th>
                    <th>剩余积分</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${integrals.list}" var="integral">
                <tr>
                    <td>${integral.id}</td>
                    <td>${integral.detailed}</td>
                    <td>${integral.usefulness}</td>
                    <td>${integral.surplus}</td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
            </div>

            <div id="test4" class="layui-main"></div>


        </div>
        <script type="text/javascript">
            layui.use('laypage', function(){
                var laypage = layui.laypage;
                //执行一个laypage实例
                laypage.render({
                    elem: 'test4',
                    count: ${integrals.total},
                    limit:${integrals.pageSize},
                    limits:[1,2,3,4,5],
                    curr:${integrals.currentPage},
                    groups:4,
                    layout:['count','prev','page','next','limit','refresh','skip'],
                    jump: function(obj, first){
                        if(!first){
                            console.log("${integrals.url}");

                            <%--$("#${param.bodyId}").load("${integralPage.url}?currentPage="+obj.curr+"&pageSize="+obj.limit,${params});--%>
                            location.href="${integrals.url}?currentPage="+obj.curr+"&pageSize="+obj.limit;
                        }
                    }
                });
            });
        </script>
        <%--已买宝贝--%>
        <div id="title4" class="ttt" style="display: none;">
            <div class="MemberCurrent">
                <span>已买宝贝</span>
            </div>

            <div >
                <table class="layui-table">
                    <thead>
                    <tr>
                        <th>编号</th>
                        <th>商品</th>
                        <th>商品图片</th>
                        <th>单价</th>
                        <th>数量</th>
                        <th>总价</th>
                        <th>日期</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${orderDetails.list}" var="order">
                        <tr>
                            <td>${order.id}</td>
                            <td>${order.foodname}</td>
                            <td><img src="back/style/img/${order.foodpic}"/></td>
                            <td>${order.foodprice}</td>
                            <td>${order.foodnum}</td>
                            <td>${order.foodTotalPrice}</td>
                            <td><fmt:formatDate value="${order.orderdate}" pattern="yyyy年MM月dd日" /></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div id="test2" class="layui-main"></div>
        </div>

        <script type="text/javascript">
            layui.use('laypage', function(){
                var laypage = layui.laypage;
                //执行一个laypage实例
                laypage.render({
                    elem: 'test2',
                    count: ${orderDetails.total},
                    limit:${orderDetails.pageSize},
                    limits:[1,2,3,4,5],
                    curr:${orderDetails.currentPage},
                    groups:4,
                    layout:['count','prev','page','next','limit','refresh','skip'],
                    jump: function(obj, first){
                        if(!first){
                            console.log("${orderDetails.url}");

                            <%--$("#${param.bodyId}").load("${integralPage.url}?currentPage="+obj.curr+"&pageSize="+obj.limit,${params});--%>
                            location.href="${orderDetails.url}?currentPage="+obj.curr+"&pageSize="+obj.limit;
                        }
                    }
                });
            });
        </script>
        <%--我的地址--%>
        <div id="title5" class="ttt" style="display: none;">
            <div class="MemberCurrent">
                <span>我的地址</span>
                <div class="new-address"><a style="color: white" href="front/addAddress2.jsp"><button type="button" class="layui-btn layui-btn-danger">新增地址</button></a></div>
            </div>

            <div >
                <table class="layui-table">
                    <thead>
                    <tr>
                        <th>编号</th>
                        <th>收货人</th>
                        <th>手机号</th>
                        <th>地址</th>
                        <th>设置</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${addresses}" var="address">
                        <c:if test="${address.isdefault.equals('是')}">
                        <tr id="addressId${address.id}" class="bbbb default">
                            <td>${address.id}</td>
                            <td>${address.shouhuoren}</td>
                            <td>${address.phone}</td>
                            <td>${address.address}</td>
                            <td><button id="Ad${address.id}" class="layui-btn layui-btn-sm layui-btn-danger aaaa ">取消默认</button></td>
                            <td><a style="cursor: pointer" href="/user/toUpdateAddress2/${address.id}">编辑</a>||<a id="deladdressn${address.id}" class="deladdress" style="cursor: pointer">删除</a></td>
                        </tr>
                        </c:if>

                        <c:if test="${address.isdefault.equals('否')}">
                            <tr id="addressId${address.id}" class="bbbb">
                                <td>${address.id}</td>
                                <td>${address.shouhuoren}</td>
                                <td>${address.phone}</td>
                                <td>${address.address}</td>
                                <td><button id="Ad${address.id}" class="layui-btn layui-btn-sm layui-btn-danger aaaa ">设为默认</button></td>
                                <td><a style="cursor: pointer" href="/user/toUpdateAddress2/${address.id}">编辑</a>||<a id="deladdressn${address.id}" class="deladdress" style="cursor: pointer">删除</a></td>
                            </tr>
                        </c:if>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>


        <div id="title6" class="ttt" style="display: none;">
            <div class="MemberCurrent">
                <span>修改密码</span>
            </div>
            <div style="width: 1000px">
                <div class="layui-form-item">
                    <label class="layui-form-label" style="font-size: 16px;width: 300px">请输入原密码:</label>
                    <div class="layui-input-inline">
                        <input id="oldpassword" type="password" name="password" required lay-verify="required"  autocomplete="off" class="layui-input" >
                    </div>
                    <div id="opWarn" class="layui-form-mid layui-word-aux"></div>
                </div>
            </div>

            <div style="width: 1000px">
                <div class="layui-form-item">
                    <label class="layui-form-label" style="font-size: 16px;width: 300px">请输入新密码:</label>
                    <div class="layui-input-inline">
                        <input id="newpassword" type="password" name="password" required lay-verify="required"  autocomplete="off" class="layui-input" >
                    </div>
                    <div id="npWarn" class="layui-form-mid layui-word-aux"></div>
                </div>
            </div>

            <div style="width: 1000px">
                <div class="layui-form-item">
                    <label class="layui-form-label" style="font-size: 16px;width: 300px">请确认新密码:</label>
                    <div class="layui-input-inline">
                        <input id="confirmpassword" type="password" name="password" required lay-verify="required"  autocomplete="off" class="layui-input" >
                    </div>
                    <div id="cnpWarn" class="layui-form-mid layui-word-aux"></div>
                </div>
            </div>

            <div style="width: 190px;background: green;margin-left: 329px;border-radius: 10px"  >

                <button id="update" class="layui-btn layui-btn-fluid  layui-btn-disabled" disabled >确认修改</button>
            </div>
            <br>
            <br><br><br><br><br>
            <hr>

        </div>
        <script>
        $(function () {
            var  oldFlag =false;
            var newFlag =false;
            var comfrimFlag = false;

            setInterval(function () {
                if(oldFlag && newFlag && comfrimFlag){
                    $("#update").removeClass("layui-btn-disabled");
                    $("#update").removeAttr("disabled");
                    $("#update").addClass("layui-btn-danger");
                }else{
                    $("#update").removeClass("layui-btn-danger");
                    $("#update").addClass("layui-btn-disabled");
                    $("#update").attr("disabled","disabled");

                }
            },200)

            $("#update").click(function () {
                var id ="<shiro:principal property="id"/>";
                var newpassword = $("#newpassword").val();
                $.ajax({
                    url:"user/updatePassword/"+id+"/"+newpassword,
                    success:function (data) {
                        if(data.result){
                            layui.use('layer', function(){
                                var layer = layui.layer;

                                layer.msg('更改成功！为保证您的账号安全，即将退出至登录页面', {
                                    icon: 1,
                                    time: 2000 //2秒关闭（如果不配置，默认是3秒）
                                }, function(){
                                   location="/user/myLogOut/"+"<shiro:principal property="phone"/>";
                                });
                            });
                        }else{
                            layui.use('layer', function(){
                                var layer = layui.layer;
                                layer.msg('系统错误，修改失败', {
                                    icon: 2,
                                    time: 2000 //2秒关闭（如果不配置，默认是3秒）
                                });
                            });
                        }
                    }
                })
            });
            //bind('input propertychange'
            $("#oldpassword").bind('input propertychange',function () {
                var id ="<shiro:principal property="id"/>";
                var oldPassword = $(this).val();
                if(oldPassword!=null && oldPassword !=""){
                    $.ajax({
                        url:"user/checkPassword/"+id+"/"+oldPassword,
                        success:function (data) {
                            oldFlag = data.result;
                            $("#opWarn").html(data.data);
                        }
                    })
                }else{
                    oldFlag = false;
                    $("#opWarn").html("<font color='red'>您必须输入原密码才能进行修改</font>");
                }

            });

            $("#newpassword").bind('input propertychange',function () {
                var newpassword = $(this).val();
                if(newpassword!= null &&newpassword!==""){
                    $("#npWarn").html("<font color='green'>正确</font>")
                    newFlag = true;
                }else{
                    $("#npWarn").html("<font color='red'>密码不能为空</font>")
                    newFlag = false;
                }
            })

            $("#confirmpassword").bind('input propertychange',function () {
                var newPassword = $("#newpassword").val();
                var comfirmPassword = $(this).val();
                if(newPassword!= null &&newPassword!==""){

                    if(newPassword == comfirmPassword){
                        $("#cnpWarn").html("<font color='green'>正确</font>")
                        comfrimFlag = true;
                    }else{
                        $("#cnpWarn").html("<font color='red'>两次密码不一致</font>")
                        comfrimFlag = false;
                    }
                }


            });


            $(".aaaa").click(function () {
                var userId = "${user.id}";
                $(".aaaa").text("设为默认");
                $(this).text("取消默认");
                var id=$(this).attr("id").split("d")[1];
                $(".bbbb").removeClass("default");
                $("#addressId"+id).addClass("default");

                $.ajax({
                    url:"user/setDefault/"+id+"/"+userId,
                    success:function (data) {
                        console.log(data);
                    }
                })
            })



            $("#updateImg").click(function () {
                var fileInput = $("#uploadFile").get(0).files[0];
                if(fileInput){
                    $("#form").submit();
                }else{
                    layui.use('layer', function(){
                        var layer = layui.layer;
                        layer.msg("请先上传图片", {
                            icon: 2,
                            time: 2000 //2秒关闭（如果不配置，默认是3秒）
                        });
                    });
                }

            })
        })
    </script>


    </div>
   </section>
   <div class="clear"></div>
</section>
<script>






    $(function(){
        $("#uploadFile").change(function(){
            var url = window.URL.createObjectURL(this.files[0]);

            $("#img").attr("src",url);

        })


    })
</script>
<script type="text/javascript">

    layui.use('laydate', function(){
        var laydate = layui.laydate;
        laydate.render({
            elem: '#date' ,//指定元素
            format: 'yyyy年MM月dd日' ,//可任意组合
            value: '${user.birthday}' //必须遵循format参数设定的格式

        });
    });
</script>
<script type="text/javascript">
    $(".UpdateContMenu ul li:first").addClass("on");
    $(".UpdateContList ul li:first").show();
    $(".UpdateContMenu ul li").each(function(i){
        $(this).click(function(){
            $(this).addClass("on").siblings("li").removeClass("on");
            $(".UpdateContList ul li").eq(i).show().siblings("li").hide();
        });
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


</body>
<script type="text/javascript">
    var msg = "${msg}".trim();
    if(msg != "" ){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.msg(msg, {
                icon: 1,
                time: 2000 //2秒关闭（如果不配置，默认是3秒）
            });
        });
    }
</script>
</html>