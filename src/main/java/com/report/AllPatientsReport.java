package com.report;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.DatabaseConnection;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

@WebServlet("/AllPatientsReport")
public class AllPatientsReport extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static Font TIME_ROMAN = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD);
    private static Font TIME_ROMAN_SMALL = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        final ServletContext servletContext = request.getSession().getServletContext();
        final File tempDirectory = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
        final String temporaryFilePath = tempDirectory.getAbsolutePath();
        String fileName = "All_Patients_Report_" + System.currentTimeMillis() + ".pdf";
        response.setContentType("application/pdf");
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Cache-Control", "max-age=0");
        response.setHeader("Content-disposition", "attachment; filename=" + fileName);

        try {
            createPDF(temporaryFilePath + File.separator + fileName, response);
        } catch (Exception e1) {
            e1.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private static ByteArrayOutputStream convertPDFToByteArrayOutputStream(String fileName) {
        InputStream inputStream = null;
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {
            inputStream = new FileInputStream(fileName);
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                baos.write(buffer, 0, bytesRead);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return baos;
    }

    public static Document createPDF(String file, HttpServletResponse response) {
        Document document = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            document = new Document();
            PdfWriter.getInstance(document, new FileOutputStream(file));
            document.open();
            addMetaData(document);
            addTitlePage(document);
            createTable(document);
            document.close();

            // Stream the PDF file to the client
            ByteArrayOutputStream baos = convertPDFToByteArrayOutputStream(file);
            OutputStream os = response.getOutputStream();
            baos.writeTo(os);
            os.flush();

        } catch (FileNotFoundException | DocumentException e) {
            e.printStackTrace();
        } catch (IOException e) {
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
        return document;
    }

    private static void addMetaData(Document document) {
        document.addTitle("Generate PDF report");
        document.addSubject("Generate PDF report");
       
    }

    private static void addTitlePage(Document document) throws DocumentException {
        Paragraph preface = new Paragraph();
        createEmptyLine(preface, 1);
        preface.add(new Paragraph("All Patients Report", TIME_ROMAN));

        createEmptyLine(preface, 1);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
        preface.add(new Paragraph("Generated on " + simpleDateFormat.format(new Date()), TIME_ROMAN_SMALL));
        
        createEmptyLine(preface, 1); // Add an empty line here


        document.add(preface);
    }

    private static void createEmptyLine(Paragraph paragraph, int number) {
        for (int i = 0; i < number; i++) {
            paragraph.add(new Paragraph(" "));
        }
    }

    private static void createTable(Document document) throws DocumentException {
        PdfPTable table = new PdfPTable(6); // Adjust the number of columns as per your requirement
        table.setWidthPercentage(100);

        String[] headers = {"Id", "Patient Name", "Email", "Mobile", "Address", "Disease"};
        for (String header : headers) {
            PdfPCell cell = new PdfPCell(new Phrase(header));
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setBackgroundColor(BaseColor.GRAY);
            table.addCell(cell);
        }

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseConnection.getConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM tblpatient");

            while (resultSet.next()) {
                table.addCell(resultSet.getString("patient_id"));
                table.addCell(resultSet.getString("patient_name"));
                table.addCell(resultSet.getString("patient_email"));
                table.addCell(resultSet.getString("patient_mobile"));
                table.addCell(resultSet.getString("patient_address"));
                table.addCell(resultSet.getString("patient_disease"));
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

        document.add(table);
    }
}
