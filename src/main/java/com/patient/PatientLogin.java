package com.patient;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

@WebServlet("/PatientLogin")
public class PatientLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("uname");
        String upass = request.getParameter("upass");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            HttpSession hs = request.getSession();
            con = DatabaseConnection.getConnection();
            String query = "SELECT * FROM tblpatient WHERE uname = ? AND upass = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, uname);
            ps.setString(2, upass);
            rs = ps.executeQuery();

            if (rs.next()) {
                hs.setAttribute("pid", rs.getString("patient_id"));
                hs.setAttribute("uname", rs.getString("uname"));
                hs.setAttribute("pname", rs.getString("patient_name"));
                hs.setAttribute("mobile", rs.getString("Patient_mobile"));
                response.sendRedirect("dash.jsp");
            } else {
                String message = "You have entered wrong credentials";
                hs.setAttribute("credential", message);
                response.sendRedirect("patient-login.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        
        }
    }
}
