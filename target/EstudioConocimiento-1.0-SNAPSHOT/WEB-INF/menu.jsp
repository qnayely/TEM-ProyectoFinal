<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String opcion = request.getParameter("opcion");
    String op = request.getParameter("op");
    String materia = request.getParameter("materia");
%>
<header data-bs-theme="dark">
    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <div class="container-fluid">

            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav me-auto mb-2 mb-md-0">
                    <li class="nav-item">

                        <c:forEach var="item" items="${materias}">
                            <c:if test="${item.id_materia == id_materi}">
                                <a class="nav-link active">${item.detalle_materia}</a>
                            </c:if>
                        </c:forEach>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <%= (opcion.equals("actividades") ? "active" : "")%>" href="ActividadControlador">Actividades</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <%= (opcion.equals("temas") ? "active" : "")%>" href="MateriaControlador?action=<%=op%>">Temas</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link <%= (opcion.equals("libros") ? "active" : "")%>" href="LibroControlador">Libros</a>
                    </li>
                </ul>

            </div>
        </div>
    </nav>
</header>

