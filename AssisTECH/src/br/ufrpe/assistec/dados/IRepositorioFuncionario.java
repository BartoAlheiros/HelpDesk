/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufrpe.assistec.dados;

import br.ufrpe.assistec.negocio.beans.Cliente;
import br.ufrpe.assistec.negocio.beans.Funcionario;

/**
 *
 * @author BARTOLOMEU.DIAS
 */
public interface IRepositorioFuncionario {
    //adiciona um funcionario ao banco
	public boolean add(Funcionario f);
	
}
