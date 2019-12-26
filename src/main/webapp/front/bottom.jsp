<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/11
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=request.getContextPath()%>/"/>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="front/css/css_whir.css"/>
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
        .Banner{ background:url(front/uploadfiles/image/banner/Banner_About.jpg) no-repeat center top;}
    </style>
</head>
<body>
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
    $.each(jQuery("img"), function (i, n) { jQuery(n).error(function () { n.src = 'front/uploadfiles/nopic.jpg'; }); n.src = n.src; });
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
</body>
</html>
