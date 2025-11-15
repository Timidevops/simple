package com.userportal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        boolean success = false;

        try (Connection conn = DBUtil.getConnection()) {
            PreparedStatement stmt = conn.prepareStatement(
                "SELECT * FROM users WHERE username=? AND password=?");
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            success = rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (success) {
            request.getSession().setAttribute("user", username);
            response.sendRedirect("dashboard.jsp");
        } else {
            request.getSession().setAttribute("flash", "Invalid username or password");
            response.sendRedirect("login.jsp");
        }
    }
}
