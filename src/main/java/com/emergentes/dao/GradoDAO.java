
package com.emergentes.dao;

import com.emergentes.modelo.Grado;
import java.util.List;


public interface GradoDAO {
    public Grado getById(int id) throws Exception;

    public List<Grado> getAll() throws Exception;
}
