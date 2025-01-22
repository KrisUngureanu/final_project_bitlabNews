package kz.bitlab.servlets;

import kz.bitlab.models.DBManager;
import kz.bitlab.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("signup.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String redirect = "/signup?passwordError";
        String pass1 = req.getParameter("fpass");
        String email = req.getParameter("email");
        String pass2 = req.getParameter("spass");
        String fullName = req.getParameter("full_name");
        if (pass1.equals(pass2)){
            User user = new User();
            user.setPassword(pass1);
            user.setFullName(fullName);
            user.setEmail(email);
            user.setRole_id(2);
            DBManager.createUser(user);
            User userCurr = DBManager.getUser(email);
            req.getSession().setAttribute("CURRENT_USER", userCurr);
            redirect = "/profile";
        }
        resp.sendRedirect(redirect);
    }
}
