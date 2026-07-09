package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.DatabaseConnection;

@WebServlet("/DeleteFeedbackServlet")
public class DeleteFeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String feedbackId = request.getParameter("feedback_id");

        if (feedbackId != null && !feedbackId.isEmpty()) {
            try (Connection conn = DatabaseConnection.getConnection()) {
                String sql = "DELETE FROM tblfeedback WHERE id = ?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, feedbackId);
                    int rowsAffected = stmt.executeUpdate();

                    if (rowsAffected > 0) {
                        response.sendRedirect("admin-view-patients-complaint-feedback.jsp?message=success");
                    } else {
                        response.sendRedirect("admin-view-patients-complaint-feedback.jsp?message=error");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("admin-view-patients-complaint-feedback.jsp?message=error");
            }
        } else {
            response.sendRedirect("admin-view-patients-complaint-feedback.jsp?message=error");
        }
    }
}
