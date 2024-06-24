package com.emergentes.modelo;

public class Tema {
    private int id_tema;
    private String detalle_tema;
    private int id_materia;
    private int id_grado;
    private String materia;
    private String grado;

    public Tema() {
    }

    public int getId_tema() {
        return id_tema;
    }

    public void setId_tema(int id_tema) {
        this.id_tema = id_tema;
    }

    public String getDetalle_tema() {
        return detalle_tema;
    }

    public void setDetalle_tema(String detalle_tema) {
        this.detalle_tema = detalle_tema;
    }

    public int getId_materia() {
        return id_materia;
    }

    public void setId_materia(int id_materia) {
        this.id_materia = id_materia;
    }

    public int getId_grado() {
        return id_grado;
    }

    public void setId_grado(int id_grado) {
        this.id_grado = id_grado;
    }

    public String getMateria() {
        return materia;
    }

    public void setMateria(String materia) {
        this.materia = materia;
    }

    public String getGrado() {
        return grado;
    }

    public void setGrado(String grado) {
        this.grado = grado;
    }

    @Override
    public String toString() {
        return "Tema{" + "id_tema=" + id_tema + ", detalle_tema=" + detalle_tema + ", id_materia=" + id_materia + ", id_grado=" + id_grado + ", materia=" + materia + ", grado=" + grado + '}';
    }
    
    
}
