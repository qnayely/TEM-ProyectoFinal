
package com.emergentes.modelo;

public class Usuario {
    private int id;
    private String correo;
    private String password;
    private int id_est;
    private String estudiante;

    public Usuario() {
        this.id = 0;
        this.correo = "";
        this.password = "";
        this.id_est = 0;
        this.estudiante = "";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getId_est() {
        return id_est;
    }

    public void setId_est(int id_est) {
        this.id_est = id_est;
    }

    public String getEstudiante() {
        return estudiante;
    }

    public void setEstudiante(String estudiante) {
        this.estudiante = estudiante;
    }

    @Override
    public String toString() {
        return "Usuario{" + "id=" + id + ", correo=" + correo + ", password=" + password + ", id_est=" + id_est + ", estudiante=" + estudiante + '}';
    }
    
}