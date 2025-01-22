package kz.bitlab.servlets;

import kz.bitlab.models.Comments;
import kz.bitlab.models.DBManager;
import kz.bitlab.models.News;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/viewDetails")
public class ViewDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.valueOf(req.getParameter("id"));
        System.out.println("id = " + id);
        News news = DBManager.getNewById(id);
        req.setAttribute("news", news);
        resp.setCharacterEncoding("UTF-8");
        ArrayList<Comments> comments = DBManager.getAllCommentsByNew(news);
        req.setAttribute("comments", comments);
        req.getRequestDispatcher("viewDetails.jsp").forward(req,resp);
    }
}
