package com.emergentes.dao;

import com.emergentes.modelo.Materia;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MateriaDAO_impl implements MateriaDAO{
    private Connection conn;

    public MateriaDAO_impl(Connection conn) {
        this.conn = conn;
    }

    public List<Materia> getAll() throws SQLException {
        List<Materia> lista = new ArrayList<>();
        String sql = "SELECT * FROM materias"; // Añadido espacio después de FROM para mejorar claridad
        try (PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Materia materia = new Materia();
                materia.setId_materia(rs.getInt("id_materia"));
                materia.setDetalle_materia(rs.getString("detalle_materia"));
                lista.add(materia);
            }
        }
        return lista;
    }
}
