
package com.emergentes.dao;

import com.emergentes.modelo.Tema;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TemaDAO_impl implements TemaDAO{
    
    private Connection conn;

    public TemaDAO_impl(Connection conn) {
        this.conn = conn;
    }
    @Override
    public Tema getById(int id) throws Exception {
        Tema te = new Tema();
        String sql = "SELECT * FROM temas WHERE id_tema=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    te.setId_tema(rs.getInt("id_tema"));
                    te.setDetalle_tema(rs.getString("detalle_tema"));
                }
            }
        }
        return te;
    }

    @Override
    public List<Tema> getAll() throws Exception {
        List<Tema> lista = new ArrayList<>();
        String sql = "SELECT t.*,g.detalle_grado as grado, m.detalle_materia as materia FROM temas t ";
                   sql += "LEFT JOIN grados g ON t.id_grado = g.id_grado ";
                    sql += "LEFT JOIN materias m ON t.id_materia = m.id_materia";
        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Tema te = new Tema();
                te.setId_tema(rs.getInt("id_tema"));
                te.setDetalle_tema(rs.getString("detalle_tema"));
                te.setId_materia(rs.getInt("id_materia"));
                te.setId_grado(rs.getInt("id_grado"));
                te.setMateria(rs.getString("materia"));
                te.setGrado(rs.getString("grado"));
                lista.add(te);
            }
        }
        return lista;
    }
    
}
