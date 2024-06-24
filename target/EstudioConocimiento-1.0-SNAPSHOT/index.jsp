<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Inicio</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/slidebars.css">
        <link rel="stylesheet" type="text/css" href="css/materia.css">
    </head>

    <body>
        <div class="sidebar">
            <jsp:include page="WEB-INF/barra_lateral.jsp">
                <jsp:param name="opc" value="index"/>
            </jsp:include>
        </div> 

        <div class="content">
            <h1>Materias</h1>
            <p>Selecciona una materia para comenzar el estudio</p>
            <div class="container">

                <div class="materias">
                    <div class="materia">
                        <a href="MateriaControlador?action=matematicas">
                            <img src="https://img.freepik.com/vector-gratis/fondo-isometrico-material-matematicas_23-2148146102.jpg" alt="Matemáticas">
                            <c:forEach var="item" items="${materias}">
                                <c:if test="${item.id_materia == 1}">
                                    <h3>${item.detalle_materia}</h3>
                                </c:if>
                            </c:forEach>
                        </a>
                    </div>
                    <div class="materia">
                        <a href="MateriaControlador?action=lenguaje">
                            <img src="img/leng.png" alt="Lenguaje">
                            <c:forEach var="item" items="${materias}">
                                <c:if test="${item.id_materia == 2}">
                                    <h3>${item.detalle_materia}</h3>
                                </c:if>
                            </c:forEach>
                        </a>
                    </div>
                    <div class="materia">
                        <a href="MateriaControlador?action=sociales">
                            <img src="img/sociales.png" alt="Ciencias Sociales">
                            <c:forEach var="item" items="${materias}">
                                <c:if test="${item.id_materia == 3}">
                                    <h3>${item.detalle_materia}</h3>
                                </c:if>
                            </c:forEach>
                            
                        </a>
                    </div>
                    
                    <div class="materia">
                        <a href="MateriaControlador?action=artes">
                            <img src="img/art.png" alt="Artes Plásticas">
                            <c:forEach var="item" items="${materias}">
                                <c:if test="${item.id_materia == 4}">
                                    <h3>${item.detalle_materia}</h3>
                                </c:if>
                            </c:forEach>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
    </body>

</html>
