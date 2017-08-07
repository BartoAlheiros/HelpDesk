package br.ufrpe.assistec.exceptions;

public class EquipamentoEmServicoException extends Exception{
	private String numSerie;

	public EquipamentoEmServicoException(String numSerie) {
		super("O equipamento que voc� est� tentando cadastrar j� faz parte de outra OS.");
		this.numSerie = numSerie;
	}

	public void mostrarEquipamentoOrdem() {

	}
}
