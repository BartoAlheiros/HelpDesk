/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufrpe.assistec.negocio.beans;

/**
 *
 * @author BARTOLOMEU.DIAS
 */
public class Funcionario {
    private String matriculaFuncionario;
    private String matriculaSuperv;
    private String Nome;
    private Long CPF;
    private String codUnid_Suporte;
    private Long CNPJ_empregador;
    private int cargaHoraria;

    public String getMatFuncionario() {
        return matriculaFuncionario;
    }

    public void setMatriculaFuncionario(String matriculaFuncionario) {
        this.matriculaFuncionario = matriculaFuncionario;
    }

    public String getMatriculaSuperv() {
        return matriculaSuperv;
    }

    public void setMatriculaSuperv(String matriculaSuperv) {
        this.matriculaSuperv = matriculaSuperv;
    }

    public String getNome() {
        return Nome;
    }

    public void setNome(String Nome) {
        this.Nome = Nome;
    }

    public Long getCPF() {
        return CPF;
    }

    public void setCPF(Long CPF) {
        this.CPF = CPF;
    }

    public String getCodUnid_Suporte() {
        return codUnid_Suporte;
    }

    public void setCodUnid_Suporte(String codUnid_Suporte) {
        this.codUnid_Suporte = codUnid_Suporte;
    }

    public Long getCNPJ_empregador() {
        return CNPJ_empregador;
    }

    public void setCNPJ_empregador(Long CNPJ_empregador) {
        this.CNPJ_empregador = CNPJ_empregador;
    }

    public int getCargaHoraria() {
        return cargaHoraria;
    }

    public void setCargaHoraria(int cargaHoraria) {
        this.cargaHoraria = cargaHoraria;
    }
    
    
}
