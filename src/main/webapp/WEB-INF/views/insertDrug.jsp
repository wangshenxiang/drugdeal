<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="/drugdeal/resources/jquery/jquery-1.11.2.min.js"></script>
    <script src="/drugdeal/resources/drugdeal-js/drugdeal-js.js"></script>
    <link type="text/css" rel="stylesheet" href="/drugdeal/resources/bootstrap/css/bootstrap.css"/>
    <title>药品录入页面</title>
</head>
<body>
    <h1>药品录入</h1>
    <form id="newDrugForm" action="/drugdeal/insertDrug" method="post" onsubmit="return doCheck(this)">
        药品编号：<input id="id" type="text" name="id" onblur="isDrugExisted(this)">
        <span id="idPrompt" style="display: none"></span><br>
        药品名称：<input id="name" type="text" name="name"><br>
        药品缩写：<input id="suoxie" type="text" onKeyUp="upCase(this)" onblur="upCase(this)" name="suoxie"><br>
        药品规格：<input id="spec" type="text" name="spec"><br>
        药品价格：<input id="price" type="text" name="price" onKeyUp="toPrice(this)"><br>
        药品厂家：<input id="product" type="text" name="product"><br>
        药品数量：<input id="numbers" type="text" name="numbers" onKeyUp="toInt(this)"><br>
        备  &nbsp;&nbsp;&nbsp;&nbsp;注：<textarea id="memo" type="text" name="memo">&nbsp;</textarea><br>
        <input id='submit' type="submit" value="添加该药品">
        <span id="prompt" style="display: none; color: red;"></span>
        <a href="/drugdeal">home</a>
    </form>

</body>
</html>
