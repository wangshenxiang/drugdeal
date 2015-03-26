<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="/drugdeal/resources/jquery/jquery-1.11.2.min.js"></script>
    <script src="/drugdeal/resources/bootstrap/js/bootstrap.min.js"></script>
    <script src="/drugdeal/resources/jquery-ui/jquery-ui.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
    <script src="/drugdeal/resources/drugdeal-js/drugdeal-js.js"></script>
    <script src="/drugdeal/resources/jquery.jqprint-0.3.js"></script>
    <link type="text/css" rel="stylesheet" href="/drugdeal/resources/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="/drugdeal/resources/jquery-ui/jquery-ui.min.css"/>
    <title>唐都医院便民药房</title>
</head>
<body>
<div class="container">
    <h3>生成药物单</h3>
    药物缩写：<input id="search"/><button onclick="javascript:location.reload();">清空</button><br>
    药品ID：<span id="drugId" ></span><br>
    药品名：<span id="drugName" ></span><br>
    药品规格：<span id="drugSpec" ></span><br>
    药品单价：<span id="drugPrice" ></span><br>
    当前剩余数量：<span id="allNumbers" style="color: red"></span><br>
    数量：<input id="pickNumbers" type="text" onkeyup="toInt(this)">
    <button id="confirm" onclick="addDealPost()">确认</button><br>
    <span id="numPrompt" style="display: none"></span>
    <p></p>
    患者姓名：<input type="text" id="iuName"><br>
    开票人：<input type="text" id="ikName"><br>
    <button onclick="putOtherInfo()">确认附加信息</button>
    <div id="printArea">
    <div class="h2" align="center"><b>唐都医院便民药房</b>售药交款单</div><br>
    <span>姓名：</span><span id="uName"></span>
    <table class="table table-bordered" id="table">
        <tr><td>药品名称</td><td>规格</td><td>数量</td><td>金额</td></tr>
    </table>
    <span>开票人：</span><span id="kName"></span><br>
    <span>开票日期：</span><span id="kDate"></span><br>
    </div>
    <button onclick="printDeal()">打印</button>
    <button onclick="printCancel()">取消</button>
    <a href="/drugdeal">home</a>
</div>
<script>
    $(function() {
        $( "#search" ).autocomplete({
            source: function( request, response ) {
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    url: "/drugdeal/blurReadDrugBySuoxie",
                    data: {
                        suoxie: request.term
                    },
                    success: function(ret) {
                        var data = [];
                        var item = {};
                        $.each(ret, function(i, e){
                            item.label = e.name + ","+ e.spec + "," + e.price + "," + e.numbers + "," + e.id;
                            item.value = e.name + ","+ e.spec + "," + e.price;
                            data.push(item);
                        });
                        response(data);
                    }
                });
            },
            select: function(event, ui) {
                var e = ui.item.label.split(",");
                $("#drugName").text(e[0]);
                $("#drugSpec").text(e[1]);
                $("#drugPrice").text(e[2]);
                $('#allNumbers').text(e[3]);
                $('#drugId').text(e[4]);
            },
            open: function() {
                $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
            },
            close: function() {
                $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
            }
        });
    });

    var dealNum=0;
    var deals = [];


    var addDealPost = function () {
        var drug = {};
        drug.id = $('#drugId').text();
        drug.name = $("#drugName").text();
        drug.spec = $("#drugSpec").text();
        drug.price = $("#drugPrice").text();
        drug.numbers = $('#allNumbers').text();
        var pickNum = $('#pickNumbers').val();
        if (pickNum== '' || parseInt(pickNum) > parseInt(drug.numbers)) {
            $('#numPrompt').css('display', '');
            $('#numPrompt').css('color', 'red');
            $('#numPrompt').html('输入的数量非法，请重输');
            return;
        }

        if (dealNum < 4) {
            var deal = {};
            deal.id = drug.id;
            deal.pickNum = pickNum;
            deal.name = drug.name;
            deals.push(deal);
            $('#numPrompt').css('display', 'none');
            $('#table').append("<tr class=\"tr\"><td>" + drug.name + "</td><td>" + drug.spec + "</td><td>"
                    + pickNum + "</td><td>" + parseFloat(drug.price)*parseInt(pickNum) + "</td></tr>");
            dealNum++;
        } else {
            $('#numPrompt').css('display', '');
            $('#numPrompt').css('color', 'red');
            $('#numPrompt').html('药单数量最大为4个');
        }
    }

    var printDeal = function() {
        var log = "";
        $('#printArea').jqprint();
        $('#table').empty();
        $('#table').append("<tr><td>药品名称</td><td>规格</td><td>数量</td><td>金额</td></tr>");
        deals = [];
    }

    var printCancel = function() {
        $('#table').empty();
        deals = [];
        location.reload();
    }

    var putOtherInfo = function() {
        $('#uName').empty();
        $('#uName').html($('#iuName').val());
        $('#kName').html($('#ikName').val());
        var dt = new Date();
        var nowDT = dt.format('yyyy-MM-dd');
        $('#kDate').html(nowDT);
    }

    Date.prototype.format = function(format)
    {
        var o = {
            "M+" : this.getMonth()+1, //month
            "d+" : this.getDate(),    //day
            "h+" : this.getHours(),   //hour
            "m+" : this.getMinutes(), //minute
            "s+" : this.getSeconds(), //second
            "q+" : Math.floor((this.getMonth()+3)/3),  //quarter
            "S" : this.getMilliseconds() //millisecond
        }
        if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
                (this.getFullYear()+"").substr(4 - RegExp.$1.length));
        for(var k in o)if(new RegExp("("+ k +")").test(format))
            format = format.replace(RegExp.$1,
                            RegExp.$1.length==1 ? o[k] :
                            ("00"+ o[k]).substr((""+ o[k]).length));
        return format;
    }

</script>
</body>
</html>
