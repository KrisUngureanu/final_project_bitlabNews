<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <%@include file="head.jsp"%>
</head>
<body>

<%@include file="navbar.jsp"%>

<!-- Основное содержимое -->
<main class="container my-5">
  <div class="row justify-content-center">
    <div class="col-md-8 text-center">
      <div class="card">
        <div class="card-body">
          <h1 class="card-title mb-4"><%= currentUser.getFullName() %></h1>
          <a href="/editUserInfo" class="btn btn-primary">Edit Profile</a>
        </div>
      </div>
    </div>
  </div>
</main>
<%@include file="footer.jsp"%>
<%@include file="foot.jsp"%>
</body>
</html>