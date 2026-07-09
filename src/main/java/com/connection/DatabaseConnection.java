package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DatabaseConnection {

    public static Connection connection;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost/AMS?useSSL=false", "root", "root");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    public static void CloseConnection() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    public static ResultSet getResultFromSqlQuery(String SqlQueryString) {
        ResultSet rs = null;
        try {
            if (connection == null) {
                getConnection();
            }
            rs = connection.createStatement().executeQuery(SqlQueryString);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return rs;
    }

    public static int insertUpdateFromSqlQuery(String SqlQueryString) {
        int i = 2;
        try {
            if (connection == null) {
                getConnection();
            }
            i = connection.createStatement().executeUpdate(SqlQueryString);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return i;
    }

    public static String generatePatientId() {
        String vid = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
        vid = sdf.format(new Date());
        vid = "P" + vid;
        System.out.println("Patient Id " + vid);
        return vid;
    }

    public static String generateDriverId() {
        String did = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
        did = sdf.format(new Date());
        did = "D" + did;
        System.out.println("Driver Id " + did);
        return did;
    }

    public static String generateAmbulanceId() {
        String aid = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
        aid = sdf.format(new Date());
        aid = "AVN" + aid;
        System.out.println("Ambulance Id " + aid);
        return aid;
    }

    public static int insertUpdateFromSqlQuery(String sql, Object... parameters) {
        int result = 0;
        try {
            if (connection == null) {
                getConnection();
            }
            PreparedStatement stmt = connection.prepareStatement(sql);
            for (int i = 0; i < parameters.length; i++) {
                stmt.setObject(i + 1, parameters[i]);
            }
            System.out.println("Executing Query: " + stmt.toString());
            result = stmt.executeUpdate();
            stmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return result;
    }

    // New method for inserting or updating ambulance booking
    public static int insertUpdateAmbulanceBooking(String bookingId, String patientId, String vehicleNo, String pdisease, String scity, String dcity, String status) {
        String sql = "INSERT INTO ambulance_booking (booking_id, patient_id, vehicle_no, patient_disease, source_city, destination_city, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
        return insertUpdateFromSqlQuery(sql, bookingId, patientId, vehicleNo, pdisease, scity, dcity, status);
    }
    
    // New method to generate unique booking ID
    public static String generateUniqueBookingId() {
        String bookingId;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        bookingId = "AM" + sdf.format(new Date());
        return bookingId;
    }


    // Modified method to retrieve result set with booking ID parameter
    public static ResultSet getResultFromSqlQuery(String sql, String bookingId) {
        ResultSet rs = null;
        try {
            if (connection == null) {
                getConnection();
            }
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, bookingId);
            rs = stmt.executeQuery();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return rs;
    }
}
