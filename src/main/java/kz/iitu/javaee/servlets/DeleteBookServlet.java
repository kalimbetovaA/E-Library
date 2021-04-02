package kz.iitu.javaee.servlets;

import kz.iitu.javaee.Book;
import kz.iitu.javaee.DBConnection;
import kz.iitu.javaee.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/deleteBook")
public class DeleteBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DBConnection dbConnection = new DBConnection();

        int id=Integer.parseInt(request.getParameter("id"));
        Book book = dbConnection.getBookById(id);

        if(book !=null){
            int addedBook = dbConnection.deleteBook(id);

            if(addedBook!=0)
            {
                request.setAttribute("message", "Book "+book.getTitle()+" deleted!");
                request.getRequestDispatcher("allBooks.jsp").forward(request, response);
            }
        }
    }
}
