<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.bitlab.models.News" %>
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
    ArrayList<News> news = (ArrayList<News>) request.getAttribute("news");
%>
<!-- Основное содержимое -->
<main class="container my-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <% if (news != null && !news.isEmpty()) { %>
            <div class="list-group">
                <% for (News item : news) { %>
                <div class="list-group-item mb-3">
                    <p class="mb-1"><a href="#" class="text-primary text-decoration-none"><%=item.getCategory().getName()%></a></p>
                    <h5 class="mb-1"><a href="/viewDetails?id=<%=item.getId()%>" class="text-primary text-decoration-none"><%=item.getTitle() %></a></h5>
                    <p class="mb-1"><%= item.getCountComms() %> comments</p>
                    <small class="text-muted">Published on: <%= item.getPostDate() %></small>
                </div>
                <% } %>
            </div>
            <% } else { %>
            <p class="text-center">No news available.</p>
            <% } %>
        </div>
    </div>
</main>
<%@include file="footer.jsp"%>
<%@include file="foot.jsp"%>
</body>
</html>