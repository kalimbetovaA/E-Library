<%@ page import="java.util.List" %>
<%@ page import="kz.iitu.javaee.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="styles.css">
    <title><%=session.getAttribute("username")%>'s borrowed books</title>
</head>
<body>
<%-- using Directive include --%>
<%@ include file="header.jsp" %>

<%-- using Implicit Object session--%>
<%-- using Implicit Object request--%>
<h2><%=session.getAttribute("username")%>'s borrowed books</h2>
<%
    List<Book> books = (ArrayList<Book>)request.getAttribute("borrowedBooks");
    if(books!=null){
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
