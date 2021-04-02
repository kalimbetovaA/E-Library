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
import java.util.List;

@WebServlet(value = "/listUsers")
public class ListAllUsersServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        DBConnection dbConnection = new DBConnection();

        List<User> users = dbConnection.getUsers();
        request.setAttribute("users", users);
        request.getRequestDispatcher("/allUsers.jsp").forward(request, response);
    }
}
