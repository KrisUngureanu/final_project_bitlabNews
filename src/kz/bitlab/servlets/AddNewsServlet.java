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

@WebServlet("/addNews")
public class AddNewsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<Category> categories = DBManager.getAllCategory();
        req.setAttribute("categories", categories);
        resp.setCharacterEncoding("UTF-8");
        req.getRequestDispatcher("addNews.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8"); // Устанавливаем кодировку для запроса
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        Long category = Long.valueOf(req.getParameter("category"));
        Category categoryObj = DBManager.getCategory(category);
        News news = new News();
        news.setTitle(title);
        news.setContent(content);
        news.setCategory(categoryObj);
        DBManager.addNews(news);
        resp.setCharacterEncoding("UTF-8");
        resp.sendRedirect("/admin");

    }
}
