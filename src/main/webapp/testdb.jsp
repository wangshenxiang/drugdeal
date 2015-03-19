<%@ page import="me.wsx.drugdeal.web.utils.ApplicationContextUtil" %>
<%@ page import="me.wsx.drugdeal.persist.dao.DaoImp" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="me.wsx.drugdeal.persist.model.Drug" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
    ApplicationContext ctx = ApplicationContextUtil.getContext();
    DaoImp dao = (DaoImp) ctx.getBean("daoImp");

    Drug drug = new Drug();
    drug.setName("test");
    drug.setNumbers(10);
    drug.setMemo("test memo");
    drug.setPrice(5.50f);
    drug.setProduct("xiyao");
    drug.setSpec("3");
    drug.setSuoxie("T");

    dao.insertDrug(drug);
%>
</body>
</html>
