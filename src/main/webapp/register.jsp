<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Register</title>
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

<div class="row g-0 rounded-4 overflow-hidden shadow-xl">
  <div class="col-lg-6 d-none d-lg-block bg-cover" style="background-image:url('assets/img/bg-login.svg');"></div>
  <div class="col-lg-6 p-4 p-lg-5 bg-dark-90">
    <h3 class="mb-1">Create your account</h3>
    <p class="text-secondary mb-4">Join the portal to access your dashboard</p>
    <form action="register" method="post" class="needs-validation" novalidate>
      <div class="mb-3">
        <label class="form-label">Username</label>
        <input type="text" class="form-control" name="username" required>
      </div>
      <div class="mb-3">
        <label class="form-label">Email</label>
        <input type="email" class="form-control" name="email" required>
      </div>
      <div class="mb-3">
        <label class="form-label">Password</label>
        <input type="password" class="form-control" name="password" required>
      </div>
      <button class="btn btn-primary w-100 py-2">Sign up</button>
    </form>
    <p class="text-secondary mt-3">Have an account? <a href="login.jsp">Sign in</a></p>
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
