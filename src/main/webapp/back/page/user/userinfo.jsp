
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html >
<html >
<head>
    <base href="<%=request.getContextPath()+"/"%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="back/style/css/backstyle.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="back/style/layui/css/layui.css">
    <script type="text/javascript" src ="back/style/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src ="back/style/layui/layui.js"></script>
    <style>
        td a:hover{
            color: #01AAED;
        }
    </style>
<script type="text/javascript">
	$(function(){
	    var size = $(".checkbox").length;
        var count = 0;
	    $("#all-checkbox").click(function () {
	        if($(this).prop("checked")){
                $(".checkbox").prop("checked",true);
                count = size;
            }else{
                $(".checkbox").prop("checked",false);
                count = 0;
            }

        });
	    $(".checkbox").click(function () {
	        if($(this).prop("checked")){
	            count++;
            }else{
	            count--
            }
            if(count ==size){
                $("#all-checkbox").prop("checked",true);
            }else {
                $("#all-checkbox").prop("checked",false);
            }
        })




		$(".del").click(function(){
			var id =$(this).attr("userID");
			var msg =confirm("确认删除?");
			if(msg == true){
				$.get("user/del/"+id,function (data) {
                    layui.use('layer', function(){
                        var layer = layui.layer;
                        layer.msg(data.data, {
                            icon: 0,
                            time: 2000 //2秒关闭（如果不配置，默认是3秒）
                        });
                    });
                    $("#tr"+id).remove();
            	})
			}
		})

        $("#delChecked").click(function () {
            var ids = []
            $(".checkbox:checked").each(function () {
                var id = Number($(this).val());
                ids.push(id);
            })

            console.log(ids)
            $.ajax({
                url:"user/batchDel",
                data:"ids="+ids,
                success:function (data) {
                    if(data.result){
                        for(var i=0;i<ids.length;i++){
                            $("#tr"+ids[i]).remove();
                        }
                    }else{
                        layui.use('layer', function(){
                            var layer = layui.layer;
                            layer.msg('删除失败', {
                                icon: 2,
                                time: 2000 //2秒关闭（如果不配置，默认是3秒）
                            });
                        });
                    }
                }

            })
        })



	})
</script>

</head>

<body>


	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">数据表</a></li>
    <li><a href="#">基本内容</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
            <a href="back/page/user/adduser.jsp"><li class="click"><span style="margin-top: 0px"><img src="back/style/images/t01.png" /></span>添加</li></a>
        <li class="click"><a href="#"><span style="margin-top: 0px"><img src="back/style/images/t02.png" /></span>修改</a></li>
        <li class="click" id="delChecked"><span style="margin-top: 0px"><img src="back/style/images/t03.png" /></span>删除</li>
        <li><span style="margin-top: 0px"><img src="back/style/images/t04.png" /></span>统计</li>
        </ul>
        <ul class="toolbar1">
        <li><span style="margin-top: 0px"><img src="back/style/images/t05.png" /></span>设置</li>
        </ul>
    
    </div>
    
    
      <table class="tablelist">
    	<thead>
    	<tr>
        <th><input   id="all-checkbox" type="checkbox"  /></th>
        <th>用户编号</th>
        <th>用户名</th>
        <th>手机号</th>
        <th>邮箱</th>
            <th>会员等级</th>
        <th>性别</th>
        <th>积分</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
       
        	
       
       <c:forEach items="${pageInfo.list}" var = "user">
            <tr id="tr${user.id}">
         	 <td><input value="${user.id}"  class="checkbox"  type="checkbox" /></td>
		        <td>${user.id}</td>
		        <td>${user.username}</td>
		        <td>${user.phone}</td>
		        <td>${user.email}</td>
                <td>${user.memberRank}</td>
		        <td>${user.sex}</td>
		        <td>${user.integral}</td>
                <td>
                    <c:if test="${user.isadmin.equals('是')}"><a href="user/reAdmin/${user.id}">取消管理员</a></c:if>
                    <c:if test="${user.isadmin.equals('否')}"><a href="user/setAdmin/${user.id}">设为管理员</a></c:if>
                    |<a href="user/toUpdate/${user.id }">编辑</a>|<a class="del" style="cursor: pointer"  userID="${user.id }">删除</a></td>
	        </tr> 
	       </c:forEach>

        </tbody>
    </table>
        <jsp:include page="/page.jsp"/>



    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

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
</body>
</html>
