package br.ufrpe.assistec.exceptions;

public class TecnicoJahExisteException extends Exception {
	public TecnicoJahExisteException(String mat, String nome) {
		super("O t�cnico " + nome + "\n Matricula:  " + mat + "j� est� cadastrado no sistema!");
	}
}
