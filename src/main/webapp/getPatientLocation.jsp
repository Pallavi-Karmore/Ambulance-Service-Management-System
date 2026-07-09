<%@ page language="java" contentType="text/plain; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String patientId = request.getParameter("id");
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sourceCity = ""; 
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ams", "root", "root");

        String sql = "SELECT source_city FROM tblpatient WHERE patient_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, patientId);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            sourceCity = rs.getString("source_city");
        } else {
            sourceCity = "error,Patient not found";
        }
    } catch (Exception e) {
        sourceCity = "error," + e.getMessage();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }

    // Outputting sourceCity directly as plain text
    response.setContentType("text/plain");
    response.getWriter().write(sourceCity);
%>
