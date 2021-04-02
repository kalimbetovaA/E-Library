<%-- using Directive page --%>
<%@ page import="kz.iitu.javaee.DBConnection" %>
<%@ page import="kz.iitu.javaee.Book" %>
<%@ page import="kz.iitu.javaee.UserAndBooks" %>
<%@ page import="kz.iitu.javaee.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- using ACTION TAG jsp:useBean--%>
<jsp:useBean id="dbConnection" class="kz.iitu.javaee.DBConnection" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="styles.css">
    <title>Borrowed Books Report</title>
</head>
<body>
<%-- using Scriplet declaration --%>
<%!
    User user;
    Book book;
%>
<%-- using Directive include --%>
<%@ include file="header.jsp" %>

<h2>Borrowed Books Report</h2>
<table width="60%">
    <tr>
        <th>User Full Name</th>
        <th>Username</th>
        <th>Book ID</th>
        <th>Book Title</th>
        <th>Borrow Status</th>
        <th>Info</th>
    </tr>
    <%-- using Scriplet statement --%>
    <%
        for(UserAndBooks userAndBook : dbConnection.getAllUsersBooks("borrowed")){
            user = dbConnection.getUserById(userAndBook.getUserId());
            book = dbConnection.getBookById(userAndBook.getBookId());
    %>
        <tr>
            <%-- using Scriplet expression --%>
            <td><%=user.getFullname()%></td>
            <td><%=user.getUsername()%></td>
            <td><%=book.getBookId()%></td>
            <td><%=book.getTitle()%></td>
            <td><%=userAndBook.getStatus()%></td>
            <td><a href="bookDetail.jsp?id=<%=book.getBookId()%>">Book details</a></td>
        </tr>
    <%
        }
    %>
</table>
</body>
</html>
