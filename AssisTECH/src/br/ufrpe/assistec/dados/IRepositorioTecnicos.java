package br.ufrpe.assistec.dados;

import br.ufrpe.assistec.negocio.beans.Tecnico;

public interface IRepositorioTecnicos {
	
	public boolean cadastrar(Tecnico tecnico);
	
	public Tecnico buscar(String mat);
	
	//public void listar();

	public boolean remover(String matricula);
	
	 /**
     * Atualiza um t�cnico.
     * 
     * @param tec1: t�cnico que deseja colocar no lugar do tec2.
     *            
     * 
     */
	public void atualizar(Tecnico tec1, Tecnico tec2);
	
}
