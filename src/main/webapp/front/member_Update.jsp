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
<link rel="stylesheet" type="text/css" href="/front/css/css_whir.css"/>
<script type="text/javascript" src="/frontscripts/jquery-1.9.1.min.js"></script>
<!--[if lt IE 9]>
  <script type="text/javascript" src="/frontscripts/html5shiv.v3.72.min.js"></script>
<![endif]-->
<script type="text/javascript">
   var navID = "0";
   var menuID="2";
   var RelatedMenuID="2";
</script>
</head>

<body>


<div class="Current">
    <div class="CurrentMain">
        <dl><a href="#">个人中心</a>  <span>我的积分</span></dl>
    </div>
</div>

<section class="Contain">
	<section class="MainContent">
    <div class="Content">
        <!--menu-->
		<div class="MemberMenu">
    <ul>
        <li id="menuID1"><a href="member.jsp">账户信息</a></li>
        <li id="menuID2"><a href="member_Update.jsp">修改个人信息</a></li>
        <li id="menuID3"><a href="member_Changepassword.html">修改密码</a></li>
        <li id="menuID4"><a href="member_IntegralDetail.jsp">我的积分</a></li>
        <li id="menuID5"><a href="member_MyQuestion.html">我的问题</a></li>
        <li id="menuID6"><a href="member_Related.html">产品试用相关</a></li>
    </ul>
</div>
<script type="text/javascript">
    $("#menuID"+menuID).addClass("onmenuID");
</script>
        <!--menu End-->
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
                    <span class="UpdateImg"><img src="images/Member_Information.jpg" /></span>
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
                            	<table class="UpdateContTable1" cellpadding="0" cellspacing="0" border="0">
                                    <tr>
                                        <td width="100">当前头像：</td>
                                        <td>
                                            <img src="images/ErrorImage.jpg" onerror="this.src='images/ErrorImage.jpg'" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="100">用&nbsp;户&nbsp;名&nbsp;：</td>
                                        <td>
                                            <span>小旋风</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="100">我的手机：</td>
                                        <td>
                                            <input type="text" class="text" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="100"></td>
                                        <td>
                                            <a href="javascript:void(0);" class="GetCode1">免费获取短信动态码</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>真实姓名：</td>
                                        <td><input type="text" class="text" /></td>
                                    </tr>
                                    <tr>
                                        <td>所在城市：</td>
                                        <td>
                                            <div class="SelectBox">
                                                <span class="SelectText">-- 省 --</span>
                                                <dl class="SelectList" style="display: none;">
                                                    <dt><a href="javascript:void(0)">江苏</a></dt>
                                                    <dt><a href="javascript:void(0)">安徽</a></dt>
                                                </dl>
                                            </div>
                                            <div class="SelectBox">
                                                <span class="SelectText">-- 市 --</span>
                                                <dl class="SelectList" style="display: none;">
                                                    <dt><a href="javascript:void(0)">南京</a></dt>
                                                    <dt><a href="javascript:void(0)">泰州</a></dt>
                                                </dl>
                                            </div>
                                            <div class="SelectBox">
                                                <span class="SelectText">-- 县/市 --</span>
                                                <dl class="SelectList" style="display: none;">
                                                    <dt><a href="javascript:void(0)">泰兴</a></dt>
                                                    <dt><a href="javascript:void(0)">兴化</a></dt>
                                                </dl>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>联系地址：</td>
                                        <td><input type="text" class="text" /></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;现状：</td>
                                        <td>
                                            <input type="radio" name="NowState" value="我现在已有孩子" checked /><span class="NowState">我现在已有孩子</span>
                                            <input type="radio" name="NowState" value="正在怀孕期" /><span class="NowState">正在怀孕期</span>
                                            <input type="radio" name="NowState" value="没有孩子" /><span class="NowState">没有孩子</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <dl>
                                                <dt><span>宝宝姓名：</span><input type="text" class="text1" /></dt>
                                                <dt><span>宝宝生日：</span><input type="text" class="text1 text2" /><span>预产期：</span><input type="text" class="text1 text2" /></dt>
                                                <dt><span>宝宝性别：</span>
                                                    <select>
                                                        <option>请选择</option>
                                                        <option>男</option>
                                                        <option>女</option>
                                                    </select>
                                                </dt>
                                            </dl>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <input type="button" class="Btn_Next" value="保存修改" />
                                        </td>
                                    </tr>
                                </table>
                            </li>
                        	<li class="UpdateContList1">
                            	<div class="PostImage">
                                	<div class="PostList">
                                    	<ul>
                                        	<li><a href="javascript:void(0);"><input type="file" class="UploadImg" /><img src="images/BenDi.jpg" /></a></li>
                                        	<li><a href="javascript:void(0);"><img src="images/PaiZhao.jpg" /></a></li>
                                            <div class="clear"></div>
                                        </ul>
                                        <p>仅支持JPG、GIF、PNG图片文件，切文件小于5M</p>
                                    </div>
                                    <div class="PostWay">
                                    	<div class="PostWayLeft">
                                        	<div class="PostWayImgCont">
                                            	<img src="images/UpdateImgSrc.jpg" />
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
                                    <a href="javascript:void(0);"><img src="images/BaoCun.jpg" /></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
   </section>
   <div class="clear"></div>
</section>

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

<!--bottom-->
<footer class="Bottomer">
    <div class="BottomTop">
        <div class="BottomTopMain">
            <ul>
                <li>
                    <dl>
                        <dt><a href="#">关于纽派</a></dt>
                        <dd><a href="#">公司简介</a></dd>
                        <dd><a href="#">发展历史</a></dd>
                        <dd><a href="#">合作伙伴</a></dd>
                        <dd><a href="#">联系我们</a></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt><a href="#">产品中心</a></dt>
                        <dd><a href="#">新西兰纽派</a></dd>
                        <dd><a href="#">新西兰卓比</a></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt><a href="soon_trial.html">产品试用</a></dt>
                        <dd><a href="#">试用指南</a></dd>
                        <dd><a href="#">正在试用</a></dd>
                        <dd><a href="soon_trial.html">即将试用</a></dd>
                        <dd><a href="#">往期试用</a></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt><a href="#">会员中心</a></dt>
                        <dd><a href="interact_inquiry.html">防伪查询</a></dd>
                        <dd><a href="#">互动专区</a></dd>
                        <dd><a href="#">在线问答</a></dd>
                        <dd><a href="#">育儿知识</a></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt><a href="#">联系我们</a></dt>
                        <dd><a href="#">联系方式</a></dd>
                        <dd><a href="#">电子地图</a></dd>
                    </dl>
                </li>
                <div class="clear"></div>
            </ul>
        </div>
    </div>
    <div class="Bottom">
        <div class="BottomMain">
            <div class="Copyright">Copyright © 2015 深圳优之优贸易有限公司 . All Rights Reserved. Designed by <a href="http://我的虚拟世界店铺.com.cn" target="_blank">我的虚拟世界店铺</a></div>
            <nav class="BottomLinks"> <!--友情链接-->
              <a href="#" target="_blank">友情链接</a> <em>|</em><a href="#" target="_blank">法律责任</a> <em>|</em><a href="#" target="_blank">网站地图</a>
            </nav>
        </div>
    </div>
   
</footer>

<script type="text/javascript">
//整站无图处理
jQuery.each(jQuery("img"), function (i, n) { jQuery(n).error(function () { n.src = 'uploadfiles/nopic.jpg'; }); n.src = n.src; });
</script>
<script type="text/javascript">
    //this function do not use jquery for honner page?
    function GoSearchUrl() {
        var searchinput = document.getElementById("key");
        if (searchinput.value == "" || searchinput.value == "请在方框内输入内容") {
            alert("请输入关键字！");
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

    function GoSreach(rs) {
        window.location = "{$syspath}search/search.aspx?key=" + escape(rs);
        return true;
    }

    function entersearch() {
        //alert(dd);
        var event = window.event || arguments.callee.caller.arguments[0];
        if (event.keyCode == 13) {
            GoSearchUrl();
        }
    }

    function CheckString(s) {
        var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）—|{}【】‘；：”“'。，、？]")
        var rs = "";
        for (var i = 0; i < s.length; i++) {
            rs = rs + s.substr(i, 1).replace(pattern, '');
        }
        if (rs == "") {
            alert("不能输入特殊字符！");
            $(".sreach_ipu").val("");
            $(".sreach_ipu").focus();
            return false;
        }
        else {
            GoSreach(rs);
        }
    }
</script>
<!--bottom End-->
<script type="text/javascript">
jQuery.each(jQuery(".UpdateContTable1 img"), function (i, n) { jQuery(n).error(function () { n.src = 'images/ErrorImage.jpg'; }); n.src = n.src; });
</script>
</body>
</html>