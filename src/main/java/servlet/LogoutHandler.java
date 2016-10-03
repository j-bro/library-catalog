package servlet;

import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Optional;

import models.User;
import models.UserRepository;

/**
 * Created by jeremybrown on 2016-09-30.
 */
public class LogoutHandler extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        req.getSession().setAttribute("sessionUser", null);
        res.sendRedirect("login.jsp"); //error page
    }
}