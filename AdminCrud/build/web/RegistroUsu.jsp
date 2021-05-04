<%-- 
    Document   : index
    Created on : 2/05/2021, 02:43:41 AM
    Author     : levar
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de usuarios</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        
    </head>
    <body>
        <div class="container" >
        <%
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;
            
            String url, user, password, Driver;
            
            
            
            url = "jdbc:mysql://localhost:3306/baseusuarios";
            Driver = "com.mysql.jdbc.Driver";
            user = "root";
            password= "LevAISQL90_8";
            
            
            try{
                Class.forName(Driver);
                con = DriverManager.getConnection(url, user, password);
                //con = DriverManager.getConnection(url, user, password);
                
                try{
                    String nombreUsu, apellidop, apellidom, direccion, telefono, nombreusuario, pass;
                    int edad;
                    
                    nombreUsu = request.getParameter("nombre");
                    apellidop = request.getParameter("apellidop");
                    apellidom = request.getParameter("apellidom");
                    edad = edad = Integer.parseInt(request.getParameter("edad"));
                    direccion = request.getParameter("direccion");
                    telefono= request.getParameter("telefono");
                    pass= request.getParameter("contrasena");
                    
                    nombreusuario = nombreUsu +" "+ apellidop+" " + apellidom;
                    
                    set = con.createStatement();
                    
                    String q = "insert into usuarios(nom_usu, edad_usu, dire_usu, tel_usu, pass_usu)"
                            + "values "
                        + "('"+nombreusuario+"', "+edad+", '"+direccion+"', '"+telefono+"', '"+pass+"')";
                    
                    
                    int registro = set.executeUpdate(q);
                    
                    %>
                        <h1>Registro exitoso</h1>
                    <%
                }catch(SQLException ed ){

                    System.out.println("Error al registrar en la tabla");
                    System.out.println(ed.getMessage());
                    System.out.println(ed.getStackTrace());
                    %>
                        <h1>Registro no exitoso, error al crear latabla</h1>
                    <%
                }
                set.close();
                
            }catch(Exception e){
                
                System.out.println("Error al conectar con la BD");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
                %>
                        <h1>Sitio en construccion</h1>
                <%
            }

        %>
        <br>
        <a href="index.html" class="btn btn-outline-primary">Regresar al menu principal</a>
       </div>
    </body>
</html>
