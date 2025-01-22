<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <%@include file="head.jsp"%>
</head>
<body>

<%@include file="navbar.jsp"%>

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
      <form action="/editUserInfo" method="post">
        <input type="hidden" name="idPerson" value="<%=currentUser.getId()%>">
        <label>Full name</label>
        <input type="text" class="form-control" name="full_name" value="<%=currentUser.getFullName()%>">
        <label>Password</label>
        <input type="password" class="form-control" name="fpass">
        <label>Confirm password</label>
        <input type="password" class="form-control" name="spass">

        <button type="submit" class="btn btn-success">Send</button>
      </form>
    </div>
  </div>
</main>
<%@include file="footer.jsp"%>
<%@include file="foot.jsp"%>
</body>
</html>