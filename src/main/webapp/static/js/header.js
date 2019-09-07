//验证用户身份
function init_manage(){
    var user_json = JSON.parse(localStorage.getItem("userJson"));
    var user_role = user_json.user_role;  //身份验证
    var nav = $(".nav").find("ul");
    var html;
    if(user_json.user_role == 1){
        html = "<li><a href=\"./manage.jsp\" onclick=\"managePage()\">管理</a></li>"
        nav.append(html);
    }
    function managePage(){
        localStorage.setItem("cardId",0);
    }
}

//验证用户身份
function init_comment(){
    var user = localStorage.getItem("userJson");
    var commentListContainer = $(".comment-list-container").find("ul");   
    if(user == null){
        $.ajax({
            type:'post',
            url: url + "/movie/findMovieById",
            dataType:'json',
            data: {
                movie_id: movie_id
            },
            success:function (obj) {
                console.log(obj);
                for(var i=0;i<obj.data.commentList.length;i++){
                    commentListContainer.append(
                        "<li class=\"comment-container\">" +
                            "<div class=\"portrait-container\">" +
                                "<div class=\"portrait\">" +
                                    "<img src=\""+ obj.data.commentList[i].comment_user.user_headImg +"\" alt=\"\">" +
                                "</div>" +
                                "<i class=\"level-4-icon\"></i>" +
                            "</div>" +
                            "<div class=\"main2\">" +
                                "<div class=\"main2-header clearfix\">" +
                                    "<div class=\"user\">" +
                                        "<span class=\"name\">" + obj.data.commentList[i].comment_user.user_name + "</span>	" +
                                        "<span class=\"tag\">购</span>" +
                                    "</div>" +
                                    "<div class=\"time\" title=\"2018-11-16 12:06:10\">" +
                                        "<span title=\"2018-11-16 12:06:10\">" + obj.data.commentList[i].comment_time + "</span>" +
                                    "</div>" +
                                    "<div class=\"approve\" data-id=\"1044884745\">" +
                                    "</div>" +
                                "</div>" +
                                "<div class=\"comment-content\"> " +
                                    obj.data.commentList[i].comment_content +
                                "</div>" +
                            "</div>" +
                        "</ul>"
                    );
                }
            }
        });
    }else{
        user = eval('(' + user + ')');
        var user_role = user.user_role;  //身份验证
        var user_name = user.user_name;
        var html;
        $.ajax({
            type:'post',
            url: url + "/movie/findMovieById",
            dataType:'json',
            data: {
                movie_id: movie_id
            },
            success:function (obj) {
                console.log(obj);
                for(var i=0;i<obj.data.commentList.length;i++){
                    if((user_role == 1) && (user_name == obj.data.commentList[i].comment_user.user_name)){
                        html =  "<div class=\"updateBtn\" onclick='updateConfirm(\"" + obj.data.commentList[i].comment_id + "\",\"" + obj.data.commentList[i].comment_user.user_name + "\",\"" + obj.data.commentList[i].comment_content + "\",\"" + obj.data.commentList[i].comment_time + "\")'>修改</div>" +
                        "<div class=\"deleteCom\" onclick='deleteConfirm(\"" + obj.data.commentList[i].comment_id + "\")'>删除</div>";
                    }else if(user_role == 1){
                        html = "<div class=\"deleteCom\" onclick='deleteConfirm(\"" + obj.data.commentList[i].comment_id + "\")'>删除</div>";
                    }else if((user_name == obj.data.commentList[i].comment_user.user_name) && (user_role != 1)){
                                html = "<div class=\"updateBtn\" onclick='updateConfirm(\"" + obj.data.commentList[i].comment_id + "\",\"" + obj.data.commentList[i].comment_user.user_name + "\",\"" + obj.data.commentList[i].comment_content + "\",\"" + obj.data.commentList[i].comment_time + "\")'>修改</div>";
                    }else{
                        html="";
                    }   
                    commentListContainer.append(
                        "<li class=\"comment-container\">" +
                            "<div class=\"portrait-container\">" +
                                "<div class=\"portrait\">" +
                                    "<img src=\""+ obj.data.commentList[i].comment_user.user_headImg +"\" alt=\"\">" +
                                "</div>" +
                                "<i class=\"level-4-icon\"></i>" +
                            "</div>" +
                            "<div class=\"main2\">" +
                                "<div class=\"main2-header clearfix\">" +
                                    "<div class=\"user\">" +
                                        "<span class=\"name\">" + obj.data.commentList[i].comment_user.user_name + "</span>	" +
                                        "<span class=\"tag\">购</span>" +
                                    "</div>" +
                                    "<div class=\"time\" title=\"2018-11-16 12:06:10\">" +
                                        "<span title=\"2018-11-16 12:06:10\">" + obj.data.commentList[i].comment_time + "</span>" +
                                    "</div>" +
                                    "<div class=\"approve\" data-id=\"1044884745\">" +
                                        html +
                                    "</div>" +
                                "</div>" +
                                "<div class=\"comment-content\"> " +
                                    obj.data.commentList[i].comment_content +
                                "</div>" +
                            "</div>" +
                        "</ul>"
                    );
                }
            }
        });
    }
}

//初始化
function initHeader(){
    var LayuiNavMore = $(".header-li");
    console.log(LayuiNavMore);
    var user_json = JSON.parse(localStorage.getItem("userJson"));
    console.log(user_json);
    layui.use('element', function(){
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
        //监听导航点击
        element.on('nav(demo)', function(elem){
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
    if(user_json == null){
        LayuiNavMore.append(
            "<a href=\"javascript:;\" style=\"padding: 0;height: 42px; width: 42px;\"><img src=\"../static/images/head.jpg\" class=\"layui-nav-img\"></a>" +
            "<dl class=\"layui-nav-child nav-image\">" +
                "<dd><a href=\"./login.jsp\">登录</a></dd>" +
            "</dl>"
        );
    }
    else{
        var HeadImg = "";
    	if(user_json.user_headImg == null || typeof user_json.user_headImg == "undefined"){
            HeadImg = "../upload/head/demo.jpg";
        }else{
            HeadImg = user_json.user_headImg;
        }
        LayuiNavMore.append(
            "<a href=\"javascript:;\" style=\"padding: 0;height: 42px; width: 42px;\"><img src=\"" + HeadImg + "\" class=\"layui-nav-img\"></a>" +
            "<dl class=\"layui-nav-child nav-image\">" +
            "<dd><a href=\"./center.jsp\" onclick=\"mycenter()\">我的订单</a></dd>" +
            "<hr/>" +
            "<dd><a href=\"./center.jsp\" onclick=\"myinformation()\">基本信息</a></dd>" +
                "<hr/>" +
                "<dd><a onclick=\"ReLogin()\" style=\"text-decoration: none; cursor: pointer;\">注销</a></dd>" +
                "<hr/>" +
            "</dl>"
        );
        init_manage();
    }

}
function mycenter(){
    localStorage.setItem("usercardId",0);
}
function myinformation(){
    localStorage.setItem("usercardId",1);
}
//注销
function ReLogin(){
    layui.use(['layer'], function(){
    var layer = layui.layer;
        layer.alert('确认要注销吗？',{icon: 0,offset: clientHeight/5},
            function (){
                $.ajax({
                    type:'post',
                    url: url + "/user/logout",
                    dataType:'json',
                    data: {},
                    success:function (obj) {
                        localStorage.removeItem('userJson');
                        layer.closeAll();
                        window.location.href = "./mainPage.jsp";
                    }
                });
            }
        );
    });
}