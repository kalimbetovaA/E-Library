<%@ page import="java.util.List" %>
<%@ page import="kz.iitu.javaee.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- using ACTION TAG jsp:useBean--%>
<jsp:useBean id="dbConnection" class="kz.iitu.javaee.DBConnection" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="styles.css">
    <title>Books in Library</title>
</head>
<body>
<%-- using Directive include --%>
<%@ include file="header.jsp" %>

<%-- Show error message if it exists --%>
<p class="message"><%=(request.getAttribute("message") == null) ? "" : request.getAttribute("message")%></p>

<h2>Books in Library</h2>
<%
    if(session.getAttribute("role").equals("admin")){
%>
        <p><a href="addBook.jsp">Add Book</a></p>
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
</body>
</html>
