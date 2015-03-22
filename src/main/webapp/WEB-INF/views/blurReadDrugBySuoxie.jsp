<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="/drugdeal/resources/jquery/jquery-1.11.2.min.js"></script>
    <script src="/drugdeal/resources/bootstrap/js/bootstrap.min.js"></script>
    <script src="/drugdeal/resources/suggest/bootstrap-suggest.min.js"></script>
    <script src="/drugdeal/resources/drugdeal-js/drugdeal-js.js"></script>
    <link type="text/css" rel="stylesheet" href="/drugdeal/resources/bootstrap/css/bootstrap.css"/>
    <title>生成药物单</title>
</head>
<body>
<div class="container">
    <h3>生成药物单</h3>
    药物：
    <div class="dropdown">
        <div class="input-group"  id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
            <input id="suoxie" type="text" class="form-control" placeholder="药品名缩写"
                      aria-describedby="basic-addon1" onkeyup="blurRead(this)">
        </div>
        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" id="menu">
        </ul>
    </div>
    当前剩余数量：<span id="allNumbers" style="color: red"></span><br>
    数量：
    <div class="input-group" data-toggle="dropdown" aria-expanded="true">
        <input type="text" class="form-control" placeholder="药品数量"
               aria-describedby="basic-addon1" onkeyup="toInt(this)" id="pickNumbers">
    </div>
    <button id="confirm" onclick="addDealPost()">确认</button><br>
    <span id="numPrompt" style="display: none"></span>
    <p></p>
    <table class="table table-bordered" id="table">
        <tr><td>药品名称</td><td>规格</td><td>数量</td><td>金额</td></tr>
    </table>
</div>
<script>
    var drug;
    var dealNum=0;

    function blurRead(v) {
        upCase(v);
        $.ajax({
            type: "GET",
            dataType: "json",
            url: "/drugdeal/blurReadDrugBySuoxie?suoxie="+ v.value,
            async: false,
            success: function (ret) {
                $('#menu').empty();
                var show;
                $.each(ret,function(i,e){
                    show = e.name;
                    $('#menu').append("<li role=\"presentation\"><a role=\"menuitem\" tabindex=-1 href=\"javascript:void(0)\">"
                            +show+"</a></li>");
                    $(document).on('click', '#menu li['+i+'] a',function (e) {
                        drug = e;
                        $('#suoxie').val(drug.name);
                        $('#allNumbers').html(drug.numbers);
                    });
                });

            }
        });
    }

    function addDealPost() {
        var pickNum = $('#pickNumbers').val();
        if (pickNum== '' || parseInt(pickNum) > parseInt(drug.numbers)) {
            $('#numPrompt').css('display', '');
            $('#numPrompt').css('color', 'red');
            $('#numPrompt').html('输入的数量非法，请重输');
            return;
        }

        $('#numPrompt').css('display', 'none');

        if (dealNum < 4) {
            $('#table').append("<tr><td>" + drug.name + "</td><td>" + drug.spec + "</td><td>"
                    + pickNum +"</td><td>" + parseFloat(drug.price)*parseInt(pickNum) + "</td></tr>");
            dealNum++;
        } else {
            $('#numPrompt').css('display', '');
            $('#numPrompt').css('color', 'red');
            $('#numPrompt').html('药单数量最大为4个');
        }
    }

</script>
</body>
</html>
