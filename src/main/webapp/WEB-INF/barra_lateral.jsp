<%
    String opc = request.getParameter("opc");
    if (opc == null) {
        opc = ""; // Asignar un valor predeterminado si opc es null
    }
%>
<h2>Bienvenido ${usuario}</h2>
<a class="<%= (opc.equals("index") ? "active" : "")%>" href="MateriaControlador">
    <svg class="icon" width="16" height="16" fill="currentColor">
    <use xlink:href="#home"></use>
    </svg>
    Inicio
</a>
<a class="<%= (opc.equals("tutoriales") ? "active" : "")%>" href="turorial.jsp">
    <svg class="icon" width="16" height="16" fill="currentColor">
    <use xlink:href="#table"></use>
    </svg>
    Tutoriales
</a>
<a class="<%= (opc.equals("perfil") ? "active" : "")%>" href="PerfilControlador">
    <svg class="icon" width="16" height="16" fill="currentColor">
    <use xlink:href="#people-circle"></use>
    </svg>
    Perfil
</a>


<form class="sidebar-footer" action="LoginControlador?action=logout" method="post">
    <button class="btn btn-danger" type="submit">Cerrar Sesión</button>
</form>


<svg style="display: none;">
<symbol id="home" viewBox="0 0 16 16">
    <path d="M8 3.293l-6 6V13.5a.5.5 0 0 0 .5.5H6v-3h4v3h3.5a.5.5 0 0 0 .5-.5V9.293l-6-6zM7.5 1.5a.5.5 0 0 1 .5 0l6.5 6.5V13.5A1.5 1.5 0 0 1 13.5 15h-3a.5.5 0 0 1-.5-.5v-3H6v3a.5.5 0 0 1-.5.5h-3A1.5 1.5 0 0 1 1 13.5V8l6.5-6.5a.5.5 0 0 1 .5-.5z"></path>
</symbol>
<symbol id="speedometer2" viewBox="0 0 16 16">
    <path d="M8 4a.5.5 0 0 1 .5.5v3.707l2.854 2.853a.5.5 0 1 1-.708.708L8 8.707V4.5A.5.5 0 0 1 8 4z"></path>
    <path d="M3.051 4.435a7 7 0 1 1 9.9 9.13 7 7 0 0 1-9.9-9.13zm9.133 8.421a6 6 0 1 0-8.268-8.268 6 6 0 0 0 8.268 8.268z"></path>
</symbol>
<symbol id="table" viewBox="0 0 16 16">
    <path d="M0 3a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2H0zm15 1H1v9a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4zM4 5h1v1H4V5zm2 0h1v1H6V5zm2 0h1v1H8V5zm2 0h1v1h-1V5zm2 0h1v1h-1V5zm0 2H4v1h8V7zm-8 2h1v1H4V9zm2 0h1v1H6V9zm2 0h1v1H8V9zm2 0h1v1h-1V9zm2 0h1v1h-1V9zm0 2H4v1h8v-1z"></path>
</symbol>
<symbol id="people-circle" viewBox="0 0 16 16">
    <path d="M13 7a2 2 0 1 1-4 0 2 2 0 0 1 4 0zM9 7a2 2 0 1 1-3.999-.001A2 2 0 0 1 9 7zM13 10a5.985 5.985 0 0 0-1.165-.661C11.226 9.21 10.154 9 9 9s-2.226.21-2.835.339A5.985 5.985 0 0 0 5 10v3h8v-3z"></path>
    <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm6-7a6 6 0 1 1-12 0 6 6 0 0 1 12 0z"></path>
</symbol>
<symbol id="grid" viewBox="0 0 16 16">
    <path d="M2 0a2 2 0 0 0-2 2v2a2 2 0 0 0 2 2h2a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm2 1H2a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H2zM6 2a2 2 0 0 1 2-2h2a2 2 0 0 1 2 2v2a2 2 0 0 1-2 2H8a2 2 0 0 1-2-2V2zm2-1a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H8zM2 9a2 2 0 0 0-2 2v2a2 2 0 0 0 2 2h2a2 2 0 0 0 2-2v-2a2 2 0 0 0-2-2H2zm2 1H2a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1v-2a1 1 0 0 0-1-1H2zM6 11a2 2 0 0 1 2-2h2a2 2 0 0 1 2 2v2a2 2 0 0 1-2 2H8a2 2 0 0 1-2-2v-2zm2-1a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1v-2a1 1 0 0 0-1-1H8z"></path>
</symbol>
<symbol id="calendar3" viewBox="0 0 16 16">
    <path d="M14 4H2V3h12v1zM3 0a1 1 0 0 1 1 1v1h8V1a1 1 0 1 1 2 0v1h1a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V1a1 1 0 1 1 2 0v1zm0 14a1 1 0 0 0 1-1V8H2v5a1 1 0 0 0 1 1zm2 0a1 1 0 0 0 1-1V8H4v5a1 1 0 0 0 1 1zm2 0a1 1 0 0 0 1-1V8H6v5a1 1 0 0 0 1 1zm2 0a1 1 0 0 0 1-1V8H8v5a1 1 0 0 0 1 1zm2 0a1 1 0 0 0 1-1V8h-2v5a1 1 0 0 0 1 1zm3-9H2v5h12V5z"></path>
</symbol>
<symbol id="chat-quote-fill" viewBox="0 0 16 16">
    <path d="M6.982 1a1 1 0 0 0-1.09.172 4.002 4.002 0 0 0-6.29 2.25 1 1 0 1 0 1.962.34A2.002 2.002 0 0 1 2 3h1a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H2a1 1 0 1 0 0 2h1v.065a3.978 3.978 0 0 0-1 .28A2.992 2.992 0 0 1 0 7a2.992 2.992 0 0 1-1 1H0V8a4 4 0 1 0 3-3.918V4h1a2 2 0 1 1 2 2v.083a4 4 0 0 0 0 6.918 4 4 0 0 0 1 1 2.992 2.992 0 0 1-1 1H3a3 3 0 0 1-1 .723v.134a4 4 0 0 0 3 0A4.992 4.992 0 0 0 8 14.8a4.992 4.992 0 0 0 2 .723v-.134A4.992 4.992 0 0 0 10 12.8a4.992 4.992 0 0 0 2-.723v-.134a3 3 0 0 1 1-.723h1v-.25a4.992 4.992 0 0 0 2-.723v-.134a4.992 4.992 0 0 0 2-.723v-.134a3 3 0 0 1 1-.723h1v-.25a4.992 4.992 0 0 0 2-.723V8a2 2 0 1 0-1-1h-.5a1.5 1.5 0 0 0-1.175.518 4.992 4.992 0 0 0 0-6.918V0h-2a2.5 2.5 0 0 1-2.5 2.5H10a1 1 0 0 0 1-1H2a1 1 0 0 0-.182-.014A4.5 4.5 0 0 0 6.982 1z"></path>
</symbol>
<symbol id="gear-fill" viewBox="0 0 16 16">
    <path d="M9.193.488l.39 1.528a1 1 0 0 0 .486 0l1.528-.39a1 1 0 0 1 1.243 1.243l-.39 1.528a1 1 0 0 0 .21.923l.1.1a1 1 0 0 1 0 1.414l-.1.1a1 1 0 0 0-.21.923l.39 1.528a1 1 0 0 1-1.243 1.243l-1.528-.39a1 1 0 0 0-.923.21l-.1.1a1 1 0 0 1-1.414 0l-.1-.1a1 1 0 0 0-.923-.21l-1.528.39a1 1 0 0 1-1.243-1.243l.39-1.528a1 1 0 0 0-.21-.923l-.1-.1a1 1 0 0 1 0-1.414l.1-.1a1 1 0 0 0 .21-.923l-.39-1.528A1 1 0 0 1 6.193.488l1.528.39a1 1 0 0 0 .923-.21l.1-.1a1 1 0 0 1 1.414 0l.1.1a1 1 0 0 0 .923.21zm-.858 1.516l-1.528.39a1 1 0 0 1-1.243-1.243l.39-1.528a1 1 0 0 1 .923-.21l1.528.39a1 1 0 0 1 .21.923l-.1.1a1 1 0 0 1 0 1.414l-.1.1a1 1 0 0 1-.923.21zm.5 3.475a2 2 0 1 0-2 3.464 2 2 0 0 0 2-3.464z"></path>
</symbol>
</svg>