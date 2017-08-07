package br.ufrpe.assistec.bkp;

import br.ufrpe.assistec.dados.IRepositorioTecnicos;
import br.ufrpe.assistec.negocio.beans.Equipamento;
import br.ufrpe.assistec.negocio.beans.Tecnico;

public class RepositorioTecnicosArray implements IRepositorioTecnicos {
	private Tecnico[] tecnicos;
	private int proximo;

	public RepositorioTecnicosArray() {
		this.tecnicos = new Tecnico[100];
		this.proximo = 0;
	}

	public boolean existe(Tecnico tecnico) {
		boolean resultado = false;

		for(int i = 0; i < this.proximo; i++) {
			if(this.tecnicos[i].getMatricula().equals(tecnico.getMatricula())){
				resultado = true;
			}
		}

		return resultado;
	}


	public void cadastrar(Tecnico tecnico) {
		if(this.existe(tecnico)) {
			//TecnicoJahExisteException
		} else{
			this.tecnicos[this.proximo] = tecnico;
			this.proximo++;
		}
	}

	public void listar() {
		if(this.proximo > 0){
			for(int i = 0; i < this.proximo; i++) {
				System.out.println(tecnicos[i]);
			}
		} else {
			System.out.println("Nenhum tecnico cadastrado.");
		}
	}

	/*buscar: Caso encontre a matr�cula procurada, devolve a inst�ncia de Tecnico que possue tal matr�cula.*/

	public Tecnico buscar(String mat){
		Tecnico tec = null;

		for(int i = 0; i < this.proximo; i++) {
			if(this.tecnicos[i].getMatricula().equals(mat)) {
				tec = new Tecnico();
				tec = this.tecnicos[i];
			}
		}

		return tec;
	}


	public void remover(String matricula) {
		int i = this.procurarIndice(matricula);                          //removerCadastro(String cpf) - remove o cadastro do array de clientes, seguindo as regras
		if(i == this.proximo - 1) {                                            // 1 -  se o cliente for o �ltimo do array, ou seja, se i == this.proximo - 1 
			this.tecnicos[i] = null;                                           // esta posi��o recebe null 
			this.proximo = this.proximo - 1;                                   // o pr�ximo passa a ser ela ou seja: this.proximo = proximo - 1  
			System.out.print("T�cnico Removido com Sucesso.");
		}else{
			this.tecnicos[i] = this.tecnicos[this.proximo - 1];                //Se o cliente n�o for o �ltimo do array
			this.tecnicos[this.proximo -  1] = null;                           //linha 44  o cliente na posi��o i, que eu encontrei, receber� o cliente da �ltima posi��o
			this.proximo = this.proximo - 1;                                   //linha 45 ent�o eu atualizo a �ltima posi��o para null
			System.out.print("T�cnico Removido com Sucesso.");                 // linha 46 eu atualizo o valor de pr�xima para pr�ximo - 1 e a �ltima posi��o passa
		}		                                                                   // a ser a que era pen�ltima, anteriormente.
	}


	public int procurarIndice(String matr) {
		int indice = 0, i;
		for(i = 0; i < this.proximo; i++) { 
			if( this.tecnicos[i].getMatricula().equals(matr) ) { 
				indice = i;
				break;
			}
		}
		if(i == this.proximo) {
			//IndiceNaoEncontradoException
		}

		return indice;
	}

	public int procurarIndice(Tecnico tec) {
		String mat = tec.getMatricula();
		int indice = 0, i;

		for(i = 0; i < this.proximo; i++) { 
			if( this.tecnicos[i].getMatricula().equals(mat) ) { 
				indice = i;
				break;
			}
		}

		return indice;
	} 


	public void atualizar(Tecnico tec) {
		int i;

		i = procurarIndice(tec);
		this.tecnicos[i] = tec;

	}
}
