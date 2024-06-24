<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Lenguaje</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
        <link rel="stylesheet" type="text/css" href="css/slidebars.css">
    </head>

    <body>
        <div class="main-container">
            <div class="sidebar">
                <jsp:include page="WEB-INF/barra_lateral.jsp"></jsp:include>
                </div> 


            <jsp:include page="WEB-INF/menu.jsp">
                <jsp:param name="opcion" value="temas"/>
                <jsp:param name="op" value="lenguaje"/>
                <jsp:param name="materia" value="Lenguaje"/>
            </jsp:include>

        </div>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
    </body>

</html>
