package com.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.connection.DatabaseConnection;

@WebServlet("/ApproveAmbulance")
public class ApproveAmbulance extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String id = request.getParameter("id");
	    String status = request.getParameter("status"); // Get the updated status

	    try {
	        int updateStatus = DatabaseConnection.insertUpdateFromSqlQuery("update tblambulance set status=? where id=?", status, id);
	        if (updateStatus > 0) {
	            request.setAttribute("message", "success"); // Set success message
	        } else {
	            request.setAttribute("message", "error"); // Set error message
	        }
	        // Forward the request to the JSP page
	        request.getRequestDispatcher("admin-view-ambulance.jsp").forward(request, response);
	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("message", "error"); // Set error message
	        // Forward the request to the JSP page
	        request.getRequestDispatcher("admin-view-ambulance.jsp").forward(request, response);
	    }
	}
}