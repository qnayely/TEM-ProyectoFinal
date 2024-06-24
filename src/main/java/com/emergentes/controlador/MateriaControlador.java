package com.emergentes.controlador;

import com.emergentes.dao.MateriaDAO;
import com.emergentes.dao.MateriaDAO_impl;
import com.emergentes.dao.TemaDAO;
import com.emergentes.dao.TemaDAO_impl;
import com.emergentes.modelo.Materia;
import com.emergentes.modelo.Tema;
import com.emergentes.utiles.ConexionDB;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MateriaControlador", urlPatterns = {"/MateriaControlador"})
public class MateriaControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (Connection conn = new ConexionDB().conectar()) {
            MateriaDAO daoMateria = new MateriaDAO_impl(conn);
            List<Materia> listaMateria = daoMateria.getAll();
            TemaDAO daoTema = new TemaDAO_impl(conn);
            List<Tema> listaTema = daoTema.getAll();
            HttpSession ses1 = request.getSession();
            int id_grado = (int) ses1.getAttribute("id_grado");
            int id_materia;
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            switch (action) {
                case "matematicas":
                    request.setAttribute("temas", listaTema);
                    request.setAttribute("materias", listaMateria);
                    System.out.println("GRado: "+ id_grado);
                    id_materia = 1; // Suponiendo que matemáticas tiene id_materia = 1
                    request.setAttribute("id_grad", id_grado);
                    request.setAttribute("id_materi", id_materia);
                    request.getRequestDispatcher("temas.jsp").forward(request, response);
                    break;
                case "lenguaje":
                    request.setAttribute("temas", listaTema);
                    request.setAttribute("materias", listaMateria);
                    id_materia = 2; // Suponiendo que matemáticas tiene id_materia = 1
                    request.setAttribute("id_grad", id_grado);
                    request.setAttribute("id_materi", id_materia);
                    request.getRequestDispatcher("temas.jsp").forward(request, response);
                    break;
                case "sociales":
                    request.setAttribute("temas", listaTema);
                    request.setAttribute("materias", listaMateria);
                    id_materia = 3; // Suponiendo que matemáticas tiene id_materia = 1
                    request.setAttribute("id_grad", id_grado);
                    request.setAttribute("id_materi", id_materia);
                    request.getRequestDispatcher("temas.jsp").forward(request, response);
                    break;
                case "artes":
                    request.setAttribute("temas", listaTema);
                    request.setAttribute("materias", listaMateria);
                    id_materia = 4; // Suponiendo que matemáticas tiene id_materia = 1
                    request.setAttribute("id_grad", id_grado);
                    request.setAttribute("id_materi", id_materia);
                    request.getRequestDispatcher("temas.jsp").forward(request, response);
                    break;
                case "view":
                    List<Materia> lista = daoMateria.getAll();
                    request.setAttribute("materias", lista);
                    HttpSession ses = request.getSession();
                    String usuario = (String) ses.getAttribute("usuario");
                    request.setAttribute("usuario", usuario);

                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    break;
                default:
                    response.sendRedirect("index.jsp");
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
