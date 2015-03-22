<%--
  Created by IntelliJ IDEA.
  User: wangshenxiang
  Date: 15-3-20
  Time: 下午1:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>操作失败</title>
</head>
<body>
<h1>操作失败</h1>
<a href="/drugdeal">返回主页</a>
<a href="${uri}">${opName}</a><br>
错误信息<br>
<div>${error}</div>
</body>
</html>
