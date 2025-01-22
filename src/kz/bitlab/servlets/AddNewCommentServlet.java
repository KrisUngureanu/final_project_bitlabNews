package kz.bitlab.servlets;

import kz.bitlab.models.Comments;
import kz.bitlab.models.DBManager;
import kz.bitlab.models.News;
import kz.bitlab.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addNewComment")
public class AddNewCommentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String comm = req.getParameter("newComm");
        Long newsId = Long.valueOf(req.getParameter("idNews"));
        Long userid = Long.valueOf(req.getParameter("idUser"));
        User user = DBManager.getUserById(userid);
        News news = DBManager.getNewById(newsId);
        Comments comment = new Comments();
        comment.setComment(comm);
        comment.setNews(news);
        comment.setUser(user);
        DBManager.addNewComment(comment);
        DBManager.updateComs(news);
        resp.setCharacterEncoding("UTF-8");
        resp.sendRedirect("/viewDetails?id=" + newsId);
    }
}
