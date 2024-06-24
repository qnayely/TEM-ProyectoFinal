<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <h1>Estudiantes</h1>
            <a href="EstudianteControlador?action=add" class="btn btn-primary"><i class="fa-solid fa-circle-plus"></i> Nuevo</a>
            <br>
            <br>
            <table class="table table-striped">
                <tr>
                    <th>Id</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Edad</th>
                    <th>Grado</th>
                    <th></th>
                    <th></th> 
                </tr>
                <c:forEach var="item" items="${estudiantes}">
                    <tr>
                        <td>${item.id_est}</td>
                        <td>${item.nombres}</td>
                        <td>${item.apellidos}</td>
                        <td>${item.edad}</td>
                        <td>${item.grado}</td>
                        <td>
                            <a href="EstudianteControlador?action=edit&id_est=${item.id_est}&id_usr=${item.id_usr}">
                                <i class="fa-solid fa-pen-to-square"></i> Editar
                            </a>
                        </td>
                        <td>
                            <a href="EstudianteControlador?action=delete&id_est=${item.id_est}" onclick="return confirm('¿Está seguro que desea eliminar este estudiante?')">
                                <i class="fa-solid fa-trash-can"></i> Eliminar
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>    
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
