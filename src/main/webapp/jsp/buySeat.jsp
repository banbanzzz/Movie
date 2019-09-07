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
    <link rel="stylesheet" type="text/css" href="../static/css/buySeat.css">
    <link rel="stylesheet" type="text/css" href="../static/css/footer.css">
    <script src="../static/js/header.js" charset="utf-8"></script>
    <script src="../static/js/Api.js"></script>

    <script src="../static/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
    <title>鹰眼电影-选位置</title>
</head>
<body>
    <!-- ------------------------------------------------------------------- -->
    <!-- 导航栏 -->
    <jsp:include page="header.jsp"/>

    <!-- 占位符 -->
    <div style="margin-top: 90px;"></div>

    <!-- 主体 -->
    <div class="container">
        <div class="order-progress-bar">
            <div class="step first done">
                <span class="step-num">1</span>
                <div class="bar"></div>
                <span class="step-next">选择影片场次</span>
            </div>
            <div class="step done">
                <span class="step-num">2</span>
                <div class="bar"></div>
                <span class="step-next">选择座位</span>
            </div>
            <div class="step">
                <span class="step-num">3</span>
                <div class="bar"></div>
                <span class="step-next">付款</span>
            </div>
            <div class="step last">
                <span class="step-num">4</span>
                <div class="bar"></div>
                <span class="step-next">影院取票观影</span>
            </div>
        </div>

        <div class="main">
            <!-- 主页 -->
            <div class="hall">
                <div class="seat-example">
                    <div class="selectable-example example">
                        <span>可选座位</span>
                    </div>
                    <div class="sold-example example">
                        <span>已售座位</span>
                    </div>
                    <div class="selected-example example">
                        <span>已选座位</span>
                    </div>
                    <div class="couple-example example">
                        <span>情侣座位</span>
                    </div>
                </div>
                <div class="seats-block">
                    <div class="row-id-container">
                    </div>
                    <div class="seats-container">
                        <div class="screen-container">
                            <div class="screen">银幕中央</div>
                            <div class="c-screen-line"></div>
                        </div>
                        <div class="seats-wrapper">
                        </div>
                    </div>
                </div>
            </div>
            <!-- 侧页 -->
            <div class="side">
                <!-- 电影 -->
                <div class="movie-info clearfix">
                </div>
                <!-- 场次 -->
                <div class="show-info">
                    
                </div>
                <div class="ticket-info">
                    <div class="no-ticket" style="display: block;">
                        <p class="buy-limit">座位：一次最多选4个座位</p>
                    </div>
                    <div class="has-ticket" style="display: none;">
                        <span class="text">座位：</span>
                        <div class="ticket-container">
                        </div>
                    </div>
                    <div class="total-price">
                        <span>总价：</span>
                        <span class="price"></span>
                    </div>
                </div>
                <div class="confirm-order">
                    <div class="email">
                        <span>邮箱号：</span>
                    </div>
                    <div class="confirm-btn disable" onclick="confirm()">确认选座</div>
                </div>
            </div>
        </div>
    </div>

    <!-- 脚 -->
    <jsp:include page="footer.jsp"/>

    <!-- ------------------------------------------------------------------- -->
    <script>
        var clientHeight = document.documentElement.clientHeight;
        var SeatMax=0;
        var PriceTemp=1;
        var schedule_id = getUrlParams("schedule_id");
        var TempLength;
        var TempSeat = "";
        var Seatrow = [], Seatcol = [];

        window.onload = function(){
            initHeader();
            initEmail(); //邮箱
            initInformation(); //信息
        }

        //初始化邮箱
        function initEmail(){
            var user_name;
            var email = $(".email");
            email.append("<span class=\"email-num\">137***325@qq.com</span>");
        }

        //点击具体座位事件  
        function buySeat(i,j){
            var row = $(".seats-wrapper").find(".row")[i].children[j];
            var flag = 0;
            var NoTicket = $(".no-ticket")[0];
            var HasTicket = $(".has-ticket")[0];
            var Ticket = $(".has-ticket").find(".ticket-container");
            var TicketRemove;
            var TicketPrice = $(".price");
            var ConfirmBtn = $(".confirm-btn")[0];
            //座位不能大于四
            if((SeatMax>3) && (row.className == "seat selectable")){
                layui.use(['layer'], function(){
                var layer = layui.layer;
                    layer.alert('一次最多选四个座位！',{icon: 0,offset: clientHeight/5},
                        function (){
                            layer.closeAll();
                        }
                    );
                });
            }
            //确定
            if((SeatMax<4) && (row.className == "seat selectable")){
                row.className = "seat selected";
                SeatMax++;
                flag = 1;
                Ticket.append("<span class=\"ticket\" data-index=\"" + (i+1) + "-" + (j+1) + "\">" + (i+1) + "排" + (j+1) + "座</span>");
                TicketPrice.text("￥"+PriceTemp*SeatMax);
            }
            //取消
            if((row.className == "seat selected") && (flag==0)){
                TicketRemove = $("[data-index=" + (i+1) + "-" + (j+1) + "]");
                row.className = "seat selectable";
                SeatMax--;
                TicketRemove[0].remove();
                TicketPrice.text("￥"+PriceTemp*SeatMax);
            }
            if(SeatMax==0){
                NoTicket.style.display = "block";
                HasTicket.style.display = "none";
                ConfirmBtn.className = "confirm-btn disable";
            }
            else{
                NoTicket.style.display = "none";
                HasTicket.style.display = "block";
                ConfirmBtn.className = "confirm-btn";
            }
        }
    
        //初始化信息
        function initInformation(){
            var movieInfo = $(".movie-info");
            var showInfo = $(".show-info");
            $.ajax({
                type:'post',
                url: url + "/schedule/findScheduleById",
                dataType:'json',
                data: {
                    schedule_id: schedule_id
                },
                success:function (obj) {
                    TempLength = obj.data.orderList.length;
                    for(var i=0;i<TempLength;i++){
                        Seatrow[i] = obj.data.orderList[i].order_position.split("排")[0];
                        Seatcol[i] = obj.data.orderList[i].order_position.split("排")[1].split("座")[0];
                    }
                    console.log(obj);
                    PriceTemp = obj.data.schedule_price;
                    movieInfo.append(
                        "<div class=\"poster\">" +
                            "<img src=\"" + obj.data.schedule_movie.movie_picture + "\">" +
                        "</div>" +
                        "<div class=\"content\">" +
                            "<p class=\"name text-ellipsis\">" + obj.data.schedule_movie.movie_cn_name + "</p>" +
                            "<div class=\"info-item\">" +
                                "<span>类型：</span>" +
                                "<span class=\"value\">" + obj.data.schedule_movie.movie_type + "</span>" +
                            "</div>" +
                            "<div class=\"info-item\">" +
                                "<span>时长：</span>" +
                                "<span class=\"value\">" + obj.data.schedule_movie.movie_duration + "</span>" +
                            "</div>" +
                        "</div>"
                    );
                    showInfo.append(
                        "<div class=\"info-item\">" +
                            "<span>影院：</span>" +
                            "<span class=\"value\">" + obj.data.schedule_hall.hall_cinema.cinema_name + "</span>" +
                        "</div>" +
                        "<div class=\"info-item\">" +
                            "<span>影厅：</span>" +
                            "<span class=\"value\">" +  obj.data.schedule_hall.hall_name + "</span>" +
                        "</div>" +
                        "<div class=\"info-item\">" +
                            "<span>版本：</span>" +
                            "<span class=\"value\">" +  obj.data.schedule_movie.movie_country + "</span>" +
                        "</div>" +
                        "<div class=\"info-item\">" +
                            "<span>场次：</span>" +
                            "<span class=\"value\">" + obj.data.schedule_startTime + "</span>" +
                        "</div>" +
                        "<div class=\"info-item\">" +
                            "<span>票价：</span>" +
                            "<span class=\"value\">￥" + obj.data.schedule_price + "/张</span>" +
                        "</div>"
                    );
                    initSeat();
                }
            });
        }
    
        //初始化座位表
        function initSeat(){
            var SeatRow = $(".row-id-container");
            var seat = $(".seats-wrapper");
            var row;
            var HtmlRowHead = "<div class=\"row\">\n";
            var HtmlRowLast = "</div>";
            var HtmlSeat;
            var flag;
            for(var i=0;i<12;i++)
            {
                SeatRow.append("<span class=\"row-id\">" + (i + 1) + "</span>");
                seat.append(HtmlRowHead);
                row = $(".seats-wrapper").find(".row").last();
                for(var j=0;j<12;j++)
                {
                    if(TempLength==0){
                        HtmlSeat = "<span class=\"seat selectable\" onclick=\"buySeat(" + i + "," + j +")\"></span>";
                    }
                    else{
                        flag = 0;
                        for(var p=0;p<TempLength;p++){    
                            if((Seatrow[p]==(i+1)) && (Seatcol[p]==(j+1))){
                                flag = 1;
                            }
                        }
                        if(flag==1){
                            HtmlSeat = "<span class=\"seat sold\" onclick=\"buySeat(" + i + "," + j +")\"></span>";
                        }
                        else{
                            HtmlSeat = "<span class=\"seat selectable\" onclick=\"buySeat(" + i + "," + j +")\"></span>";
                        }
                    }
                    row.append(HtmlSeat);
                }
                seat.append(HtmlRowLast);
            }
        }

        //确认选座
        function confirm(){
            var ticketContainer = $(".ticket-container").find(".ticket");
            var price = $(".price").html();
            price = price.replace("￥","");
            var TicketSeat="";
            for(var i=0;i<ticketContainer.length;i++){
                TicketSeat += ticketContainer[i].innerHTML;
                if(i < (ticketContainer.length-1)){
                    TicketSeat += ",";
                }
            }
            var json = {};
            json.schedule_id = schedule_id;
            json.TicketSeat = TicketSeat;
            json.price = price;
            localStorage.setItem("order",JSON.stringify(json));
            window.location.href="./pay.jsp";
           // window.location.href="./pay.jsp?schedule_id=" + schedule_id + "&TicketSeat=" + TicketSeat + "&price=" + price;
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