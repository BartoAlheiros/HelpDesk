/*Levantada quando o n�mero de OS o qual est� se buscando n�o for encontrado no sistema.*/

package br.ufrpe.assistec.exceptions;

public class OSNaoEncontradaException extends Exception {
	public OSNaoEncontradaException(String numero){
		super("Os numero: " + numero + "n�o est� cadastrada no sistema.");
	}
}
