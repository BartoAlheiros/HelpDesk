/*Levantada caso um cliente for ser adicionado ao sistema. Mas o cpf dele j� consta no Sistema.*/

package br.ufrpe.assistec.exceptions;

public class ClienteJahCadastradoException extends Exception{
	private Long cpf;

	public ClienteJahCadastradoException(Long long1) {
		super("O cpf" + long1 + "j� est� cadastrado no sistema.");
		this.cpf = long1;
	}

	public Long getCpf() {
		return cpf;
	}

	public void setCpf(Long cpf) {
		this.cpf = cpf;
	}

}
