package br.ufrpe.assistec.exceptions;

public class EquipamentoNaoExisteException extends Exception{
	private String numSerie;

	public EquipamentoNaoExisteException(String numSerie) {
		super("O equipamento " + numSerie + " n�o est� cadastrado no sistema.");
		this.numSerie = numSerie;
	}

	public String getNumSerie() {
		return numSerie;
	}

	public void setNumSerie(String numSerie) {
		this.numSerie = numSerie;
	}


}
