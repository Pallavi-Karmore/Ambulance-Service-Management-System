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
import com.connection.DatabaseConnection;

@WebServlet("/DeletePatientServlet")
public class DeletePatientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String patientId = request.getParameter("patient_id");

        if (patientId != null && !patientId.isEmpty()) {
            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                conn = DatabaseConnection.getConnection();
                String sql = "DELETE FROM tblpatient WHERE patient_id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, patientId);

                int rowsAffected = pstmt.executeUpdate();
                if (rowsAffected > 0) {
                    response.sendRedirect("admin-view-patient.jsp?message=Record deleted successfully");
                } else {
                    response.sendRedirect("admin-view-patient.jsp?message=Error: Record not found or could not be deleted");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("admin-view-patient.jsp?message=Error: An error occurred while deleting the record");
            } finally {
                try {
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } else {
            response.sendRedirect("viewAmbulance.jsp?message=Error: Invalid patient ID");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
