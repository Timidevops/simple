package com.example.webapp;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");

        try (Connection con = DBUtil.getConnection()) {
            PreparedStatement ps = con.prepareStatement("INSERT INTO users(name, email) VALUES(?, ?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
            throw new ServletException(e);
        }
        resp.sendRedirect("user");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> users = new ArrayList<>();
        try (Connection con = DBUtil.getConnection()) {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT id, name, email FROM users");
            while (rs.next()) {
                users.add(new User(rs.getInt("id"), rs.getString("name"), rs.getString("email")));
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
        req.setAttribute("users", users);
        RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
        rd.forward(req, resp);
    }
}
