
package com.emergentes.dao;

import com.emergentes.modelo.Tema;
import java.util.List;

public interface TemaDAO {
    public Tema getById(int id) throws Exception;

    public List<Tema> getAll() throws Exception;
}
