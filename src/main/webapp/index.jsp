<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Welcome</title>
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

<div class="row align-items-center g-4">
  <div class="col-lg-6">
    <h1 class="display-5 fw-bold text-gradient">Welcome to your DevOps User Portal</h1>
    <p class="lead text-secondary">Sign in to access your dashboard, manage your profile, and explore system insights.</p>
    <div class="d-flex gap-3">
      <a href="login.jsp" class="btn btn-primary btn-lg"><i class="fa-solid fa-right-to-bracket me-2"></i>Login</a>
      <a href="register.jsp" class="btn btn-outline-light btn-lg"><i class="fa-solid fa-user-plus me-2"></i>Register</a>
    </div>
  </div>
  <div class="col-lg-6">
    <div class="glass p-4 rounded-4 shadow-lg">
      <img src="assets/img/bg-dashboard.svg" class="img-fluid rounded-3" alt="dashboard preview">
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
