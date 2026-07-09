
package com.admin;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;
import com.connection.*;

@WebServlet("/UpdateAmbulanceStatusServlet")
public class UpdateAmbulanceStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ambulanceId = request.getParameter("ambulanceId");
        String status = request.getParameter("status");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DatabaseConnection.getConnection();
            String query = "UPDATE tblambulance SET status = ? WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, status);
            pstmt.setString(2, ambulanceId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
                // Handle the exception as needed
            }
        }

     
        response.sendRedirect("admin-view-ambulance.jsp?message=success");
    }
}
