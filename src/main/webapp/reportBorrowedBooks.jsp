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
<nav>
    <a href="index.jsp">Main</a>
    <a href="allBooks.jsp">Library Books</a>
    <%
        if(session.getAttribute("role").equals("admin")){
    %>
    <a href="listUsers">Users</a>
    <%
        }
    %>
    <a href="logout">Log out</a>
</nav>

<h2><%=session.getAttribute("username")%>'s borrowed books</h2>
<%
    List<Book> books = (ArrayList<Book>)request.getAttribute("borrowedBooks");
    if(books!=null){
        for(Book book : books){
%>
<div>
    <h3>
        <%=book.getTitle()%>
    </h3>
    <p>
        Description: <%=book.getDescription()%>
    </p>
    <p>
        Genre: <%=book.getGenre()%>
    </p>
</div>
    <%
            }
        }
    %>
</body>
</html>
