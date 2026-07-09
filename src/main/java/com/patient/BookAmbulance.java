package com.patient;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class BookAmbulance
 */
@WebServlet("/BookAmbulance")
public class BookAmbulance extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
    	  String bookingId = request.getParameter("bookingId");
        String pdisease = request.getParameter("pdisease");
        String avn = request.getParameter("vehicleNo");
        String scity = request.getParameter("scity");
        String dcity = request.getParameter("dcity");
        String ambulance_status = "Pending";
        
        // Debugging: Print parameters to console
        System.out.println("Parameters: pdisease=" + pdisease + ", avn=" + avn + ", scity=" + scity + ", dcity=" + dcity);

        // Retrieve session attributes
        HttpSession session = request.getSession();
        String patientId = (String) session.getAttribute("pid");
        String username = (String) session.getAttribute("uname");

        // Debugging: Print session attributes to console
        System.out.println("Session attributes: patientId=" + patientId + ", username=" + username);

        // Check if session is valid
        if (patientId == null || username == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if session is invalid
            return;
        }

        try {
            // Prepare SQL query
            String sql = "UPDATE tblpatient SET  booking_id=?, patient_disease=?, avn=?, source_city=?, destination_city=?, ambulance_status=? WHERE patient_id=? AND uname=?";
            
            // Debugging: Print SQL statement and parameters to console
            System.out.println("Executing SQL: " + sql);
            System.out.println("Parameters: " + pdisease + ", " + avn + ", " + scity + ", " + dcity + ", " + ambulance_status + ", " + patientId + ", " + username);
            
            // Execute SQL query
            int bookAmbulance = DatabaseConnection.insertUpdateFromSqlQuery(sql, bookingId,pdisease, avn, scity, dcity, ambulance_status, patientId, username);

            // Handle response based on execution result
            if (bookAmbulance > 0) {
                String message = "Ambulance booking successfully.";
                session.setAttribute("book-ambulance", message);
                response.sendRedirect("search-ambulance.jsp");
            } else {
                String message = "Failed to book ambulance.";
                session.setAttribute("book-ambulance-error", message);
                response.sendRedirect("book-ambulance.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            String message = "An error occurred while booking the ambulance.";
            session.setAttribute("book-ambulance-error", message);
            response.sendRedirect("book-ambulance.jsp");
        }
    }
}
