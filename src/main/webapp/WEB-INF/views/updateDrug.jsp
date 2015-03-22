<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="/drugdeal/resources/jquery/jquery-1.11.2.min.js"></script>
    <script src="/drugdeal/resources/drugdeal-js/drugdeal-js.js"></script>
    <link type="text/css" rel="stylesheet" href="/drugdeal/resources/bootstrap/css/bootstrap.css"/>
    <title>药品信息修改</title>
</head>
<body>
    <h1>药品信息修改</h1>
    <form id="drugForm" action="/drugdeal/updateDrug" method="post" onsubmit="return doCheck(this)">
        药品id：<input id="id" type="text" name="id" onblur="notExisted(this)">
        <span id="idPrompt" style="display: none"></span><br>
        药品名：<input id="name" type="text" name="name"><br>
        药品名缩写：<input id="suoxie" type="text" onKeyUp="upCase(this)" name="suoxie"><br>
        药品规格：<input id="spec" type="text" name="spec"><br>
        药品价格：<input id="price" type="text" name="price" onKeyUp="toPrice(this)"><br>
        药品生产厂家：<input id="product" type="text" name="product"><br>
        药品数量：<input id="numbers" type="text" name="numbers" onKeyUp="toInt(this)"><br>
        备注：<textarea id="memo" type="text" name="memo">&nbsp;</textarea><br>
        <input id='submit' type="submit" value="修改该药品">
        <span id="prompt" style="display: none; color: red;"></span>
        <a href="/drugdeal">home</a>
    </form>

    <script>
        $(function(){
            var id = "${param.id}";
            if (id != '') {
                $('#id').val(id);
                readDrug(id);
            }
        });

        function notExisted(v){
            var id = v.value;
            if (isDrugExistedById(id)) {
                $("#idPrompt").css('display','none');
                readDrug(id);
            } else {
                $("#idPrompt").css('display','');
                $("#idPrompt").css('color','red');
                $("#idPrompt").html("无此药物，请重输");
            }
        }
    </script>
</body>
</html>
