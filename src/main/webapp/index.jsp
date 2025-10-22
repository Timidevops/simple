<%@ page import="java.util.List" %>
<%@ page import="com.example.webapp.User" %>
<html>
<head><title>Simple Web App</title></head>
<body>
<h2>Enter User</h2>
<form action="user" method="post">
    Name: <input type="text" name="name" required><br/>
    Email: <input type="email" name="email" required><br/>
    <button type="submit">Save</button>
</form>

<h2>Saved Users</h2>
<table border="1">
<tr><th>ID</th><th>Name</th><th>Email</th></tr>
<%
    List<User> users = (List<User>) request.getAttribute("users");
    if (users != null) {
        for (User u : users) {
%>
<tr>
    <td><%= u.getId() %></td>
    <td><%= u.getName() %></td>
    <td><%= u.getEmail() %></td>
</tr>
<%
        }
    }
%>
</table>
</body>
</html>
