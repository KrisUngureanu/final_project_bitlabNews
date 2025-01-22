<%@ page import="kz.bitlab.models.News" %>
<%@ page import="java.util.ArrayList" %>
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
        <div class="col-md-10">
            <div class="mb-3">
                <a href="/addNews" class="btn btn-primary">Create New</a>
            </div>
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Title</th>
                    <th scope="col">Category</th>
                    <th scope="col">Publish Date</th>
                    <th scope="col">Details</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for (News news1 : news) {
                %>
                <tr>
                    <th scope="row"><%= news1.getId() %></th>
                    <td><%= news1.getTitle() %></td>
                    <td><%= news1.getCategory().getName() %></td>
                    <td><%= news1.getPostDate() %></td>
                    <td><a href="/detailsNews?id=<%=news1.getId()%>" class="btn btn-sm btn-info">Details</a></td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</main>
<%@include file="footer.jsp"%>
<%@include file="foot.jsp"%>
</body>
</html>