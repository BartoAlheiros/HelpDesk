package br.ufrpe.assistec.exceptions;

public class EquipamentoExisteException extends Exception {

	private String numSerie;

	public EquipamentoExisteException(String numSerie){
		super("Imposs�vel cadastrar o equipamento " + numSerie +  " \n Um outro equipamento com o mesmo no de S�rie j� est� cadastrado no sistema.");
		this.numSerie = numSerie;
	}

	public EquipamentoExisteException(){

	}

	public String getNumSerie() {
		return numSerie;
	}

	public void setNumSerie(String numSerie) {
		this.numSerie = numSerie;
	}

}
