<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="styles.css">
    <title>Main page</title>
</head>
<body>
<nav>
    <a href="allBooks.jsp">Library Books</a>
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

<h2>
    <%=session.getAttribute("username")%>'s main page
</h2>

</body>
</html>
