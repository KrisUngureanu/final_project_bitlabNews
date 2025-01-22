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
  ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
%>
<!-- Основное содержимое -->
<main class="container my-5">
  <div class="row justify-content-center">
    <div class="col-md-8">
        <h3>Add news</h3>
      <form action="/addNews" method="post">
        <label>Title</label>
        <input type="text" name="title" class="form-control" placeholder="Title">

        <label>Content</label>
        <textarea name="content" class="form-control" placeholder="Content"></textarea>

        <label>Category</label>
        <select name="category" class="form-control">
          <%
              for (Category category: categories){
          %>
          <option value="<%=category.getId()%>"><%=category.getName()%></option>
          <%}%>
        </select>
        <br>
        <button type="submit" class="btn btn-success">Create</button>
      </form>
    </div>
  </div>
  </div>
</main>
<%@include file="footer.jsp"%>
<%@include file="foot.jsp"%>
</body>
</html>