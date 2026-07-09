<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Basic -->
   

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">

    <!-- Modernizer for Portfolio -->
    <script src="js/modernizer.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <style>
        body {
            height: auto;
            background-image: url("eme.jpg");
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            height: 46rem;
            font-weight: 400;
        }

        .container-fluid {
            padding-top: 130px;
        }

        table,
        thead,
        tr {
            border: 1px solid;
        }

        td,
        th {
            padding: 2px;
            margin: 0;

        }

        th {
            width: 400px;
        }

        .panel-body {
            border: 10px solid black;
            padding: 20px;
            width: 1600px;
            
            justify-content: center;
            margin-left:50px;
           
           
            margin-top: 20px;
        }

        h3 {
               margin-left:50px;
           
        }

        

        
    </style>
</head>

<body class="host_version">
    <jsp:include page="admin-header.jsp"></jsp:include>

    <div class="container-fluid">
        <h3 class="header-line">Feedback/Complaints</h3>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable">
                    <thead class="bg-primary">
                        <tr>
                            <th>#</th>
                            <th>Patient Id</th>
                            <th>Patient_Name</th>
                            <th>Mobile</th>
                            <th>Ambulance_Vehicle_No</th>
                            <th>Driver_Name</th>
                            <th>Type</th>
                            <th>Feedback/Comment</th>
                            <th>Created_At</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Connection conn = null;
                            Statement stmt = null;
                            ResultSet resultset = null;

                            try {
                                conn = DatabaseConnection.getConnection();
                                stmt = conn.createStatement();
                                resultset = stmt.executeQuery("SELECT * FROM tblfeedback");

                                if (resultset != null) {
                                    while (resultset.next()) {
                        %>
                        <tr class="default">
                            <td><%=resultset.getString("id")%></td>
                            <td><%=resultset.getString("patient_id")%></td>
                            <td><%=resultset.getString("patient_name")%></td>
                            <td><%=resultset.getString("Patient_mobile")%></td>
                            <td><%=resultset.getString("avn")%></td>
                            <td><%=resultset.getString("driverName")%></td>
                            <%
                                if ("Feedback".equals(resultset.getString("feedback_complaint_type"))) {
                            %>
                            <td><span class="btn btn-success"><%=resultset.getString("feedback_complaint_type")%></span></td>
                            <%
                                } else {
                            %>
                            <td><span class="btn btn-info"><%=resultset.getString("feedback_complaint_type")%></span></td>
                            <%
                                }
                            %>
                            <td><%=resultset.getString("feedback_or_complaint")%></td>
                            <td><%=resultset.getString("created_at")%></td>
                            <td>
                                <a class="btn btn-danger" href="DeleteFeedbackServlet?feedback_id=<%= resultset.getString("id") %>"
                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete</a>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                                out.println("<tr><td colspan='9'>No records found.</td></tr>");
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                            response.getWriter().print("Error: " + e.getMessage());
                        } finally {
                            try {
                                if (resultset != null)
                                    resultset.close();
                                if (stmt != null)
                                    stmt.close();
                                if (conn != null)
                                    conn.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Displaying messages using JSTL -->
    <c:if test="${param.message != null}">
        <div class="alert alert-info alert-dismissible fade show" role="alert" style="position: fixed; bottom: 20px; right: 20px; z-index: 9999;">
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            <strong>${param.message}</strong>
        </div>
    </c:if>

    <jsp:include page="footer.jsp"></jsp:include>
</body>

</html>
