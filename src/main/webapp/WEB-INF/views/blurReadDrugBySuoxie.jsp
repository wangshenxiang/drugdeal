<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="/drugdeal/resources/jquery/jquery-1.11.2.min.js"></script>
    <script src="/drugdeal/resources/bootstrap/js/bootstrap.min.js"></script>
    <script src="/drugdeal/resources/jquery-ui/jquery-ui.min.js"></script>
    <script src="/drugdeal/resources/jquery-migrate-1.1.0.js"></script>
    <script src="/drugdeal/resources/drugdeal-js/drugdeal-js.js"></script>
    <script src="/drugdeal/resources/jquery.jqprint-0.3.js"></script>
    <link type="text/css" rel="stylesheet" href="/drugdeal/resources/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="/drugdeal/resources/jquery-ui/jquery-ui.min.css"/>
    <title>生成药物单</title>
</head>
<body>
<div class="container">
    <h3>生成药物单</h3>
    药物：<input id="search"/><br>
    药品ID：<span id="drugId" ></span><br>
    药品名：<span id="drugName" ></span><br>
    药品规格：<span id="drugSpec" ></span><br>
    药品单价：<span id="drugPrice" ></span><br>
    当前剩余数量：<span id="allNumbers" style="color: red"></span><br>
    数量：<input id="pickNumbers" type="text" onkeyup="toInt(this)">
    <button id="confirm" onclick="addDealPost()">确认</button><br>
    <span id="numPrompt" style="display: none"></span>
    <p></p>
    <div id="printArea">
    <table class="table table-bordered" id="table">
        <tr><td>药品名称</td><td>规格</td><td>数量</td><td>金额</td></tr>
    </table>
    </div>
    <button onclick="printDeal()">打印</button>
    <button onclick="printCancel()">取消</button>
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
            $('#allNumbers').text(parseInt(drug.numbers)-pickNum);
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
        $.each(deals, function(i, deal) {
            $.ajax({
                type: "GET",
                dataType: "json",
                url: "/drugdeal/subDrugNumbers",
                async: false,
                data: {
                    id: deal.id,
                    num: deal.pickNum
                },
                success: function (ret) {
                    log += drug.name + "库存量减" + pickNum + "\n";
                }
            });
        });
        alert(log);
        $('#printArea').jqprint();
    }

    var printCancel = function() {
        $('#table').empty();
        var log = "";
        $.each(deals, function(i, deal) {
            $.ajax({
                type: "GET",
                dataType: "json",
                url: "/drugdeal/addDrugNumbers",
                async: false,
                data: {
                    id:deal.id,
                    num:deal.pickNum
                },
                success: function(ret) {
                    log += deal.name + "库存量加" + deal.pickNum + "\n" ;
                }
            });
        });
        alert(log);
        deals = [];
        location.reload();
    }

</script>
</body>
</html>
