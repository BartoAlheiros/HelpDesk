/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufrpe.assistec.dados;

import br.ufrpe.assistec.factory.ConexaoMySQL;
import br.ufrpe.assistec.negocio.beans.Funcionario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author BARTOLOMEU.DIAS
 */
public class RepositorioFuncionario implements IRepositorioFuncionario{
    Connection connection = ConexaoMySQL.getConexaoMySQL();
    
    @Override
    public boolean add(Funcionario f) {
        String sql = "insert into funcionario " +
                "(Matricula, Matricula_supervisor, Nome, CPF, CNPJ_empresa, Cod_Unid_Suporte, Login, Senha, Email, Carga_hora) " +
                "values (?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
        } catch (SQLException ex) {
            Logger.getLogger(RepositorioFuncionario.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return true;
    }
    
}
