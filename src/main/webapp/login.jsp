<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Login</title>
  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Icons -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <!-- Custom -->
  <link href="assets/css/style.css" rel="stylesheet">
</head>
<body class="bg-gradient">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark-90 shadow-sm">
  <div class="container">
    <a class="navbar-brand d-flex align-items-center" href="index.jsp">
      <img src="assets/img/logo.svg" width="28" height="28" class="me-2" alt="logo"/>
      DevOps Portal
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#nav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div id="nav" class="collapse navbar-collapse">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="login.jsp"><i class="fa-solid fa-right-to-bracket me-1"></i>Login</a></li>
        <li class="nav-item"><a class="nav-link" href="register.jsp"><i class="fa-solid fa-user-plus me-1"></i>Register</a></li>
      </ul>
    </div>
  </div>
</nav>
<div class="container py-4">

<%
  String flash = (String) session.getAttribute("flash");
  if (flash != null) { %>
    <div class="alert alert-warning alert-dismissible fade show" role="alert">
      <%= flash %>
      <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
<%  session.removeAttribute("flash"); } %>

<div class="row justify-content-center align-items-center min-vh-60">
  <div class="col-md-6 col-lg-5">
    <div class="card card-glass border-0 shadow-xl">
      <div class="card-body p-4 p-lg-5">
        <div class="text-center mb-4">
          <img src="assets/img/logo.svg" width="40" class="mb-2"/>
          <h3 class="mb-1">Welcome back</h3>
          <p class="text-secondary mb-0">Sign in to continue</p>
        </div>
        <form action="login" method="post" class="needs-validation" novalidate>
          <div class="mb-3">
            <label class="form-label">Username</label>
            <div class="input-group">
              <span class="input-group-text"><i class="fa-solid fa-user"></i></span>
              <input type="text" class="form-control" name="username" required>
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label">Password</label>
            <div class="input-group">
              <span class="input-group-text"><i class="fa-solid fa-lock"></i></span>
              <input type="password" class="form-control" name="password" required>
            </div>
          </div>
          <button class="btn btn-primary w-100 py-2">Login</button>
        </form>
        <p class="text-center text-secondary mt-3">No account? <a href="register.jsp">Create one</a></p>
      </div>
    </div>
  </div>
</div>

</div>
<footer class="footer mt-auto py-4 border-top border-secondary-subtle">
  <div class="container text-center text-secondary">
    <small>© <span id="y"></span> DevOps User Portal</small>
  </div>
</footer>
<script>document.getElementById('y').innerText = new Date().getFullYear();</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>
