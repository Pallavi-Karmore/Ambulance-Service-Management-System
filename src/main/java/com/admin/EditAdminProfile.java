package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.connection.DatabaseConnection;

@WebServlet("/EditAdminProfile")
public class EditAdminProfile extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adminId = request.getParameter("aid");
        String password = request.getParameter("upass");
        String email = request.getParameter("email");

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DatabaseConnection.getConnection();
            String updateQuery = "UPDATE tbladmin SET upass = ?, email = ? WHERE id = ?";
            ps = conn.prepareStatement(updateQuery);
            ps.setString(1, password);
            ps.setString(2, email);
            ps.setString(3, adminId);

            int updated = ps.executeUpdate();
            HttpSession session = request.getSession();
            if (updated > 0) {
                session.setAttribute("profile-update", "success");
            } else {
                session.setAttribute("profile-update", "error");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("admin-profile.jsp");
    }
}
