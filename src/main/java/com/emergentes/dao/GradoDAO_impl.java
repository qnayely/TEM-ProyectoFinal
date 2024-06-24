package com.emergentes.dao;

import com.emergentes.modelo.Grado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class GradoDAO_impl implements GradoDAO {

    private Connection conn;

    public GradoDAO_impl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public Grado getById(int id) throws Exception {
        Grado grado = new Grado();
        String sql = "SELECT * FROM grados WHERE id_grado=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    grado.setId_grado(rs.getInt("id_grado"));
                    grado.setDetalle_grado(rs.getString("detalle_grado"));
                }
            }
        }
        return grado;
    }

    @Override
    public List<Grado> getAll() throws Exception {
        List<Grado> lista = new ArrayList<>();
        String sql = "SELECT * FROM grados";
        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Grado grado = new Grado();
                grado.setId_grado(rs.getInt("id_grado"));
                grado.setDetalle_grado(rs.getString("detalle_grado"));
                lista.add(grado);
            }
        }
        return lista;
    }
}
