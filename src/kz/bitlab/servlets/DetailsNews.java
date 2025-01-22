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

@WebServlet("/detailsNews")
public class DetailsNews extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.valueOf(req.getParameter("id"));
        News news = DBManager.getNewById(id);
        if (news!= null){
            req.setAttribute("news", news);
        }
        ArrayList<Category> categories = DBManager.getAllCategory();
        req.setAttribute("categories", categories);
        resp.setCharacterEncoding("UTF-8");
        req.getRequestDispatcher("deailsNews.jsp").forward(req,resp);
    }
}
