<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrarse</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/registro.css">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <div class="form-container">
                <h3 class="text-center">Formulario de Registro</h3>
                <form action="EstudianteControlador" method="post">
                    <input type="hidden" name="id_est" value="${estudiante.id_est}">
                    <table class="tab">
                        <tr>
                            <td >
                                <div class="form-group">
                                    <label for="nombre">Nombres</label>
                                    <input type="text" class="form-control" name="nombres" value="${estudiante.nombres}" placeholder="">
                                </div>  
                            </td>
                            <td >
                                <div class="form-group">
                                    <label for="apellidos">Apellidos</label>
                                    <input type="text" class="form-control" name="apellidos" value="${estudiante.apellidos}">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="espacio-derecha">
                                <div class="form-group">
                                    <label for="edad">Edad</label>
                                    <input type="number" class="form-control" name="edad" value="${estudiante.edad}">
                                </div>
                            </td>
                            <td >
                                <div class="form-group">
                                    <label for="id_grado">Grado</label>
                                    <select name="id_grado" class="form-control">
                                        <option value="">-- Seleccione --</option>
                                        <c:forEach var="item" items="${listaGrados}">
                                            <option value="${item.id_grado}" <c:if test="${estudiante.id_grado == item.id_grado}">selected</c:if>>${item.detalle_grado}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <label for="correo">Correo</label>
                                    <input type="email" class="form-control" name="correo" value="${usuario.correo}">
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="password">Contraseña</label>
                                    <input type="password" class="form-control" name="password" value="${usuario.password}">
                                </div>
                            </td>
                        </tr>
                    </table>
                    <input type="hidden" name="id" value="${usuario.id}">
                    <input type="hidden" name="id_est_usuario" value="${usuario.id_est}">
                    <br>
                    <button type="submit" class="btn btn-primary bt">Registrarse</button>
                </form>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
