package kz.iitu.javaee.servlets;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "SessionValidationFilter")
public class SessionValidationFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        String path = ((HttpServletRequest) req).getRequestURI();
        if("/login.jsp".equals(path) || "/registration.jsp".equals(path) || "/login".equals(path) || "/registration".equals(path)) {
            chain.doFilter(req, resp);
            return;
        }

        String username=null;
        HttpSession session = ((HttpServletRequest) req).getSession(false);
        if (session != null) {
            username = (String) session.getAttribute("username");
        }

        if(username==null){
            ((HttpServletResponse) resp).sendRedirect("login.jsp");
        }else{
            chain.doFilter(req, resp);
        }

    }

    public void init(FilterConfig config) throws ServletException {

    }

}
