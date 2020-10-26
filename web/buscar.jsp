<%-- 
    Document   : buscar
    Created on : 10-18-2020, 06:44:02 PM
    Author     : ferna
--%>

<%@page import="java.sql.* "%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscar</title>
    </head>
    <body>
       <%
           // 2. ref al driver
           Class.forName("com.mysql.jdbc.Driver");
           // 1. cadena de conexion
           Connection myCon = null;
           PreparedStatement myStmt = null;
           ResultSet myRs = null; 
           
          myCon = DriverManager.getConnection("jdbc:mysql://localhost:3306","root","");
          myStmt = myCon.prepareStatement(" select * from usuario ");
          myRs = myStmt.executeQuery(); 
       %>
        <form>
            <tr>
                <td>  </td>
            </tr>
        </form>
    </body>
</html>
