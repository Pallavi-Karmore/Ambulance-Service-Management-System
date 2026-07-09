package com.admin;


import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.connection.DatabaseConnection;


@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String uname = request.getParameter("uname");
            String pass = request.getParameter("upass");
            HttpSession hs = request.getSession();
            
            Connection con = DatabaseConnection.getConnection();
            Statement st = con.createStatement();
            
            ResultSet resultset = st.executeQuery("select * from tbladmin where uname='" + uname + "' AND upass='" + pass + "'");
            if (resultset.next()) {
                hs.setAttribute("uname", resultset.getString("uname"));
                response.sendRedirect("admin-dashboard.jsp");
            } else {
                String message = "You have entered wrong credentials";
                hs.setAttribute("credential", message);
                response.sendRedirect("admin-login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
