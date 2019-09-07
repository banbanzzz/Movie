<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" type="text/css" href="../static/css/main.css">
    <link rel="stylesheet" type="text/css" href="../static/css/movieList.css">
    <link rel="stylesheet" type="text/css" href="../static/css/footer.css">
    <script src="../static/js/header.js" charset="utf-8"></script>
    <script src="../static/js/Api.js"></script>

    <script src="../static/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
    <title>鹰眼电影-电影</title>
</head>
<body>
    <!-- ------------------------------------------------------------------- -->
    <!-- 导航栏 -->
    <jsp:include page="header.jsp"/>


    <!-- 占位符 -->
    <div style="margin-top: 80px;"></div>
    
    <!-- 副导航栏 -->
    <ul class="layui-nav fu-nav">
            <div id="yui"></div>
        <li class="layui-nav-item layui-this"><a>正在热映</a></li>
        <li class="layui-nav-item"><a>即将上映</a></li>
        <li class="layui-nav-item"><a>经典影片</a></li>
    </ul>

    <!-- 主体 -->
    <div class="main">
        <div class="main-Tagsz main-inner movieList">
            <div class="movies-channel">
                <div class="tags-panel">
                    <ul class="tags-lines">
                        <li class="tags-line">
                            <div class="tags-title">类型 :</div>
                            <ul class="tags tags-type">
                            </ul>
                        </li>
                        <li class="tags-line tags-line-border">
                            <div class="tags-title">区域 :</div>
                            <ul class="tags tags-area">
                            </ul>
                        </li>
                        <li class="tags-line tags-line-border">
                            <div class="tags-title">年代 :</div>
                            <ul class="tags tags-year">
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="movies-panel">
                <div class="movies-sorter">
                        <div class="cat-sorter">
                            <ul>
                                <li>
                                    <span class="sort-control-group" data-act="sort-click" >
                                        <span class="sort-control sort-radio sort-radio-checked"></span>
                                        <span class="sort-control-label">按热门排序</span>
                                    </span>
                                </li>
                                <li>
                                    <span class="sort-control-group" data-act="sort-click" data-href="?sortId=2">
                                        <span class="sort-control sort-radio"></span>
                                        <span class="sort-control-label">按时间排序</span>
                                    </span>
                                </li>
                                <li>
                                    <span class="sort-control-group" data-act="sort-click" data-href="?sortId=3">
                                        <span class="sort-control sort-radio"></span>
                                        <span class="sort-control-label">按评价排序</span>
                                    </span>
                                </li>
                            </ul>
                        </div>  	
                </div>
                
                <div class="movies-list">
                    <ul class="movie-list">
    
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- 脚 -->
    <jsp:include page="footer.jsp"/>

    <!-- ------------------------------------------------------------------- -->
    <script>
        var clientHeight = document.documentElement.clientHeight;
        var clientWidth = document.documentElement.clientWidth;
        var date;
        var area;
        var year;
        var movielist = $(".movie-list");
        var order = "热门";
        window.onload = function(){
            funav(); //副导航栏
            initHeader();
            initParams(); //参数
            initTags(); //标签
            initMovieList(); //电影列表
            initClass(); //布局
        }

        //初始化布局
        function initClass(){
            mainTagsz = $(".main-Tagsz")[0];

            mainTagsz.style.cssText = "width:1170px !important; margin: 0 0 0 " + (clientWidth - 1170)/2 + " !important;";
        }

        //初始化电影列表
        function initMovieList(){
            if(getUrlParams("type") == "全部" || getUrlParams("type") == null){
                $.ajax({
                    type: "post",
                    url: url + "/movie/sortAllMovies",
                    data: {order: order},
                    dataType: "json",
                    success: function(obj){
                        console.log(obj);
                        for(var i = 0;i < obj.count; i++){
                            movielist.append(
                                "<li> <div class=\"movie-item\"> <a href=\"./buyTickets.jsp?movie_id="+ obj.data[i].movie_id +"\" target=\"_blank\"> <div class=\"movie-poster\"> <img src=\""+ obj.data[i].movie_picture +"\"> </div> </a>" +
                                    "<div class=\"channel-action channel-action-sale\"> <a>购票<a/> </div> <div class=\"movie-ver\"></div> </div>" +
                                    "<div class=\"channel-detail movie-item-title\" title=\""+ obj.data[i].movie_cn_name +"\">" + 
                                        "<a href=\"./movieDetail.jsp?movie_id="+ obj.data[i].movie_id +"\" target=\"_blank\">"+ obj.data[i].movie_cn_name +"</a> </div>" +
                                    "<div class=\"channel-detail channel-detail-orange\"> <i class=\"integer\">"+ obj.data[i].movie_score +"</i> </div>" +
                                    "</li>"
                                    );
                        }
                    },
                    error: function(){
                        alert("network error!");
                    }
                });
            }else{
                $.ajax({
                    type: "post",
                    url: url + "/movie/findMoviesByType",
                    data: {type: type},
                    dataType: "json",
                    success:function(obj){
                        console.log(obj);
                        if(obj.count > 0){
                            for(var i = 0;i < obj.count; i++){
                                movielist.append(
                                    "<li> <div class=\"movie-item\"> <a href=\"./buyTickets.jsp?movie_id="+ obj.data[i].movie_id +"\" target=\"_blank\"> <div class=\"movie-poster\"> <img src=\""+ obj.data[i].movie_picture +"\"> </div> </a>" +
                                            "<div class=\"channel-action channel-action-sale\"> <a>购票<a/> </div> <div class=\"movie-ver\"></div> </div>" +
                                        "<div class=\"channel-detail movie-item-title\" title=\""+ obj.data[i].movie_cn_name +"\">" + 
                                            "<a href=\"./movieDetail.jsp?movie_id="+ obj.data[i].movie_id +"\" target=\"_blank\">"+ obj.data[i].movie_cn_name +"</a> </div>" +
                                        "<div class=\"channel-detail channel-detail-orange\"> <i class=\"integer\">"+ obj.data[i].movie_score +"</i> </div>" +
                                        "</li>"
                                );
                            }
                       }else{
                           //movielist.append("<div style=\"height:320px\"><p style=\"text-align:center;padding:100px 0; font-size:24px;\">查无数据...</p></div>");
                           movielist.append("<div style=\"margin-top:40px;font-size:18px;color:#333;height:190px;\">抱歉，没有找到相关结果，请尝试用其他条件筛选。</div>");
                        }
                    },
                    error: function(){
                        alert("network error!");
                    }
                })
            }
            var radio = $('.sort-control-group');
            for(var i = 0;i < radio.length;i++){
                // var zz = radio[i].children[0];
                // console.log(zz);
                radio[i].index = i;
                radio[i].onclick = function(){
                    switch(this.index){
                        case 0:
                            radio[0].children[0].className ="sort-control sort-radio sort-radio-checked";
                            radio[1].children[0].className ="sort-control sort-radio";
                            radio[2].children[0].className ="sort-control sort-radio";
                            order = "热门";
                            break;
                        case 1:
                            radio[1].children[0].className ="sort-control sort-radio sort-radio-checked";
                            radio[0].children[0].className ="sort-control sort-radio";
                            radio[2].children[0].className ="sort-control sort-radio";
                            order = "时间";
                            break;
                        case 2:
                            radio[2].children[0].className ="sort-control sort-radio sort-radio-checked";
                            radio[0].children[0].className ="sort-control sort-radio";
                            radio[1].children[0].className ="sort-control sort-radio";
                            order = "评价"
                            break;
                    }
                    $('.movie-list').remove();
                    $.ajax({
                    type: "post",
                    url: url + "/movie/sortAllMovies",
                    data: {order: order},
                    dataType: "json",
                    success: function(obj){
                        console.log(obj);
                        var movieslist = $('.movies-list');
                        movieslist.append("<ul class=\"movie-list\"></ul>");
                        var movielist = $('.movie-list');
                        for(var i = 0;i < obj.count; i++){
                            movielist.append(
                                "<li> <div class=\"movie-item\"> <a href=\"./buyTickets.jsp?movie_id="+ obj.data[i].movie_id +"\" target=\"_blank\"> <div class=\"movie-poster\"> <img src=\""+ obj.data[i].movie_picture +"\"> </div> </a>" +
                                    "<div class=\"channel-action channel-action-sale\"> <a>购票<a/> </div> <div class=\"movie-ver\"></div> </div>" +
                                    "<div class=\"channel-detail movie-item-title\" title=\""+ obj.data[i].movie_cn_name +"\">" + 
                                        "<a href=\"./movieDetail.jsp?movie_id="+ obj.data[i].movie_id +"\" target=\"_blank\">"+ obj.data[i].movie_cn_name +"</a> </div>" +
                                    "<div class=\"channel-detail channel-detail-orange\"> <i class=\"integer\">"+ obj.data[i].movie_score +"</i> </div>" +
                                    "</li>"
                            );
                        }
                    },
                    error: function(){
                        alert("network error!");
                    }
                });
                };
            }
        }
        
        //副导航栏响应
        function funav(){
            layui.use('element', function(){
                var element = layui.element; 
                
                //监听导航点击
                element.on('nav(demo)', function(elem){
                    layer.msg(elem.text());
                });
            });
            var navitems = $(".fu-nav").find("li").children("a");
            for(i = 0; i< navitems.length;i++){
                navitems[i].onclick = function(){
                    //按钮
                }
            }
        }

        //初始化标签
        function initTags(){
            var tagsType = $(".tags-type"),
                tagsArea = $(".tags-area"),
                tagsYear = $(".tags-year");
            var TypeStr = ["全部","爱情","喜剧","动画","剧情","惊悚","科幻","动作","悬疑","犯罪","冒险","运动","家庭","古装","其他"],
                AreaStr = ["全部","大陆","美国","韩国","日本","中国香港","中国台湾","泰国","印度","法国","英国","俄罗斯","意大利"],
                YearStr = ["全部","2019","2018","2017","2016","2015","2014"];
            var TypeActive = [],
                AreaActive = [],
                YearActive = [];
            var urlTemp = ["&type="+type,"&area="+area,"&year="+year];
            TypeActive = inputTags(TypeStr, TypeActive, type);
            AreaActive = inputTags(AreaStr, AreaActive, area);
            YearActive = inputTags(YearStr, YearActive, year);
            for(var i=0;i<TypeStr.length;i++){
                urlTemp[0] = "&type="+TypeStr[i];
                tagsType.append(
                    "<li " + TypeActive[i] + ">" +
                        "<a href=\"?"+ urlTemp[0] + urlTemp[1] + urlTemp[2] +"\">"+
                            TypeStr[i] +
                        "</a>" +
                    "</li>"
                );
            }
            urlTemp = ["&type="+type,"&area="+area,"&year="+year];
            for(var i=0;i<AreaStr.length;i++){
                urlTemp[1] = "&area="+ AreaStr[i];
                tagsArea.append(
                    "<li " + AreaActive[i] + ">" +
                            "<a href=\"?"+ urlTemp[0] + urlTemp[1] + urlTemp[2] +"\">"+
                            AreaStr[i] +
                        "</a>" +
                    "</li>"
                );
            }
            urlTemp = ["&type="+type,"&area="+area,"&year="+year];
            for(var i=0;i<YearStr.length;i++){
                urlTemp[2] = "&year="+ YearStr[i];
                tagsYear.append(
                    "<li " + YearActive[i] + ">" +
                        "<a href=\"?"+ urlTemp[0] + urlTemp[1] + urlTemp[2] +"\">"+
                            YearStr[i] +
                        "</a>" +
                    "</li>"
                );
            }
        }
        //导入活跃标签
        function inputTags(Str, Active, tags){
            for(var i=0;i<Str.length;i++){
                if(tags==0&&i==0){
                    Active.push("class=\"active\"");
                    break;
                }
                if(Str[i]==tags){
                    Active.push("class=\"active\"");
                }
                else
                Active.push(" ");
            }
            return Active;
        }
        
        //初始化url参数
        function initParams(){
            if(getUrlParams('type') == null){
                type = "0";
            }else{
                type = getUrlParams('type');
            }
            if(getUrlParams('area') == null){
                area = "0";
            }else{
                area = getUrlParams('area');
            }
            if(getUrlParams('year') == null){
                year = "0";
            }else{
                year = getUrlParams('year');
            }
        }
        //获取url参数
        function getUrlParams(name) { // 不传name返回所有值，否则返回对应值
            var url = window.location.search;
            if (url.indexOf('?') == 1) { return false; }
            url = url.substr(1);
            url = url.split('&');
            var name = name || '';
            var nameres;
            // 获取全部参数及其值
            for(var i=0;i<url.length;i++) {
                var info = url[i].split('=');
                var obj = {};
                obj[info[0]] = decodeURI(info[1]);
                url[i] = obj;
            }
            // 如果传入一个参数名称，就匹配其值
            if (name) {
                for(var i=0;i<url.length;i++) {
                    for (const key in url[i]) {
                        if (key == name) {
                            nameres = url[i][key];
                        }
                    }
                }
            } else {
                nameres = url;
            }
            // 返回结果
            return nameres;
        }

    </script>
    <!-- ------------------------------------------------------------------- -->
</body>
</html>