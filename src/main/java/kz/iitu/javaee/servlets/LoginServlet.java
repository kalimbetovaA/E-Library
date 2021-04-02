package kz.iitu.javaee.servlets;


import kz.iitu.javaee.User;
import kz.iitu.javaee.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(value = "/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DBConnection dbConnection = new DBConnection();

        User user = dbConnection.getUser(request.getParameter("username"), request.getParameter("password"));

        if(user !=null){
            HttpSession oldSession = request.getSession(false);
            if (oldSession != null) {
                oldSession.invalidate();
            }
            HttpSession newSession = request.getSession(true);

            newSession.setMaxInactiveInterval(30*60);

            newSession.setAttribute("userId", user.getUserId());
            newSession.setAttribute("username", user.getUsername());
            newSession.setAttribute("role", user.getRole());
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
