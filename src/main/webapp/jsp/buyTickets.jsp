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
    <link rel="stylesheet" type="text/css" href="../static/css/footer.css">
    <link rel="stylesheet" type="text/css" href="../static/css/buyTickets.css">
    <link rel="stylesheet" type="text/css" href="../static/css/movieDetail.css">
    <script src="../static/js/header.js" charset="utf-8"></script>
    <script src="../static/js/Api.js"></script>

    <script src="../static/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
    <title>鹰眼电影-选影院</title>
</head>
<body>
    <!-- ------------------------------------------------------------------- -->
    <!-- 导航栏 -->
    <jsp:include page="header.jsp"/>
  
    <!-- 占位符 -->
    <div style="margin-top: 80px;"></div>

    <!-- 巨幕 -->
    <div class="banner2">
        <div class="wrapper clearfix">
            <div class="celeInfo-left">
                <div class="avatar-shadow">
                    <!-- 图片 -->
                </div>
            </div>
            
            <div class="celeInfo-right clearfix">
                <div class="movie-brief-container">
                    <!-- 上 -->
                </div>
                <div class="action-buyBtn">
                    <div class="action clearfix" data-val="{movieid:42964}">
                        <a class="wish " data-wish="false" onclick="wantSee()">
                            <div>
                                <i class="icon wish-icon"></i>
                                <span class="wish-msg" data-act="wish-click">想看</span>
                            </div>
                        </a>
                        <a class="score-btn " data-bid="b_rxxpcgwd" onclick="giveScore()">
                            <div>
                                <i class="icon score-btn-icon"></i>
                                <span class="score-btn-msg" data-act="comment-open-click">评分</span>
                            </div>
                        </a>
                    </div>
                </div>

                <div class="movie-stats-container">
                    <div class="movie-index">
                        <p class="movie-index-title">用户评分</p>
                        <div class="movie-index-content score normal-score">
                            <span class="index-left info-num ">
                                <!-- 评分 -->
                            </span>
                            <div class="index-right">
                                <div class="star-wrapper">
                                    <div id="MovieScore"></div>
                                </div>
                                <span class="score-num">
                                    <!-- 评分数 -->
                                </span>
                            </div>
                        </div>
                    </div>   

                    <div class="movie-index">
                        <p class="movie-index-title">累计票房</p>
                        <div class="movie-index-content box stonefont-num">
                            <!-- 票房数 -->
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- 占位符 -->
    <div style="margin-top: 50px;"></div>

    <!-- 主体 -->
    <div class="main">
        <div class="main-inner main-buyticket">
            <!-- 标签 -->
            <div class="tags-panel">
                <ul class="tags-lines">
                    <li class="tags-line">
                        <div class="tags-title">日期:</div>
                        <ul class="tags tags-date">
                            <!-- 日期 -->
                        </ul>
                    </li>
                    <li class="tags-line tags-line-border" data-type="brand">
                        <div class="tags-title">品牌:</div>
                        <ul class="tags tags-brand">
                            <!-- 品牌 -->
                        </ul>
                    </li>

                    <li class="tags-line tags-line-border" data-type="district">
                        <div class="tags-title">行政区:</div>
                        <ul class="tags tags-area">
                            <!-- 行政区 -->
                        </ul>
                    </li>

                    <li class="tags-line tags-line-border" data-type="hallType">
                        <div class="tags-title">特殊厅:</div>
                        <ul class="tags tags-hall">
                            <!-- 特殊厅 -->
                        </ul>
                    </li>
            
                </ul>
            </div>	
            <!-- 列表 -->
            <div class="cinemas-list">
                <h2 class="cinemas-list-header">影院列表</h2>   
            </div>
            <!-- 分页 -->
            <div class="cinema-pager">
                <ul class="list-pager">	
                </ul>
            </div>
        </div>
    </div>

    <!-- 脚 -->
    <jsp:include page="footer.jsp"/>

    <!-- ------------------------------------------------------------------- -->
    <script>
        var clientHeight = document.documentElement.clientHeight;
        var movie_id;
        var date;
        var brand;
        var area;
        var hall;
        var page;
        var ScoreHtml;
        var CinemaLength;

        window.onload = function(){
            initHeader();
            initParams(); //参数
            initBanner(); //巨幕
            initHtml(); //HTML
            initTags(); //标签和分页
        }

        //初始化HTML
        function initHtml(){
            ScoreHtml = 
                "<div style=\"text-align:center; margin:30px 0;\">" +
                    "<div id=\"GiveScore\"></div>" +
                    "<p style=\"color:#888;\">点击星星进行评分</p>" +
                "</div>"
            ;
        }

        //初始化巨幕
        function initBanner(){
            movie_id = getUrlParams('movie_id');
            var avatar = $(".avatar-shadow");
            var movieBriefContainer = $(".movie-brief-container");
            var infoNum = $(".info-num");
            var scoreNum = $(".score-num");
            var stonefontNum = $(".stonefont-num");
            var actionBuyBtn = $(".action-buyBtn");
            var StonefontTemp;

            $.ajax({
                type:'post',
                url: url + "/movie/findMovieById",
                dataType:'json',
                data: {
                    movie_id: movie_id
                },
                success:function (obj) {
                    StonefontTemp = obj.data.movie_boxOffice;
                    StonefontTemp += "万";
                    avatar.append("<img class=\"avatar\" src=\"" + obj.data.movie_picture + "\" alt=\"\">");
                    movieBriefContainer.append(
                    "<h3 class=\"name\">" + obj.data.movie_cn_name + "</h3>" +
                    "<div class=\"ename ellipsis\">" + obj.data.movie_fg_name + "</div>" +
                    "<ul>" +
                        "<li class=\"ellipsis\">" + obj.data.movie_type + "</li>" +
                        "<li class=\"ellipsis\">" + obj.data.movie_duration + " / " + obj.data.movie_country + "</li>" +
                        "<li class=\"ellipsis\">" + obj.data.releaseDate + "</li>" +
                    "<ul>");
                    infoNum.append("<span class=\"stonefont\">" + obj.data.movie_score + "</span>");
                    scoreNum.append("<span class=\"stonefont\">" + obj.data.movie_commentCount + "</span>人评分");
                    stonefontNum.append("<span class=\"stonefont\">" + StonefontTemp + "</span>");
                    actionBuyBtn.append("<a class=\"btn buy\" href=\"./movieDetail.jsp?movie_id=" + movie_id + "\" data-act=\"more-detail-click\">查看更多电影详情</a>");
                    layui.use('rate', function(){
                        var rate = layui.rate;
                        rate.render({
                            elem: '#MovieScore'
                            ,value: (obj.data.movie_score / 2)
                            ,half: true
                            ,readonly: true
                        })
                    });
                    initList(obj);
                }
            });
        }
        //评分
        function giveScore(){
            layui.use(['rate','layer'], function(){
                var layer = layui.layer;
                var rate = layui.rate;
                layer.open({
                    type: 1
                    ,title: "电影评分"
                    ,closeBtn: false
                    ,area: '400px;'
                    ,shade: 0.8
                    ,offset: clientHeight/5
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btn: ['确认评分', '取消']
                    ,yes: function(){
                        layer.alert('感谢你的评价,祝你生活愉快！',{icon: 0,offset: clientHeight/5},
                            function (){
                                layer.closeAll();
                                location.reload();
                            }
                        );
                    }
                    ,btnAlign: 'c'
                    ,moveType: 0 //拖拽模式，0或者1
                    ,content: ScoreHtml
                    ,success: function(layero){
                        rate.render({
                            elem: '#GiveScore'
                            ,value: 4.5
                            ,half: true
                            ,text: true
                            ,setText: function(value){
                                this.span.text(value*2+"分");
                            }
                        })
                    }
                });
            });
        }
        //想看
        function wantSee(){
            layui.use(['rate','layer'], function(){
                var layer = layui.layer;
                var rate = layui.rate;
                layer.alert('感谢你的支持！',{icon: 0,offset: clientHeight/5},
                    function (){
                        layer.closeAll();
                        location.reload();
                    }
                );
            });
        }

        //初始化标签和分页
        function initTags(){
            var Data = new Date();
            var Month = Data.getMonth() + 1;
            var Day = Data.getDate();
            var tagsDate = $(".tags-date"),
                tagsBrand = $(".tags-brand"),
                tagsArea = $(".tags-area"),
                tagsHall = $(".tags-hall");
            var DateStr = ["今天","明天","后天","大后天"],
                BrandStr = ["全部","金逸影院","大地影院","中影国际影院","万达影城","CGV影城","恒大影城","五月花电影城","博纳国际影城","星美国际影城","比高电影城"],
                AreaStr = ["全部","小榄","石岐区","五桂山区","火炬开发区","西区","古镇","南朗镇","三乡镇","东凤镇","阜沙镇","大涌镇"],
                HallStr = ["全部","普通厅","IMAX厅","CGS中国巨幕厅","杜比全景声厅","DTS:X临境音厅","4K厅","4D厅"];
            var DateActive = [],
                BrandActive = [],
                AreaActive = [],
                HallActive = [];
                PageActive = [];
            var urlTemp = ["&date="+date,"&brand="+brand,"&area="+area,"&hall="+hall,"&page="+page];
            DateActive = inputTags(DateStr.length, DateActive, date);
            BrandActive = inputTags(BrandStr.length, BrandActive, brand);
            AreaActive = inputTags(AreaStr.length, AreaActive, area);
            HallActive = inputTags(AreaStr.length, HallActive, hall);
            for(var i=0;i<DateStr.length;i++){
                urlTemp[0] = "&date="+ i;
                tagsDate.append(
                    "<li " + DateActive[i] + ">" +
                        "<a href=\"?movie_id="+ movie_id + urlTemp[0] + urlTemp[1] + urlTemp[2] + urlTemp[3] + urlTemp[4] +"\">"+
                            DateStr[i] + " " + Month + "月" + (Day+i) +
                        "</a>" +
                    "</li>"
                );
            }
            urlTemp = ["&date="+date,"&brand="+brand,"&area="+area,"&hall="+hall,"&page="+page];
            for(var i=0;i<BrandStr.length;i++){
                urlTemp[1] = "&brand="+ i;
                tagsBrand.append(
                    "<li " + BrandActive[i] + ">" +
                        "<a href=\"?movie_id="+ movie_id + urlTemp[0] + urlTemp[1] + urlTemp[2] + urlTemp[3] + urlTemp[4] +"\">"+
                            BrandStr[i] +
                        "</a>" +
                    "</li>"
                );
            }
            urlTemp = ["&date="+date,"&brand="+brand,"&area="+area,"&hall="+hall,"&page="+page];
            for(var i=0;i<AreaStr.length;i++){
                urlTemp[2] = "&area="+ i;
                tagsArea.append(
                    "<li " + AreaActive[i] + ">" +
                        "<a href=\"?movie_id="+ movie_id + urlTemp[0] + urlTemp[1] + urlTemp[2] + urlTemp[3] + urlTemp[4] +"\">"+
                            AreaStr[i] +
                        "</a>" +
                    "</li>"
                );
            }
            urlTemp = ["&date="+date,"&brand="+brand,"&area="+area,"&hall="+hall,"&page="+page];
            for(var i=0;i<HallStr.length;i++){
                urlTemp[3] = "&hall="+ i;
                tagsHall.append(
                    "<li " + HallActive[i] + ">" +
                        "<a href=\"?movie_id="+ movie_id + urlTemp[0] + urlTemp[1] + urlTemp[2] + urlTemp[3] + urlTemp[4] +"\">"+
                            HallStr[i] +
                        "</a>" +
                    "</li>"
                );
            }


            // var listPager = $(".list-pager");
            // var lengthtemp = 23;
            // var PageNum = Math.floor(lengthtemp/10)+1;
            // PageActive = inputTags(PageNum+1, PageActive, page);
            // urlTemp = ["&date="+date,"&brand="+brand,"&area="+area,"&hall="+hall,"&page="+page];
            // if(page != 1){
            //     urlTemp[4] = "&page="+ (page-1);
            //     listPager.append(
            //         "<li>" +
            //             "<a onclick=\"changePage(" + (page-1) + ")\" class=\"page\" href=\"?movie_id="+ movie_id + urlTemp[0] + urlTemp[1] + urlTemp[2] + urlTemp[3] + urlTemp[4] +"\">上一页</a>" +
            //         "</li>"
            //     );
            // }
            // for(var i = 1;i<PageNum+1;i++){
            //     urlTemp[4] = "&page="+ i;
            //     listPager.append(
            //         "<li>" +
            //             "<a onclick=\"changePage(" + i + ")\" "+ PageActive[i] + " href=\"?movie_id="+ movie_id + urlTemp[0] + urlTemp[1] + urlTemp[2] + urlTemp[3] + urlTemp[4] +"\">" + i + "</a>" +
            //         "</li>"
            //     );
            // }
            // if(page != PageNum){
            //     urlTemp[4] = "&page=" + (page-'-1');
            //     listPager.append(
            //         "<li>" +
            //             "<a onclick=\"changePage(" + (page-'-1') + ")\" class=\"page\" href=\"?movie_id="+ movie_id + urlTemp[0] + urlTemp[1] + urlTemp[2] + urlTemp[3] + urlTemp[4] +"\">下一页</a>" +
            //         "</li>"
            //     );
            // }
        }
        //导入活跃标签
        function inputTags(length, Active, tags){
            for(var i=0;i<length;i++){
                if(tags==null&&i==0){
                    Active.push("class=\"active\"");
                    break;
                }
                if(i==tags){
                    Active.push("class=\"active\"");
                }
                else
                Active.push(" ");
            }
            return Active;
        }
        //分页点击
        function changePage(page){
            console.log(page);
        }

        //初始化电影院列表
        function initList(obj){
            console.log(obj);
            var cinemasList = $(".cinemas-list");
            var ListLength;       
            var TempPrice = [];
            var MinPrice = [];
            for(var i = 0;i< obj.cinemaList.length;i++){
                var scheduleCount = 0;
                for(var j = 0;j< obj.cinemaList[i].hallList.length;j++){
                    if(obj.cinemaList[i].hallList[j].scheduleList.length ==0){
                        scheduleCount++;
                    }
                }
                if(scheduleCount == obj.cinemaList[i].hallList.length){
                    obj.cinemaList.splice(i,1);
                }
            }
            CinemaLength = obj.cinemaList.length;
            for(var i=0;i<obj.cinemaList.length;i++){
                TempPrice[i] = "";
                for(var j=0;j<obj.cinemaList[i].hallList.length;j++){
                    for(var p=0;p<obj.cinemaList[i].hallList[j].scheduleList.length;p++){
                        TempPrice[i] += obj.cinemaList[i].hallList[j].scheduleList[p].schedule_price;
                        TempPrice[i] += ",";                  
                    }
                }
                TempPrice[i] = TempPrice[i].substr(0, TempPrice[i].length - 1);  
                MinPrice[i] = TempPrice[i].split(',').sort();
            }
            


            if(obj.cinemaList.length<11){
                ListLength = obj.cinemaList.length;
            }
            else{
                ListLength = 10;
            }
            for(var i=0;i<ListLength;i++){
                cinemasList.append(
                    "<div class=\"cinema-cell\">" +
                        "<div class=\"cinema-info\">" +
                            "<a class=\"cinema-name\">" + obj.cinemaList[i].cinema_name + "</a>" +
                            "<p class=\"cinema-address\">地址：" + obj.cinemaList[i].cinema_address + "</p>" +
                        "</div>" +
                        "<div class=\"buy-btn\">" +
                            "<a href=\"./selectSeat.jsp?cinema_id=" + obj.cinemaList[i].cinema_id + "&movie_id=" + obj.data.movie_id + "\">选座购票</a>" +
                        "</div>" +
                        "<div class=\"price\">" +
                            "<span class=\"rmb red\">￥</span>" +
                            "<span class=\"price-num red\"><span class=\"stonefont\">"+ MinPrice[i].shift() +"</span></span>" +
                            "<span style=\"margin-left:5px;\">起</span>" +
                        "</div>" +
                    "</div>"
                );
            }
        }

        //初始化url参数
        function initParams(){
            if(getUrlParams('date') == null){
                date = "0";
            }else{
                date = getUrlParams('date');
            }
            if(getUrlParams('brand') == null){
                brand = "0";
            }else{
                brand = getUrlParams('brand');
            }
            if(getUrlParams('area') == null){
                area = "0";
            }else{
                area = getUrlParams('area');
            }
            if(getUrlParams('hall') == null){
                hall = "0";
            }else{
                hall = getUrlParams('hall');
            }
            if(getUrlParams('page') == null){
                page = "1";
            }else{
                page = getUrlParams('page');
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