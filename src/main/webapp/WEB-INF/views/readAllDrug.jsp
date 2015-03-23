<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="/drugdeal/resources/jquery/jquery-1.11.2.min.js"></script>
    <script src="/drugdeal/resources/drugdeal-js/drugdeal-js.js"></script>
    <link type="text/css" rel="stylesheet" href="/drugdeal/resources/bootstrap/css/bootstrap.css"/>
    <title>查看药物</title>
</head>
<body>
    <table id ="table"></table>
    <a href="/drugdeal">home</a>
<script>
    readAllDrug("#table");
</script>
</body>
</html>
