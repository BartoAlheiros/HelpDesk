package br.ufrpe.assistec.exceptions;

public class TecnicoNaoCadastradoException extends Exception {
	public TecnicoNaoCadastradoException(String mat) {
		super("O t�cnico com matricula: " + mat + "n�o est� cadastrado no sistema.");
	}
}
