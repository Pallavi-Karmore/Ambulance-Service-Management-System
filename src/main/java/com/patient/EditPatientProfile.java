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
 * Servlet implementation class EditPatientProfile
 */
@WebServlet("/EditPatientProfile")
public class EditPatientProfile extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fname=request.getParameter("fname");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String address=request.getParameter("address");
		HttpSession session=request.getSession();
		try {
			int editProfile=DatabaseConnection.insertUpdateFromSqlQuery("update tblpatient set patient_name='"+fname+"',patient_email='"+email+"',Patient_mobile='"+mobile+"',patient_address='"+address+"' where uname='"+session.getAttribute("uname")+"' and patient_id='"+session.getAttribute("pid")+"'");
			if(editProfile>0) {
				String message="Profile updated successfully.";
				session.setAttribute("profile-update", message);
				response.sendRedirect("user-profile.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
