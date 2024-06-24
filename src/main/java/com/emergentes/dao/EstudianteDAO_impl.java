package com.emergentes.dao;

import com.emergentes.dao.EstudianteDAO;
import com.emergentes.modelo.Estudiante;
import com.emergentes.utiles.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EstudianteDAO_impl implements EstudianteDAO {

    private Connection conn;

    public EstudianteDAO_impl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public void insert(Estudiante estudiante) throws SQLException {
        String sql = "INSERT INTO estudiantes (nombres, apellidos, edad, id_grado) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, estudiante.getNombres());
            ps.setString(2, estudiante.getApellidos());
            ps.setInt(3, estudiante.getEdad());
            ps.setInt(4, estudiante.getId_grado());
            ps.executeUpdate();

            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    estudiante.setId_est(rs.getInt(1));
                }
            }
        }
    }

    @Override
    public void update(Estudiante estudiante) throws SQLException {
        String sql = "UPDATE estudiantes SET nombres=?, apellidos=?, edad=?, id_grado=? WHERE id_est=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, estudiante.getNombres());
            ps.setString(2, estudiante.getApellidos());
            ps.setInt(3, estudiante.getEdad());
            ps.setInt(4, estudiante.getId_grado());
            ps.setInt(5, estudiante.getId_est());
            ps.executeUpdate();
        }
    }

    @Override
    public void delete(int id) throws SQLException {
        String sql = "DELETE FROM estudiantes WHERE id_est=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }

    @Override
    public Estudiante getById(int id) throws SQLException {
        Estudiante estudiante = null;
        String sql = "SELECT * FROM estudiantes WHERE id_est=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    estudiante = new Estudiante();
                    estudiante.setId_est(rs.getInt("id_est"));
                    estudiante.setNombres(rs.getString("nombres"));
                    estudiante.setApellidos(rs.getString("apellidos"));
                    estudiante.setEdad(rs.getInt("edad"));
                    estudiante.setId_grado(rs.getInt("id_grado"));
                }
            }
        }
        return estudiante;
    }

    @Override
    public List<Estudiante> getAll() throws SQLException {
        List<Estudiante> lista = new ArrayList<>();
        String sql = "SELECT e.*,g.detalle_grado as grado FROM estudiantes e ";
                sql += "LEFT JOIN grados g ON e.id_grado = g.id_grado";
        String qr = "SELECT e.*,g.detalle_grado as grado, u.* FROM estudiantes e ";
                qr+= "LEFT JOIN grados g ON e.id_grado = g.id_grado ";
                qr+= "LEFT JOIN usuarios u ON e.id_est = u.id_est";
        try (PreparedStatement ps = conn.prepareStatement(qr);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Estudiante estudiante = new Estudiante();
                estudiante.setId_est(rs.getInt("id_est"));
                estudiante.setNombres(rs.getString("nombres"));
                estudiante.setApellidos(rs.getString("apellidos"));
                estudiante.setEdad(rs.getInt("edad"));
                estudiante.setId_grado(rs.getInt("id_grado"));
                estudiante.setGrado(rs.getString("grado"));
                estudiante.setId_usr(rs.getInt("id"));
                estudiante.setCorreo(rs.getString("correo"));
                estudiante.setPassword(rs.getString("password"));
                lista.add(estudiante);
            }
        }
        return lista;
    }
}
