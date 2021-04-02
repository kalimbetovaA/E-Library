<%-- using Directive page --%>
<%@ page import="java.util.List" %>
<%@ page import="kz.iitu.javaee.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- using ACTION TAG jsp:useBean--%>
<jsp:useBean id="dbConnection" class="kz.iitu.javaee.DBConnection" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>

<%-- using Scriplet statement --%>
<%-- using Implicit Object request--%>
<%
    int bookId = Integer.parseInt(request.getParameter("id"));
    Book book = dbConnection.getBookById(bookId);
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="styles.css">
    <%-- using Scriplet expression --%>
    <title><%=book.getTitle()%></title>
</head>
<body>

<%-- using Directive include --%>
<%@ include file="header.jsp" %>
<div>
    <h3>
        <%=book.getTitle()%>
    </h3>
    <p>
        <b>Description:</b> <%=book.getDescription()%>
    </p>
    <p>
        <b>Genre:</b> <%=book.getGenre()%>
    </p>
    <%-- using Implicit Object session--%>
    <%
        if(session.getAttribute("role").equals("admin")){
    %>
    <p>
        <button><a href="deleteBook?id=<%=book.getBookId()%>">Delete</a></button>
    </p>
    <%
        }
    %>
    <%-- using Implicit Object session--%>
    <%
        if(session.getAttribute("role").equals("user")){
            int userId = (int) session.getAttribute("userId");
            List<Integer> bookIds = dbConnection.getUserBooks(userId, "borrowed");
            if(!bookIds.contains(book.getBookId())){
    %>
                <p>
                    <a href="borrowBook?id=<%=book.getBookId()%>">Borrow</a>
                </p>
    <%-- using Implicit Object out--%>
    <%
            }else{
                out.print("<p><a href='returnBook?id="+book.getBookId()+"'>Return</a></p>");
            }
        }
    %>
</div>
</body>
</html>
