<!-- Навигационная панель -->
<%@page import="kz.bitlab.models.User" %>
<%
    User currentUser = (User) session.getAttribute("CURRENT_USER");
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="/homepage">Bitlab NEWS</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/homepage">Home</a>
                </li>
                <% if (currentUser == null) { %>
                <li class="nav-item">
                    <a class="nav-link" href="/login">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/signup">Sign Up</a>
                </li>
                <% } %>
                <% if (currentUser != null && currentUser.getRole_id() == 1) { %>
                <li class="nav-item">
                    <a class="nav-link" href="/admin">Admin Panel</a>
                </li>
                <% } %>
            </ul>
            <% if (currentUser != null) { %>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="/profile" id="profileDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <%=currentUser.getFullName()%>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="profileDropdown">
                        <li><a class="dropdown-item" href="/editUserInfo">Setting</a></li>
                        <li><a class="dropdown-item" href="/logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
            <% } %>
        </div>
    </div>
</nav>