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
            <%
                String emailError = request.getParameter("passwordError");
                if(emailError!=null){
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                Incorrect password, try again!
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%
                }
            %>
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title text-center mb-4">Registration of new user</h3>
                    <form action="/signup" method="post">
                        <label>Email</label>
                        <input type="email" name="email" class="form-control">
                        <label>Full name</label>
                        <input type="text" class="form-control" name="full_name">
                        <label>Password</label>
                        <input type="password" class="form-control" name="fpass">
                        <label>Confirm password</label>
                        <input type="password" class="form-control" name="spass">
                        <br>
                        <button type="submit" class="btn btn-success">Sing Up</button>
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