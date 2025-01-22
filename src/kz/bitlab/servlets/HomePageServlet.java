package kz.bitlab.servlets;

import kz.bitlab.models.DBManager;
import kz.bitlab.models.News;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/homepage")
public class HomePageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<News> news = DBManager.getAllNews();
        req.setAttribute("news", news);
        resp.setCharacterEncoding("UTF-8");
        req.getRequestDispatcher("home.jsp").forward(req,resp);

    }
}
