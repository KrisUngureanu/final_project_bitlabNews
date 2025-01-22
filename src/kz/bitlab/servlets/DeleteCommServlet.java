package kz.bitlab.servlets;

import kz.bitlab.models.DBManager;
import kz.bitlab.models.News;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteComm")
public class DeleteCommServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long idComm = Long.valueOf(req.getParameter("idComm"));
        DBManager.deleteComm(idComm);
        Long idNews = Long.valueOf(req.getParameter("idNews"));
        News news = DBManager.getNewById(idNews);
        DBManager.updateComs(news);
        resp.setCharacterEncoding("UTF-8");
        resp.sendRedirect("/viewDetails?id=" + idNews);
    }
}
