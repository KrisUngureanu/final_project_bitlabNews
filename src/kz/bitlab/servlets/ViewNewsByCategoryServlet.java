package kz.bitlab.servlets;

import kz.bitlab.models.Category;
import kz.bitlab.models.DBManager;
import kz.bitlab.models.News;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/viewNewsByCategory")
public class ViewNewsByCategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long idCat = Long.valueOf(req.getParameter("idCat"));
        Category category = DBManager.getCategory(idCat);
        ArrayList<News> news = DBManager.getNewsByCategory(category);
        req.setAttribute("news", news);
        resp.setCharacterEncoding("UTF-8");
        req.getRequestDispatcher("viewNewsByCategory.jsp").forward(req,resp);
    }
}
