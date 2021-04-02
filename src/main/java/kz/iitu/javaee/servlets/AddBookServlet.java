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
import java.io.PrintWriter;

@WebServlet(value = "/addBook")
public class AddBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DBConnection dbConnection = new DBConnection();

        Book book = new Book();
        book.setTitle(request.getParameter("title"));
        book.setDescription(request.getParameter("desc"));
        book.setGenre(request.getParameter("genre"));
        int addedBook = dbConnection.addBook(book);

        if(addedBook!=0)
        {
            request.setAttribute("message", "Book "+book.getTitle()+" added!");
            request.getRequestDispatcher("allBooks.jsp").forward(request, response);
        }
        else
        {
            request.setAttribute("errMessage", "Something went wrong. Book was not added!");
            request.getRequestDispatcher("/addBook.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
