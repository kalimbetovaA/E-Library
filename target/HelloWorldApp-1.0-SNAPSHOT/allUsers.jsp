<%@ page import="java.util.List" %>
<%@ page import="kz.iitu.javaee.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.iitu.javaee.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="styles.css">
    <title>Users in the System</title>
</head>
<body>
<%-- using Directive include --%>
<%@ include file="header.jsp" %>

<h2>Users in the System</h2>
<%
    List<User> users = (ArrayList<User>)request.getAttribute("users");
    if(users!=null){
        for(User user : users){
%>
<div>
    <h3>
        <%=user.getFullname()%>
    </h3>
    <p>
        Username: <%=user.getUsername()%>
    </p>
    <p>
        Email: <%=user.getEmail()%>
    </p>
    <p>
        Role: <%=user.getRole()%>
    </p>
</div>
    <%
            }
        }
    %>
</body>
</html>
