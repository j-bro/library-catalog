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
public class AuthHandler extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        String username = req.getParameter("user");
        String password = req.getParameter("pass");

        Optional<User> userOptional = UserRepository.getValidUser(username, password);
        if (userOptional.isPresent()) {
            User user = userOptional.get();
            // Login allowed
            req.getSession().setAttribute("sessionUser", user);
            res.sendRedirect("catalog/search.jsp");
        }
        else {
            // Login denied
            res.sendRedirect("login.jsp"); //error page
        }
    }
}