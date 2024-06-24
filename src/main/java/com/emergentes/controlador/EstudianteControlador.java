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

@WebServlet(name = "EstudianteControlador", urlPatterns = {"/EstudianteControlador"})
public class EstudianteControlador extends HttpServlet {

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
                case "add":
                    listaGrados = daoGrado.getAll();
                    request.setAttribute("listaGrados", listaGrados);
                    request.setAttribute("estudiante", est);
                    request.setAttribute("usuario", usr);
                    request.getRequestDispatcher("frmestudiante.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id_est"));
                    id_usr = Integer.parseInt(request.getParameter("id"));
                    est = daoEst.getById(id);
                    usr = daoUsr.getById(id_usr);
                    request.setAttribute("estudiante", est);
                    listaGrados = daoGrado.getAll();
                    request.setAttribute("listaGrados", listaGrados);
                    request.setAttribute("usuario", usr);
                    request.getRequestDispatcher("frmestudiante.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    daoEst.delete(id);
                    response.sendRedirect("EstudianteControlador");
                    break;
                case "view":
                    List<Estudiante> lista = daoEst.getAll();
                    request.setAttribute("estudiantes", lista);
                    request.getRequestDispatcher("estudiantes.jsp").forward(request, response);
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
        try (Connection conn = new ConexionDB().conectar()) {
            conn.setAutoCommit(false);  // Deshabilitar auto-commit para manejar transacciones manualmente
            try {
                int id_est = Integer.parseInt(request.getParameter("id_est"));
                String nombres = request.getParameter("nombres");
                String apellidos = request.getParameter("apellidos");
                int edad = Integer.parseInt(request.getParameter("edad"));
                int id_grado = Integer.parseInt(request.getParameter("id_grado"));

                int id_usr = Integer.parseInt(request.getParameter("id"));
                String correo = request.getParameter("correo");
                String password = request.getParameter("password");
                int id_est_usuario = Integer.parseInt(request.getParameter("id_est_usuario"));

                Estudiante est = new Estudiante();
                EstudianteDAO daoEst = new EstudianteDAO_impl(conn);
                Usuario usr = new Usuario();
                UsuarioDAO daoUsr = new UsuarioDAO_impl(conn);

                est.setId_est(id_est);
                est.setNombres(nombres);
                est.setApellidos(apellidos);
                est.setEdad(edad);
                est.setId_grado(id_grado);

                usr.setId(id_usr);
                usr.setCorreo(correo);
                usr.setPassword(password);
                usr.setId_est(id_est);

                if (id_est == 0) {
                    // Insertar Estudiante y luego Usuario
                    daoEst.insert(est);
                    id_est = est.getId_est();
                    usr.setId_est(id_est);
                    daoUsr.insert(usr);
                } else {
                    // Actualizar Estudiante y Usuario
                    daoEst.update(est);
                    daoUsr.update(usr);
                }

                conn.commit();  // Confirmar la transacción
                response.sendRedirect("LoginControlador");
            } catch (Exception ex) {
                conn.rollback();  // Revertir la transacción en caso de error
                throw new ServletException("Error en transacción: " + ex.getMessage(), ex);
            } finally {
                conn.setAutoCommit(true);  // Restaurar auto-commit
            }
        } catch (SQLException ex) {
            throw new ServletException("Error al conectar con la base de datos: " + ex.getMessage(), ex);
        }
    }
}
