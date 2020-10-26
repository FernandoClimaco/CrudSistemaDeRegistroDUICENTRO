<%-- 
    Document   : index
    Created on : 10-18-2020, 08:43:59 AM
    Author     : ferna
--%>

<%@page import="java.sql.* "%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Sistema de personas DUICENTRO</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
        <table class="table table-bordered"> 
            <h1 align="center">Sistema de registro de DUICENTRO</h1>
            
            <a href="Agregar.jsp" class="btn btn-success btn-ls">Nuevo registro</a>
            
            
            
            
             <center>
           <form>
               <a href="buscar.jsp">IR A BUSCAR</a>
          </form>
              </center>
            
            
            <% 
              
            // para el boton buscar:
            String nomBuscar = request.getParameter("txtbuscar");
            if(nomBuscar != null){
                 try{
               Connection myCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/registro","root",""); 
               PreparedStatement  myStmt = myCon.prepareStatement("select * from usuario where Nombres = ? ");
               myStmt.setString(1,nomBuscar);
              ResultSet myRs = myStmt.executeQuery(); 
              while(myRs.next()){ 
            %>
             <tr>
                <td class="text-center"> <%=myRs.getInt(1)%> </td>
                <td class="text-center"> <%=myRs.getInt(2)%></td>
                <td class="text-center"> <%=myRs.getString(3)%> </td>
                <td class="text-center">
                    <a href ="Editar.jsp?id=<%=myRs.getInt(1)%>" class="btn btn-warning btn-lg btn-sm"> Editar</a>
                //
                <a href="Eliminar.jsp?id=<%=myRs.getInt(1)%>" class="btn btn-danger btn-lg btn-sm"> Eliminar </a>
                </td>
             </tr>
            <%
               
            }  
                }catch(Exception exc){
                       exc.printStackTrace();
                      }   
                  }
            %>
            
            
            
            
             <hr>    
             <tr>
                <td class="text-center"> ID:</td>
                <td class="text-center"> DNI:</td>
                <td class="text-center"> NOMBRES: </td>
                <td class="text-center">ACCIONES:</td>
             </tr>
            
             
             <%
                try{
               // ref. al driver de conexion:
               Class.forName("com.mysql.jdbc.Driver");
               // 1. cadena de conexion
               Connection myCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/registro","root","");
               // 2. consulta preparada
               PreparedStatement myStmt = myCon.prepareStatement("select*from usuario");
               // 3. valores a los parametros:
               // 4. ejecutar consulta y recorrerla
               ResultSet myRs = myStmt.executeQuery();
               while(myRs.next())
               {
             %>
             
             <tr>
                <td class="text-center"> <%=myRs.getInt(1)%> </td>
                <td class="text-center"> <%=myRs.getInt(2)%></td>
                <td class="text-center"> <%=myRs.getString(3)%> </td>
                <td class="text-center">
                    <a href ="Editar.jsp?id=<%=myRs.getInt(1)%>" class="btn btn-warning btn-lg btn-sm"> Editar</a>
                //
                <a href="Eliminar.jsp?id=<%=myRs.getInt(1)%>" class="btn btn-danger btn-lg btn-sm"> Eliminar </a>
                </td>
             </tr>
             
             <%
             }
              }catch(Exception exc){
                exc.printStackTrace();
              }
             %>
        </table> 
        </div>
        
    
    </body>
</html>
