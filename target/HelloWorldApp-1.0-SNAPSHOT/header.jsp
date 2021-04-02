<%-- using Directive page --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav>
    <a href="index.jsp">Main</a>
    <a href="allBooks.jsp">Library Books</a>
    <%-- using Scriplet statement --%>
    <%-- using Implicit Object session--%>
    <%if(session.getAttribute("role").equals("admin")){%>
        <a href="listUsers">Users</a>
        <a href="borrowedBooksReport.jsp">Borrowed Books Report</a>
    <%}%>
    <%if(session.getAttribute("role").equals("user")){ %>
        <a href="userBooks?status=borrowed">Borrowed Books</a>
        <a href="userBooks?status=returned">Returned Books</a>
    <%}%>
    <a href="logout">Log out</a>
</nav>
