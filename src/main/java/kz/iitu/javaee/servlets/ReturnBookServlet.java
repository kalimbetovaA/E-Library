package kz.iitu.javaee.servlets;

import kz.iitu.javaee.Book;
import kz.iitu.javaee.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/returnBook")
public class ReturnBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DBConnection dbConnection = new DBConnection();

        int bookId=Integer.parseInt(request.getParameter("id"));
        Book book = dbConnection.getBookById(bookId);

        if(book !=null){
            int userId = (Integer) request.getSession(false).getAttribute("userId");
            int returned = dbConnection.returnBook(userId, book);

            if(returned!=0)
            {
                request.setAttribute("message", "Book "+book.getTitle()+" returned successfully!");
                request.getRequestDispatcher("allBooks.jsp").forward(request, response);
            }
        }
    }
}
