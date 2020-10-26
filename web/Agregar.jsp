<%-- 
    Document   : Agregar
    Created on : 10-18-2020, 11:06:13 AM
    Author     : ferna
--%>

<%@page import="java.sql.* "%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar registros</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/> 
    </head>
    <body class="container">
        <center>
            <br><br>
        <form class="form-control" style="width:500px; height: 450px">
            <h1>Formulario agregar registros</h1>
            <br>
            <table>
                <input type="text" name="txtid" placeholder="Ingresar ID" class="form-control" />
                <br>
                <input type="text" name="txtdni" placeholder="Ingresar DNI"class="form-control" />
                <br>
                <input type="text" name="txtnom" placeholder="Ingresar nombre" class="form-control" />
                <br>
                <input type="submit" value="Guardar registros" name="btnGuardar" class="btn btn-primary" />
                <br> <br>
                <a href="index.jsp"> Regresar </a>
            </table>
        </form>
         </center>
    </body>
</html>


<%
    if(request.getParameter("btnGuardar")!= null){
    try{
        // datos del formulario en nuevas variables
        int id = Integer.parseInt(request.getParameter("txtid"));
        int dni = Integer.parseInt(request.getParameter("txtdni"));
        String nombre = request.getParameter("txtnom");
        
   // ref. al driver de conexion
   Class.forName("com.mysql.jdbc.Driver");
   // 1. cadena de conexion
   Connection myCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/registro","root","");
   // 2. consulta preparada
   PreparedStatement myStmt = myCon.prepareStatement("insert into usuario value(?,?,?)");
   // 3. valores a los parametros
   myStmt.setInt(1,id);
   myStmt.setInt(2,dni);
   myStmt.setString(3,nombre); 
   // 4. ejecutar consulta
   myStmt.executeUpdate();
   out.println("Datos insertados");
    }catch(Exception exc){
     exc.printStackTrace();
    }
    }
   
%>
 