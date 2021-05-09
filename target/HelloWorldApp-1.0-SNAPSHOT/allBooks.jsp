<%@ page import="java.util.List" %>
<%@ page import="kz.iitu.javaee.models.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- using ACTION TAG jsp:useBean--%>
<jsp:useBean id="dbConnection" class="kz.iitu.javaee.models.DBConnection" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="style.css">
    <title>Books in Library</title>
</head>
<body>
<%-- using Directive include --%>
<%@ include file="header.jsp" %>

<div id="main">
    <%-- Show error message if it exists --%>
    <%
        if(request.getAttribute("message") != null){
    %>
        <p class="message"><%=request.getAttribute("message")%></p>
        <%}%>

    <h2>Books in Library</h2>
<%
    if(session.getAttribute("role").equals("admin")){
%>
        <p><button class="add-btn"><a href="addBook.jsp">Add Book</a></button></p>
<%}

    List<Book> books = dbConnection.getBooks();
    if(dbConnection.getBooks()!=null){
        for(Book book : books){
%>
    <%-- using ACTION TAG jsp:include--%>
    <%-- using ACTION TAG jsp:param--%>
    <jsp:include page="book.jsp" >
        <jsp:param name="bookId" value="<%=book.getBookId()%>" />
        <jsp:param name="bookTitle" value="<%=book.getTitle()%>" />
        <jsp:param name="bookGenre" value="<%=book.getGenre()%>" />
    </jsp:include>
<%
            }
        }
%>
</div>
</body>
</html>
