
package br.ufrpe.assistec.bkp;

import br.ufrpe.assistec.dados.IRepositorioOrdens;
import br.ufrpe.assistec.exceptions.EquipamentoEmServicoException;
import br.ufrpe.assistec.negocio.beans.Cliente;
import br.ufrpe.assistec.negocio.beans.Equipamento;
import br.ufrpe.assistec.negocio.beans.Ordem;
import br.ufrpe.assistec.negocio.beans.Tecnico;

public class RepositorioOrdensArray implements IRepositorioOrdens {
	private Ordem[] ordens;
	private int proxima;

	public RepositorioOrdensArray() {
		this.ordens = new Ordem[100];
		this.proxima = 0;
	}

	public void cadastrar(Ordem os) {
		this.ordens[this.proxima] = os;
		this.proxima++;
	}

	public boolean existe(Ordem os) {
		boolean resultado = false;
		for(int i = 0; i < this.proxima; i++) {
			if(this.ordens[i].getNumero().equals(os.getNumero())) {                 //se o c�digo do livro[i] for igual ao c�digo do livro que passei, resultado = true.
				resultado = true;
			}
		}

		return resultado;
	}

	public Ordem buscar(String numero) {
		Ordem ordem = null;

		for(int i = 0; i < this.proxima; i++) {
			if(this.ordens[i].getNumero().equals(numero)) {
				ordem = new Ordem();
				ordem = this.ordens[i];
			}
		}

		return ordem;
	}

	public void listar() {
		if(this.proxima > 0){
			for(int i = 0; i < this.proxima; i ++) {
				System.out.print(this.ordens[i].toStringTabela());
			}
		}else{
			System.out.println("Nenhuma OS Cadastrada.");
		}	
	}

	public void listarOrdensPorDataEntrada() {
		if(this.proxima > 0){
			for(int i = 0; i < this.proxima; i ++) {
				System.out.print(this.ordens[i].toStringDatas());
			}
		}else{
			System.out.println("Nenhuma OS Cadastrada.");
		}
	}

	/*
	 * Verifica se um equipamento j� est� cadastrado em alguma OS do array.
	 * @param String: n�mero de s�rie da OS.
	 * @return boolean
	 * ps.: faz parte desta classe porque um equipamento pode estar cadastrado no sistema, mas pode n�o estar em nenhuma OS.
	 * J� aqui n�s fazemos a verifica��o se ele est� em uma OS.
	 * As possibilidades de ele estar cadastrado apenas no sistema, sem estar vinculado a alguma OS, ser�o tratadas
	 * em situa��es posteriores no c�digo.
	 * */
	public boolean validarEquipamento(String serie) throws EquipamentoEmServicoException {
		boolean resultado = false;
		Equipamento equip = null;
		String numSerie = null;

		for(int i = 0; i < this.proxima; i++) {
			equip = this.ordens[i].getEquipamento();
			numSerie = equip.getNumeroSerie();
			if(numSerie.equals(serie)) {
				resultado = true;
				throw new EquipamentoEmServicoException(serie);
			}
		}

		return resultado;
	}

	/*Este m�todo permite encontrar um equipamento, associado a uma Ordem, e devolver a inst�ncia dele para o m�todo
	 * que o chamou.*/
	public boolean procurarEquipamento(String serie) {
		boolean resultado = false;
		Equipamento equip = null;
		String numSerie = null;

		for(int i = 0; i < this.proxima; i++) { 
			equip = this.ordens[i].getEquipamento();
			numSerie = equip.getNumeroSerie();
			if(numSerie.equals(serie)) {
				resultado = true;
			}
		}

		return resultado;
	}

	public void remover(String numero) {
		int i = this.procurarIndice(numero);
		if(i == this.proxima - 1) {
			this.ordens[i] = null;
			this.proxima = this.proxima - 1;
			System.out.println("OS removida com sucesso.");
		}else{
			this.ordens[i] = this.ordens[this.proxima - 1];
			this.ordens[this.proxima - 1] = null;
			this.proxima = this.proxima - 1;
			System.out.print("OS removida com sucesso.");
		}
	}

	public int procurarIndice(String numero) {
		int indice = 0, i;
		for(i = 0; i < this.proxima; i++) { 
			if( this.ordens[i].getNumero().equals(numero) ) { 
				indice = i;
				break;
			}
		}

		return indice;
	}

	/*
	 * 
	 * altera um equipamento, cliente ou t�cnico em uma ordem de servi�o. Recebendo a inst�ncia da ordem que se quer alterar.
	 * 
	 * */
	public void alterar(Ordem os, String tipo, Object o) throws EquipamentoEmServicoException {

		switch(tipo) {

		case "equip":
			if(o instanceof Equipamento) {
				Equipamento equip = (Equipamento) o;
				String numSerie = equip.getNumeroSerie();
				os.setEquipamento(equip);

			}

			break;	

		case "cli":
			if(o instanceof Cliente) {
				Cliente cli = (Cliente) o;
				os.setCliente(cli);
			}

			break;

		case "tec":
			if(o instanceof Tecnico) {
				Tecnico tec = (Tecnico) o;
				os.setTecnico(tec);
			}

			break;
		}

	}

	public void listarOrdensPorPrioridade() { 

	}
}
