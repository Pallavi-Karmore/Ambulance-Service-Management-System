package com.patient;

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

@WebServlet("/BookAmbulanceServlet")
public class BookAmbulanceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int patientId = Integer.parseInt(request.getParameter("patient_id"));
        String ambulanceId = request.getParameter("ambulance_id");
        String sourceCity = request.getParameter("source_city");
        String destinationCity = request.getParameter("destination_city");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DatabaseConnection.getConnection();
            String sql = "INSERT INTO ambulance_requests (patient_id, ambulance_id, source_city, destination_city) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, patientId);
            pstmt.setString(2, ambulanceId);
            pstmt.setString(3, sourceCity);
            pstmt.setString(4, destinationCity);
            pstmt.executeUpdate();

            response.sendRedirect("book-ambulance.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("bookingError.jsp");
        } 
    }
}
