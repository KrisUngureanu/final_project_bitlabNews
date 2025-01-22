package kz.bitlab.servlets;

import kz.bitlab.models.DBManager;
import kz.bitlab.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("login.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String redirect = "/login?emailerror";
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        User user = DBManager.getUser(email);
        if (user != null){
            redirect = "/login?passworderror";
            if(user.getPassword().equals(password)){
                redirect = "/profile";
                req.getSession().setAttribute("CURRENT_USER", user);
            }
        }
        resp.sendRedirect(redirect);
    }
}
