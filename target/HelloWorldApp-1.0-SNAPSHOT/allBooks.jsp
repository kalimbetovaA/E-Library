<%@ page import="java.util.List" %>
<%@ page import="kz.iitu.javaee.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.iitu.javaee.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="styles.css">
    <title>Books in Library</title>
</head>
<body>
<nav>
    <a href="index.jsp">Main</a>
    <%
        if(session.getAttribute("role").equals("admin")){
    %>
    <a href="listUsers">Users</a>
    <%
        }
    %>
    <%
        if(session.getAttribute("role").equals("user")){
    %>
    <a href="userBooks">Borrowed Books</a>
    <%
        }
    %>
    <a href="logout">Log out</a>
</nav>
<p class="message"><%=(request.getAttribute("message") == null) ? ""
        : request.getAttribute("message")%></p>
<h2>Books in Library</h2>
<%
    if(session.getAttribute("role").equals("admin")){
%>
<p><a href="addBook.jsp">Add Book</a></p>
<%
    }
    DBConnection dbConnection = new DBConnection();
    List<Book> books = dbConnection.getBooks();
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
    <%
            if(session.getAttribute("role").equals("admin")){
    %>
    <p>
        <a href="deleteBook?id=<%=book.getBookId()%>">Delete</a>
    </p>
    <%
            }
    %>
    <%
        if(session.getAttribute("role").equals("user")){
    %>
    <p>
        <a href="borrowBook?id=<%=book.getBookId()%>">Borrow</a>
    </p>
    <%
        }
    %>
</div>
    <%
            }
        }
    %>
</body>
</html>
