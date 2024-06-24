package com.emergentes.controlador;

import com.emergentes.dao.TemaDAO;
import com.emergentes.dao.TemaDAO_impl;
import com.emergentes.modelo.Tema;
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

@WebServlet(name = "TemaControlador", urlPatterns = {"/TemaControlador"})
public class TemaControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (Connection conn = new ConexionDB().conectar()) {
            TemaDAO daoTe = new TemaDAO_impl(conn);
            HttpSession ses = request.getSession();

            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            switch (action) {
                case "view":
                    List<Tema> lista = daoTe.getAll();
                    request.setAttribute("temas", lista);

                    request.getRequestDispatcher("temas.jsp").forward(request, response);
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
        // Implementación del método doPost si es necesario
    }
}
