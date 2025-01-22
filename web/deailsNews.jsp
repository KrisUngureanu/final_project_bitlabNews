<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.bitlab.models.News" %>
<%@ page import="kz.bitlab.models.Category" %>
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
    ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
%>
<!-- Основное содержимое -->
<main class="container my-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title text-center mb-4">Edit News</h3>
                    <form action="/editNews" method="post">
                        <input type="hidden" name="idNews" value="<%=news.getId()%>">
                        <div class="mb-3">
                            <label for="title" class="form-label">Title</label>
                            <input type="text" name="title" id="title" class="form-control" placeholder="Title" value="<%= news.getTitle() %>" required>
                        </div>

                        <div class="mb-3">
                            <label for="content" class="form-label">Content</label>
                            <textarea name="content" id="content" class="form-control" rows="5" placeholder="Content" required><%= news.getContent() %></textarea>
                        </div>

                        <div class="mb-3">
                            <label for="category" class="form-label">Category</label>
                            <select name="category" id="category" class="form-select" required>
                                <% for (Category category : categories) { %>
                                <option value="<%= category.getId() %>" <%= news.getCategory().getId() == category.getId() ? "selected" : "" %>>
                                    <%= category.getName() %>
                                </option>
                                <% } %>
                            </select>
                        </div>

                        <div class="d-flex justify-content-between">
                            <button type="submit" class="btn btn-success">Save Changes</button>
                            <a href="/deleteNews?idNews=<%= news.getId() %>" class="btn btn-danger">Delete</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>
<%@include file="footer.jsp"%>
<%@include file="foot.jsp"%>
</body>
</html>