<%-- 
    Document   : Editar
    Created on : 10-18-2020, 01:09:49 PM
    Author     : ferna
--%>

<%@page import="java.sql.* "%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar datos</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1 align="center">Editar datos</h1>
        
        <%
            try{
           // obteniendo el valor del parametro desde el formulario index.jsp
           int id = Integer.parseInt(request.getParameter("id"));
          // ref. al driver de conexion
          Class.forName("com.mysql.jdbc.Driver");
          // 1. cadena de conexion
          Connection myCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/registro","root","");
          // 2. consulta preparada
          PreparedStatement myStmt = myCon.prepareStatement("select*from usuario where Id = ? ");
          // 3. valor al parametro 
          myStmt.setInt(1,id);
          // 4. ejecutar consulta y recorrerla:
          ResultSet myRs = myStmt.executeQuery(); 
          while(myRs.next()){
        %>
        
        <form class="container" style="width:450px; height:500px">
            
            <tr class="form-control">
                ID:
                <input type="text" name="txtid" value="<%=myRs.getInt(1)%>" readonly="readonly" class="form-control"/>
                DNI:
                <input type="text" name="txtdni" value="<%=myRs.getInt(2)%>" class="form-control" />
                NOMBRE:
                <input type="text" name="txtnom" value="<%=myRs.getString(3)%>" class="form-control" />
                <br><br> 
                <input type="submit" value="Editar registro" class="btn btn-success" name="btnEditar"/>
                <br> <br>  
                <a href="index.jsp">Regresar a pagina principal</a>
            </tr> 
        </form>
        
                <%
                }
                 } catch(Exception exc){
                   exc.printStackTrace();
                 }
                %> 
    </body>
</html>


<%
        if(request.getParameter("btnEditar")!= null){
        // trayendo el valor de las variables:
        int ID = Integer.parseInt(request.getParameter("txtid"));
        int DNI = Integer.parseInt(request.getParameter("txtdni"));
        String NOMBRE = request.getParameter("txtnom");
         try{
        // 1.cadena de conexion
        Connection myCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/registro","root","");
        // 2. consulta preparada
        PreparedStatement myStmt = myCon.prepareStatement("update usuario set DNI = ?, Nombres = ?  where Id = ? ");
        // 3. valores a los parametros
        myStmt.setInt(1,DNI);
        myStmt.setString(2,NOMBRE);
        myStmt.setInt(3,ID);
        // 4. Ejecutar consulta
        myStmt.executeUpdate();
        out.println("Los datos se editaron");
        request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch(Exception exc){
        exc.printStackTrace();
        }  
        }

%>