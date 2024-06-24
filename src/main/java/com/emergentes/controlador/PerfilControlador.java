
package com.emergentes.controlador;

import com.emergentes.dao.EstudianteDAO;
import com.emergentes.dao.EstudianteDAO_impl;
import com.emergentes.dao.GradoDAO;
import com.emergentes.dao.GradoDAO_impl;
import com.emergentes.dao.UsuarioDAO;
import com.emergentes.dao.UsuarioDAO_impl;
import com.emergentes.modelo.Estudiante;
import com.emergentes.modelo.Grado;
import com.emergentes.modelo.Usuario;
import com.emergentes.utiles.ConexionDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "PerfilControlador", urlPatterns = {"/PerfilControlador"})
public class PerfilControlador extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (Connection conn = new ConexionDB().conectar()) {
            int id;
            Estudiante est = new Estudiante();
            EstudianteDAO daoEst = new EstudianteDAO_impl(conn);
            
            GradoDAO daoGrado = new GradoDAO_impl(conn);
            List<Grado> listaGrados = null;
            
            int id_usr;
            Usuario usr = new Usuario();
            UsuarioDAO daoUsr= new UsuarioDAO_impl(conn);
            
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            switch (action) {
                case "view":
                    HttpSession ses = request.getSession();
                    int id_est = (int) ses.getAttribute("id_est");
                    request.setAttribute("id_es", id_est);
                    List<Estudiante> lista = daoEst.getAll();
                    request.setAttribute("estudiantes", lista);
                    request.getRequestDispatcher("perfil.jsp").forward(request, response);
                    break;
            }
        } catch (SQLException ex) {
            System.out.println("Error en SQL: " + ex.getMessage());
        } catch (Exception ex) {
            Logger.getLogger(EstudianteControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
