<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="styles.css">
    <title>Add Book</title>
</head>
<body>
<%-- using Directive include --%>
<%@ include file="header.jsp" %>
<form action="addBook" method="POST">
    <%-- using Implicit Object request--%>
    <p> <%=(request.getAttribute("errMessage") == null) ? "": request.getAttribute("errMessage")%></p>
    <h2>Enter new Book Info</h2>
    <label>Title:</label><br>
    <input type="text" name="title"><br><br>
    <label>Description: </label><br>
    <input type="desc" name="desc"><br><br>
    <label>Genre: </label><br>
    <input type="text" name="genre"><br><br>
    <button>Add Book</button>
</form>
</body>
</html>
