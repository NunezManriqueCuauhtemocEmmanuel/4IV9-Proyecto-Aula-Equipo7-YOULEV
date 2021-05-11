<%-- 
    Document   : ModificarUsu
    Created on : 2/05/2021, 01:41:40 PM
    Author     : levar
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar datos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        
    </head>
    <body>
        <div class="container">
            <div class="text-center mt-4 mb-4">
                <h1>Modifique los datos que desee</h1>
            </div>
            <form method="post" name="formularioactualizar"  action="ActualizarUsu.jsp">
                <table border="2" class="table table-striped table-hover">
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
                                int id = Integer.parseInt(request.getParameter("id"));
                                String q = "select id_usu, nom_usu, edad_usu, dire_usu, tel_usu, pass_usu from usuarios "
                                        + "where id_usu="+id;

                                set = con.createStatement();
                                rs = set.executeQuery(q);
                                while(rs.next()){
                                %>
                        <tr>
                            <td>ID</td>
                            <td> <input type="hidden" name="id2" value="<%=rs.getInt("id_usu")%>" > </td>
                        </tr>
                        <tr>
                            <td>Nombre Completo:</td>
                            <td> <input type="text" name="nombre2" value="<%=rs.getString("nom_usu")%>" > </td>
                        </tr>
                        <tr>
                            <td>Edad:</td>
                            <td> <input type="number" name="edad2" value="<%=rs.getInt("edad_usu")%>" > </td>
                        </tr>
                        <tr>
                            <td>Direccion:</td>
                            <td> <input type="text" name="dire2" value="<%=rs.getString("dire_usu")%>" > </td>
                        </tr>      
                        <tr>
                            <td>Telefono o celular:</td>
                            <td> <input type="text" name="tel2" value="<%=rs.getString("tel_usu")%>" > </td>
                        </tr>    
                        <tr>
                            <td>Contraseña:</td>
                            <td> <input type="text" name="pass2" value="<%=rs.getString("pass_usu")%>" > </td>
                        </tr>  


                                <%

                                }
                                rs.close();
                                set.close();

                            }catch(SQLException ed){
                                System.out.println("Error al consultar los datos");
                                System.out.println(ed.getMessage());
                                %>
                    <tr>
                        <td>ID</td>
                        <td> <input type="hidden" name="id2" value="" > </td>
                    </tr>
                    <tr>
                        <td>Nombre:</td>
                        <td> <input type="text" name="nombre2" value="" > </td>
                    </tr>
                    <tr>
                        <td>Edad:</td>
                        <td> <input type="text" name="edad2" value="" > </td>
                    </tr>
                    <tr>
                        <td>Direccion:</td>
                        <td> <input type="text" name="dire2" value="" > </td>
                    </tr>
                    <tr>
                        <td>Telefono o celular:</td>
                        <td> <input type="text" name="tel2" value="" > </td>
                    </tr> 
                    <tr>
                        <td>Contraseña:</td>
                        <td> <input type="text" name="pass2" value="" > </td>
                    </tr> 

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


                </table>
                        <input type="submit" value="Actualizar Datos" >
                        <input type="reset" value="Borrar Datos" >

            </form>
                        <br>
                        
                        <a href="index.html" class="btn btn-outline-primary">Registrar </a>
        </div>
    </body>
</html>
