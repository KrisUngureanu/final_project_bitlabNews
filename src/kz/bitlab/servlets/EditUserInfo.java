package kz.bitlab.servlets;

import kz.bitlab.models.DBManager;
import kz.bitlab.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/editUserInfo")
public class EditUserInfo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("editProfile.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String redirect = "/editUserInfo?passwordError";
        String pass1 = req.getParameter("fpass");
        String pass2 = req.getParameter("spass");
        Long id = Long.valueOf(req.getParameter("idPerson"));
        String fullName = req.getParameter("full_name");
        if (pass1.equals(pass2)){
            User user = new User();
            user.setId(id);
            user.setPassword(pass1);
            user.setFullName(fullName);
            DBManager.updateUser(user);
            redirect = "/profile";
        }
        resp.sendRedirect(redirect);
    }
}
