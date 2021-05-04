<%-- 
    Document   : ActualizarUsu
    Created on : 2/05/2021, 03:49:38 PM
    Author     : levar
--%>


<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        
    </head>
    <body>
        <%
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;

            String url, userName, password, driver;

            url = "jdbc:mysql://localhost/baseusuarios";
            userName = "root";
            password = "LevAISQL90_8";
            driver = "com.mysql.jdbc.Driver";
            
            try{
                Class.forName(driver);
                con = DriverManager.getConnection(url, userName, password);
                try{
                    
                    String nombreUsu, apellidop ,pass, apellidom, direccion, telefono, nombreusuario;
                    int edad;
                    
                    nombreUsu = request.getParameter("nombre2");
                    apellidop = request.getParameter("apellidop2");
                    apellidom = request.getParameter("apellidom2");
                    edad = edad = Integer.parseInt(request.getParameter("edad2"));
                    direccion = request.getParameter("dire2");
                    telefono= request.getParameter("tel2");
                    pass= request.getParameter("pass2");
                    
                    nombreusuario = nombreUsu;
                    
                    int id = Integer.parseInt(request.getParameter("id2"));
                    String q = "update usuarios set nom_usu = '"+nombreusuario+"', "
                            + "edad_usu = '"+edad+"', dire_usu = '"+direccion+"', "
                            + "tel_usu = '"+telefono+"', pass_usu = '"+pass+"' "
                            + "where id_usu = "+id+"";
                    
                    set = con.createStatement();
                    
                    int borrar = set.executeUpdate(q);
                    
                    %>
                    
                    <h1>Registro Actualizado con Exito</h1>
                    <a href="index.html" class="btn btn-outline-primary">Regresar al menu principal</a>
                    
                    <%     
                    set.close();   
                    %>
                    <title>Borrar registros</title>
                    <%
                }catch(SQLException ed){
                    System.out.println("Error al actualizar el dato");
                    System.out.println(ed.getMessage());
                     %>
                    
                    <h1>Registro No es posible Actualizarlo con Exito, juguito contigo</h1>
                    
                    <% 
                
                }
                con.close();
            
            }catch(Exception e){
                System.out.println("Error al conectar con la bd");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
                %>
                    
                    <h1>Sitio en construcción</h1>
                    
                    <%
            
            }
            %>
        
    </body>
</html>
