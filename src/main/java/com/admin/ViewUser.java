package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.connection.DatabaseConnection;

@WebServlet("/ViewUser")
public class ViewUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String patientId = request.getParameter("id");
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseConnection.getConnection();
            String sql = "SELECT * FROM tblpatients WHERE patient_id=?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, patientId);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                request.setAttribute("patientDetails", resultSet);
                request.getRequestDispatcher("view-user.jsp").forward(request, response);
            } else {
                response.sendRedirect("admin-view-patients-complaint-feedback.jsp"); // Redirect back if patient details not found
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
