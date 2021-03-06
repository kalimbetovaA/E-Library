<%-- using Directive page --%>
<%@ page import="kz.iitu.javaee.models.Book" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- using ACTION TAG jsp:useBean--%>
<jsp:useBean id="dbConnection" class="kz.iitu.javaee.models.DBConnection" />

    <%-- using Scriplet statement --%>
    <%-- using Implicit Object request--%>
    <%
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        String bookTitle = request.getParameter("bookTitle");
        String bookGenre = request.getParameter("bookGenre");
    %>
    <div>
        <h3>
            <%-- using Scriplet expression --%>
            <%=bookTitle%>
        </h3>
        <p>
            <b>Genre:</b> <%=bookGenre%>
        </p>
        <p>
            <button><a href="bookDetail.jsp?id=<%=bookId%>">Book details</a></button>
        </p>
        <%-- using Implicit Object session--%>
        <%
            if(session.getAttribute("role").equals("admin")){
        %>
        <p>
            <button class="delete-btn"><a href="deleteBook?id=<%=bookId%>">Delete</a></button>
        </p>
        <%-- using Implicit Object session--%>
        <%
            }
            if(session.getAttribute("role").equals("user")){
                int userId = (int) session.getAttribute("userId");
                List<Integer> bookIds = dbConnection.getUserBooks(userId, "borrowed");
                if(!bookIds.contains(bookId)){
        %>
        <p>
            <button class="borrow-btn"><a href="borrowBook?id=<%=bookId%>">Borrow</a></button>
        </p>

        <%-- using Implicit Object out--%>
        <%
                }else{
                    out.print("<p><button class='return-btn'><a href='returnBook?id="+bookId+"'>Return</a></button></p>");
                }
            }
        %>
    </div>
