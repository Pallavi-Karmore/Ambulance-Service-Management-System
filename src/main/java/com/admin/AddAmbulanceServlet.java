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

@WebServlet("/AddAmbulanceServlet")
public class AddAmbulanceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String vehicleNo = request.getParameter("vehicleNo");
        String type = request.getParameter("ambulanceType");
        String driverName = request.getParameter("dname");
        String driverMobile = request.getParameter("mobile");
        String driverLicense = request.getParameter("licenseNo");
        String state = request.getParameter("state");
        String city = request.getParameter("city");
        String status = "Available";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Establish database connection
            conn = DatabaseConnection.getConnection();
            String sql = "INSERT INTO tblambulance (ambulance_vehicle_no, ambulance_type, driver_name, driver_mobile, driver_lincense_no, state, city, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);

            // Set parameters for the prepared statement
            pstmt.setString(1, vehicleNo);
            pstmt.setString(2, type);
            pstmt.setString(3, driverName);
            pstmt.setString(4, driverMobile);
            pstmt.setString(5, driverLicense);
            pstmt.setString(6, state);
            pstmt.setString(7, city);
            pstmt.setString(8, status);

            // Execute the update
            pstmt.executeUpdate();

            // Set success message
            request.setAttribute("message", "Ambulance added successfully!");
            request.setAttribute("messageType", "success");
        } catch (SQLException e) {
            // Handle SQL exception
            e.printStackTrace();
            request.setAttribute("message", "Error adding ambulance. Please try again.");
            request.setAttribute("messageType", "error");
        } finally {
            try {
                // Close resources
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Forward the request to the JSP page
        request.getRequestDispatcher("addAmbulance.jsp").forward(request, response);
    }
}
