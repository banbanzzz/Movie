<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	User user = (User)request.getSession().getAttribute("user");
	if(user == null){
		response.sendRedirect("./login.jsp");
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="../static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../static/bootstrap/css/bootstrap.css" rel="stylesheet">
    <script src="../static/bootstrap/js/jquery-3.3.1.min.js"></script>
    <script src="../static/bootstrap/js/bootstrap.min.js"></script>
    <link rel="icon" type="image/x-icon" href="../static/images/logo.ico"/>
    <link rel="stylesheet" type="text/css" href="../static/css/header.css">
    <link rel="stylesheet" type="text/css" href="../static/css/center.css">
    <link rel="stylesheet" type="text/css" href="../static/css/footer.css">
    <script src="../static/js/header.js" charset="utf-8"></script>
    <script src="../static/js/Api.js"></script>
    <script src="../static/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
    <title>鹰眼电影-个人中心</title>
</head>
<body>
    <!-- ------------------------------------------------------------------- -->
    <!-- 导航栏 -->
    <jsp:include page="header.jsp"/>

    <!-- 占位符 -->
    <div style="margin-top: 110px;"></div>

    <!-- 主体 -->
    <div class="container">
        <div class="contents">
            <div class="nav-next">
                <div class="nav-title">
                    <h3>个人中心</h3>
                </div>
                <a class="cardId">我的订单</a>
				<a class="cardId">基本信息</a>
				<a class="cardId">修改密码</a>
            </div>
            <div class="nav-body">
                <!-- 我的订单 -->
                <div class="one card" style="display: block;">
                    <div>
                        <div class="title">我的订单</div>
                        <hr/>
                    </div>
                </div>
                <!-- 基本信息 账号、邮箱、角色、头像 -->
                <div class="two card" style="display: none;">
                    <div>
                        <div class="title">基本信息</div>
                        <hr/>
                    </div>
                    <div class="avatar-container layui-upload">
                        <div class="layui-upload-list">
                            <img class="layui-upload-img" id="demo1">
                            <p id="demoText"></p>
                        </div>
                        <a href="javascript:;" class="file">选择文件
                            <input type="file" name="file" id="file">
                        </a>
                        <div class="tips">支持JPG,JPEG,PNG格式，且文件需小于1000KB</div>
                    </div>

                    <div class="avatar-body">
                    </div>
                </div>
                <!-- 修改密码 -->
                <div class="three card" style="display: none;">
                    <div>
                        <div class="title">修改密码</div>
                        <hr/>
                    </div>
                    <div class="avatar-body">
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- 脚 -->
    <jsp:include page="footer.jsp"/>
    
    
    <!-- ------------------------------------------------------------------- -->
    <script>
        var clientHeight = document.documentElement.clientHeight;
        var user = localStorage.getItem("userJson");
        user = eval('(' + user + ')');
        var file;

        window.onload = function(){
            initHeader();
            initCard(); //初始化选项卡
            initOrder(); //我的订单
            initInformation(); //基本信息
            initPassword(); //密码
        }

        //选项卡
       function initCard(){
            var aArr = $(".nav-next").find(".cardId");
            var divArr = $(".nav-body").find(".card");
            if(localStorage.getItem("usercardId")==null){
                localStorage.setItem("usercardId",0);
            }
            for(var i=0; i<aArr.length; i++){
                aArr[i].index = i;
                aArr[i].onclick = function(){
                    localStorage.setItem("usercardId",this.index);
                    for(var j=0;j<divArr.length;j++){
                        divArr[j].style.display = "none";
                        aArr[j].style.cssText = "background-color: #f4f3f4; color: #333;";
                    }
                    divArr[this.index].style.display = "block";
                    aArr[this.index].style.cssText = "background-color: #ed3931; color: #fff;";
                }
            }
            for(var p=0;p<aArr.length;p++){
                divArr[p].style.display = "none";
                aArr[p].style.cssText = "background-color: #f4f3f4; color: #333;";
                if(localStorage.getItem("usercardId")==p){
                    divArr[p].style.display = "block";
                    aArr[p].style.cssText = "background-color: #ed3931; color: #fff;";
                }
            }
        }



        //初始化“我的订单”
        function initOrder(){
            var order = $(".one");
            var html;
            $.ajax({
                type:'post',
                url: url + "/order/findOrderByUserName",
                dataType:'json',
                data: {
                    user_name: user.user_name
                },
                success:function (obj) {
                    // console.log(obj);
                    for(var i=0;i<obj.data.length;i++){
                      //  var order_time = obj.data[i].order_schedule.schedule_startTime.slice(0,10);
                        var StateText;
                        switch(obj.data[i].order_state){
                            case 0:
                                StateText = "退票中";
                            break;
                            case 1:
                                StateText = "已完成";
                            break;
                            case 2:
                                StateText = "已退票";
                            break;
                        }
                        html = 
                        "<div class=\"order-box\">" +
                            "<div class=\"order-head\">" +
                                    "<span class=\"order-date\">" + obj.data[i].order_time + "</span>" +
                                    "<span class=\"order-id\">订单号：" + obj.data[i].order_id + "</span>" +
                                    "<span class=\"order-delete\">*</span>" +
                                    "</div>" +
                            "<div class=\"order-body\">" +
                                "<div class=\"poster\"><img src=\"" + obj.data[i].order_schedule.schedule_movie.movie_picture + "\"></div>" +
                                "<div class=\"order-content\">" +
                                    "<div class=\"movie-name\">" + obj.data[i].order_schedule.schedule_movie.movie_cn_name + "</div>" +
                                    " <div class=\"cinema-name\">" + obj.data[i].order_schedule.schedule_hall.hall_cinema.cinema_name + "</div>" +
                                    "<div class=\"hall-ticket\">"  + obj.data[i].order_schedule.schedule_hall.hall_name + " " + obj.data[i].order_position + "</div>" +
                                    "<div class=\"show-time\">" + obj.data[i].order_schedule.schedule_startTime + "</div>" +
                                "</div>" +
                                "<div class=\"order-price\">￥" + obj.data[i].order_schedule.schedule_price + "</div>" +
                                "<div class=\"order-status\">" + StateText + "</div>" +
                                "<div class=\"actions\"><a onclick=\"backticket('" + obj.data[i].order_id + "','" + obj.data[i].order_schedule.schedule_startTime  + "','" + StateText + "')\" style=\"cursor: pointer;\">申请退票</a></div>" +
                            "</div>" +
                        "</div>";
                        order.append(html);
                    }
                }
            });
        }
        //退票申请
        function backticket(order_id,order_time,order_state){
            var ShowTime = $(".one").find(".show-time");
            var Year,Month,Day,Hour,Mintue,flag=0;
            var myDate = new Date();
            var OldTime, NowTime, OldDate, NowDate;
            if(order_state=="退票中"){
                layui.use(['layer'], function(){
                var layer = layui.layer;
                    layer.alert('该订单正处于退票状态！',{icon: 0,offset: clientHeight/5});
                });
            }
            else if(order_state=="已退票"){
                layui.use(['layer'], function(){
                var layer = layui.layer;
                    layer.alert('该订单已完成退票！',{icon: 0,offset: clientHeight/5});
                });
            }
            else{
                if(myDate.getHours()==23){
                    flag=1;
                }
                OldTime = order_time;
                NowTime = myDate.toLocaleDateString() + " " + parseInt(myDate.getHours()+1).toString()  + ":" + myDate.getMinutes();
                OldDate = new Date(OldTime.replace(/-/g,"\/"));
                NowDate = new Date(NowTime.replace(/-/g,"\/"));
                if(flag == 1){
                    flag = 0;
                    layui.use(['layer'], function(){
                    var layer = layui.layer;
                        layer.alert('23：00 - 00：00不给予退票操作！',{icon: 0,offset: clientHeight/5});
                    });
                }
                else if(OldDate<NowDate){
                    // window.alert("旧时间：" + OldDate + "\n新时间：" + NowDate + "\n退票时间为开场前1小时外，退票申请失败！");
                    layui.use(['layer'], function(){
                    var layer = layui.layer;
                        layer.alert('退票时间为开场前1小时外，退票申请失败！',{icon: 0,offset: clientHeight/5});
                    });
                }
                else{
                    // window.alert("旧时间：" + OldDate + "\n新时间：" + NowDate + "\n退票已申请");
                    layui.use(['layer'], function(){
                    var layer = layui.layer;
                        layer.alert('是否确认要申请退票！',{icon: 0,offset: clientHeight/5},
                            function (){
                                $.ajax({
                                    type:'post',
                                    url: url + "/order/applyForRefund",
                                    dataType:'json',
                                    data: {
                                        order_id: order_id
                                    },
                                    success:function (obj) {
                                        if(obj.code == 0){
                                            window.alert("退票已申请");
                                        }
                                        else{
                                            window.alert("退票申请失败！");
                                        }
                                    }
                                });
                                layer.closeAll();
                                location.reload();
                            }
                        );
                    });
                }
            }      
        }
    
        //初始化基本信息
        function initInformation(){
            var avatarBody = $(".two").find(".avatar-body");
            var roletext;
            if(user.user_role==1){
                roletext = "管理员";
            }
            else{
                roletext = "会员";
            }

            avatarBody.append(
                "<div class=\"userexinfo-form-section\">" +
                    "<p>账号：</p>" +
                    "<span>" +
                        "<input type=\"text\" name=\"userName\" id=\"userName\" value=\"" + user.user_name + "\" disabled=\"false\">" +
                    "</span>" +
                "</div>" +
                "<div class=\"userexinfo-form-section\">" +
                    "<p>身份：</p>" +
                    "<span>" +
                        "<input type=\"text\" name=\"role\" id=\"role\" value=\"" + roletext + "\" disabled=\"false\">" +
                    "</span>" +
                "</div>" +
                "<div class=\"userexinfo-form-section\">" +
                    "<p>邮箱：</p>" +
                    "<span>" +
                        "<input type=\"text\" name=\"email\" id=\"email\" value=\"" + user.user_email + "\">" +
                    "</span>" +
                "</div>" +
                "<div class=\"userexinfo-btn-section\">" +
                    "<input type=\"button\" onclick=\"saveBtn()\" class=\"form-save-btn\" value=\"保存\">" +
                "</div>"
            );
            var HeadImg = "";
            if(user.user_headImg == null || typeof user.user_headImg == "undefined"){
                HeadImg = "../upload/head/demo.jpg";
            }else{
                HeadImg = user.user_headImg;
            }
            $('#demo1').attr('src', HeadImg);
            
            layui.use(['layer', 'table'], function(){
                var layer = layui.layer;
                var table = layui.table

                //图片上传
                layui.use('upload', function(){
                    var $ = layui.jquery
                    ,upload = layui.upload;         
                    //普通图片上传
                    var uploadInst = upload.render({
                        elem: '#file'
                        ,auto: false
                        , choose: function (obj) {
                            //预读本地文件
                            obj.preview(function (index, file, result) {
                                $('#demo1').attr('src', result); //图片链接（base64）
                            })
                            file = $('#file')[0].files[0];
                        }
                    });
                });
            });
        }
        //保存信息修改
        function saveBtn(){
            var formData = new FormData();
            var user_name = $('#userName').val(),
                user_role = $('#role').val(),
                user_email = $('#email').val();
            console.log(file);
            console.log(user_name+ "," + user_role + "," + user_email);
            if(user_role == "会员"){
                user_role = 0;
            }else{
                user_role = 1;
            }
            if(user_email == ""){
                layui.use(['layer'], function(){
                var layer = layui.layer;
                    layer.alert('邮箱信息不能为空，修改失败！',{icon: 0,offset: clientHeight/5},
                        function (){
                            layer.close(layer.index);
                        }
                    );
                });
            }
            else{
                formData.append("user_id",user.user_id);
                formData.append("user_name",user_name);
                formData.append("user_role",user_role);
                formData.append("user_email",user_email);
                formData.append("file",file);
                $.ajax({
                    type:'post',
                    url: url + "/user/uploadHeadImg",
                   // dataType:'json',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success:function (result) {
                        var obj = eval('(' + result + ')');
                        if(obj.code == 0){
                            layer.alert('修改成功！',{icon: 0,offset: clientHeight/5},
                                function (){
                                    localStorage.removeItem("userJson");
                                    layer.closeAll();
                                    localStorage.setItem("userJson",JSON.stringify(obj.data));
                                    window.location.reload();
                                }
                            );
                        }else{
                            layer.alert('修改失败！',{icon: 0,offset: clientHeight/5},
                                function (){
                                    layer.closeAll();
                                }
                            );
                        }
                    }
                });
            }
        }
    
        //初始化密码
        function initPassword(){
            var avatarBody = $(".three").find(".avatar-body");

            avatarBody.append(
                "<div class=\"userexinfo-form-section\">" +
                    "<p>旧密码：</p>" +
                    "<span>" +
                        "<input type=\"password\" name=\"oldPassword\" id=\"oldPassword\" value=\"\">" +
                    "</span>" +
                "</div>" +
                "<div class=\"userexinfo-form-section\">" +
                    "<p>新密码：</p>" +
                    "<span>" +
                        "<input type=\"password\" name=\"newPassword\" id=\"newPassword\" value=\"\">" +
                    "</span>" +
                "</div>" +
                "<div class=\"userexinfo-form-section\">" +
                    "<p>确认密码：</p>" +
                    "<span>" +
                        "<input type=\"password\" name=\"repeatPassword\" id=\"repeatPassword\" value=\"\">" +
                    "</span>" +
                "</div>" +
                "<div class=\"userexinfo-btn-section\">" +
                    "<input type=\"submit\" onclick=\"savePasswordBtn()\" class=\"password-save-btn\" value=\"保存\">" +
                "</div>"
            );
        }
        //保存密码修改
        function savePasswordBtn(){
            var user_old_password = $('#oldPassword').val(),
                user_new_password = $('#newPassword').val(),
                user_repeat_password = $('#repeatPassword').val();
            var user_id = user.user_id;
            console.log(user_old_password+ "," + user_new_password + "," + user_repeat_password);
            if(user_old_password == "" || user_new_password == "" || user_repeat_password == ""){
                layui.use(['layer'], function(){
                var layer = layui.layer;
                    layer.alert('密码修改信息不能为空，修改失败！',{icon: 0,offset: clientHeight/5},
                        function (){
                            layer.close(layer.index);
                        }
                    );
                });
            }
            else if(user_old_password != user.user_pwd){
                layui.use(['layer'], function(){
                var layer = layui.layer;
                    layer.alert('旧密码输入错误！',{icon: 0,offset: clientHeight/5},
                        function (){
                            layer.close(layer.index);
                        }
                    );
                });
            }
            else if(user_new_password != user_repeat_password){
                layui.use(['layer'], function(){
                var layer = layui.layer;
                    layer.alert('新密码和确认密码不匹配！',{icon: 0,offset: clientHeight/5},
                        function (){
                            layer.close(layer.index);
                        }
                    );
                });
            }
            else{
                $.ajax({
                    type:'post',
                    url: url + "/user/modifyUserPwd",
                    dataType:'json',
                    data: {
                        oldPwd: user_old_password,
                        newPwd: user_new_password,
                        user_id: user_id,
                    },
                    success:function (obj) {
                        if(obj == "success"){
                            layer.alert('修改成功，请重新登陆！',{icon: 0,offset: clientHeight/5},
                                function (){
                                    layer.closeAll();
                                    localStorage.removeItem("userJson");
                                    window.location.reload();
                                }
                            );
                        }else{
                            layer.alert('修改失败！',{icon: 0,offset: clientHeight/5},
                                function (){
                                    layer.closeAll();
                                }
                            );
                        }
                    }
                });
            }
        }


    </script>
    <!-- ------------------------------------------------------------------- -->
</body>
</html>