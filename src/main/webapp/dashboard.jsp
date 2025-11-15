<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Dashboard</title>
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
  String user = (String) session.getAttribute("user");
  if (user == null) { response.sendRedirect("login.jsp"); return; }
%>

<div class="d-flex align-items-center justify-content-between mb-4">
  <div>
    <h2 class="mb-1">Welcome, <span class="text-gradient"><%= user %></span></h2>
    <p class="text-secondary mb-0">Here are your quick stats and recent activity</p>
  </div>
  <div class="d-flex gap-2">
    <a href="login.jsp" class="btn btn-outline-light">Logout</a>
  </div>
</div>

<div class="row g-4">
  <div class="col-md-4">
    <div class="card kpi">
      <div class="card-body">
        <div class="d-flex justify-content-between align-items-center">
          <div>
            <div class="text-secondary small">Users</div>
            <div class="display-6 fw-bold">1,248</div>
          </div>
          <i class="fa-solid fa-users fa-2xl text-primary"></i>
        </div>
      </div>
    </div>
  </div>
  <div class="col-md-4">
    <div class="card kpi">
      <div class="card-body">
        <div class="d-flex justify-content-between align-items-center">
          <div>
            <div class="text-secondary small">Messages</div>
            <div class="display-6 fw-bold">87</div>
          </div>
          <i class="fa-solid fa-envelope fa-2xl text-primary"></i>
        </div>
      </div>
    </div>
  </div>
  <div class="col-md-4">
    <div class="card kpi">
      <div class="card-body">
        <div class="d-flex justify-content-between align-items-center">
          <div>
            <div class="text-secondary small">Notifications</div>
            <div class="display-6 fw-bold">12</div>
          </div>
          <i class="fa-solid fa-bell fa-2xl text-primary"></i>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="card mt-4 card-glass">
  <div class="card-header border-0 d-flex align-items-center justify-content-between">
    <h5 class="mb-0">Activity Overview</h5>
    <span class="badge bg-primary-subtle text-primary">Demo</span>
  </div>
  <div class="card-body">
    <div id="chart-placeholder" class="ratio ratio-21x9 bg-dark-80 rounded-3 d-flex align-items-center justify-content-center">
      <div class="text-secondary text-center">
        <i class="fa-solid fa-chart-line fa-2xl mb-2"></i>
        <div>Chart placeholder — wire to data or Chart.js later</div>
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
