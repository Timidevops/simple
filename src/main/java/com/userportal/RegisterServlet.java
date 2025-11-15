package com.userportal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password"); // Plain text for demo only

        try (Connection conn = DBUtil.getConnection()) {
            PreparedStatement stmt = conn.prepareStatement(
                "INSERT INTO users (username, email, password) VALUES (?, ?, ?)");
            stmt.setString(1, username);
            stmt.setString(2, email);
            stmt.setString(3, password);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            request.getSession().setAttribute("flash", "Registration failed: " + e.getMessage());
            response.sendRedirect("register.jsp");
            return;
        }

        request.getSession().setAttribute("user", username);
        response.sendRedirect("dashboard.jsp");
    }
}
