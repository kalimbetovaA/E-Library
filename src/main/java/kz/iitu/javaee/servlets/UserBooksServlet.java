package kz.iitu.javaee.servlets;

import kz.iitu.javaee.Book;
import kz.iitu.javaee.DBConnection;

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
public class UserBooksServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DBConnection dbConnection = new DBConnection();
        int userId = (Integer) request.getSession(false).getAttribute("userId");
        String status = request.getParameter("status");

        List<Book> books = new ArrayList<Book>();
        List<Integer> bookIds = dbConnection.getUserBooks(userId, status);
        for (Integer id:bookIds) {
            Book b=dbConnection.getBookById(id);
            books.add(b);
        }

        if(status.equals("borrowed")){
            request.setAttribute("borrowedBooks", books);
            request.getRequestDispatcher("/userBorrowed.jsp").forward(request, response);
        }else if(status.equals("returned")){
            request.setAttribute("returnedBooks", books);
            request.getRequestDispatcher("/userReturned.jsp").forward(request, response);
        }

    }
}
