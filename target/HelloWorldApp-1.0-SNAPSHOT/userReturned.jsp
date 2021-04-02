<%-- using Directive page --%>
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
    <title><%=session.getAttribute("username")%>'s returned books</title>
</head>
<body>
<%-- using Directive include --%>
<%@ include file="header.jsp" %>

<h2><%=session.getAttribute("username")%>'s returned books</h2>
<%
    List<Book> books = (ArrayList<Book>)request.getAttribute("returnedBooks");
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

<%-- using Implicit Object out--%>
<%
            }
        }
    else{
        out.print("<h3>You don't have any returned books yet</h3>");
            }
    %>
</body>
</html>
