<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.bitlab.models.News" %>
<%@ page import="kz.bitlab.models.Comments" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="head.jsp"%>
</head>
<body>

<%@include file="navbar.jsp"%>
<%
    News news = (News) request.getAttribute("news");
%>
<%
    ArrayList<Comments> comments = (ArrayList<Comments>) request.getAttribute("comments");
%>
<!-- Основное содержимое -->
<main class="container my-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card mb-4">
                <div class="card-body">
                    <h3 class="card-title"><%= news.getTitle() %></h3>
                    <p class="card-text"><%= news.getContent() %></p>
                    <p class="text-muted">Published on: <%= news.getPostDate() %></p>
                </div>
            </div>
            <hr>

            <% if (currentUser != null) { %>
            <div class="card mb-4">
                <div class="card-body">
                    <h5 class="card-title">Add a Comment</h5>
                    <form action="/addNewComment" method="post">
                        <input type="hidden" name="idNews" value="<%= news.getId() %>">
                        <input type="hidden" name="idUser" value="<%= currentUser.getId() %>">
                        <div class="mb-3">
                            <textarea name="newComm" class="form-control" rows="4" placeholder="Write your comment here..." required></textarea>
                        </div>
                        <button type="submit" class="btn btn-success">Send</button>
                    </form>
                </div>
            </div>
            <% } %>

            <% if (comments != null && !comments.isEmpty()) { %>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Comments</h5>
                    <ul class="list-group list-group-flush">
                        <% for (Comments comment : comments) { %>
                        <li class="list-group-item">
                            <p class="fw-bold mb-1"><%= comment.getUser().getFullName() %></p>
                            <p class="text-muted mb-1">Posted on: <%= comment.getPost_date() %></p>
                            <p class="mb-0"><%= comment.getComment() %></p>
                            <%if (currentUser != null){%>
                                    <%if (comment.getUser().getId() == currentUser.getId()){ %>
                            <a href="/deleteComm?idComm=<%=comment.getId()%>&idNews=<%=news.getId()%>" class="text-danger text-decoration-none">Delete comment</a>

                                <%}}%>
                        </li>
                        <% } %>
                    </ul>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</main>
<%@include file="footer.jsp"%>
<%@include file="foot.jsp"%>
</body>
</html>