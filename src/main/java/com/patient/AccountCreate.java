package com.patient;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;


@WebServlet("/AccountCreate")
public class AccountCreate extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String patientId=request.getParameter("patientId");
		String pname = request.getParameter("patientName");
		String pemail = request.getParameter("emailId");
		String pmobile = request.getParameter("mobile");
		String paddress = request.getParameter("address");
		String uname = request.getParameter("uname");
		String upass = request.getParameter("upass");
		HttpSession hs = request.getSession();
		
		try {
			int patientAccount=DatabaseConnection.insertUpdateFromSqlQuery("insert into tblpatient(patient_id,patient_name,patient_email,patient_mobile,patient_address,uname,upass) values('"+patientId+"','"+pname+"','"+pemail+"','"+pmobile+"','"+paddress+"','"+uname+"','"+upass+"')");
			if(patientAccount>0) {
				HttpSession session = request.getSession();
				session.setAttribute("success-message", "Patient account created successfully.");
				response.sendRedirect("patient-register.jsp");
			}else {
				response.sendRedirect("patient-register.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
