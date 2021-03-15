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
import java.util.ArrayList;
import java.util.List;

@WebServlet(value = "/userBooks")
public class UserBorrowedBooksServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DBConnection dbConnection = new DBConnection();
        int userId = (Integer) request.getSession(false).getAttribute("userId");

        List<Book> books = new ArrayList<Book>();
        List<Integer> bookIds = dbConnection.getUserBooks(userId);
        for (Integer id:bookIds) {
            Book b=dbConnection.getBookById(id);
            books.add(b);
        }
        request.setAttribute("borrowedBooks", books);
        PrintWriter o=response.getWriter();
        o.println(books.toString());

        request.getRequestDispatcher("/reportBorrowedBooks.jsp").forward(request, response);
    }
}
