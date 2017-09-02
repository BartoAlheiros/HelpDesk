package br.ufrpe.assistec.bkp.console;

import br.ufrpe.assistec.negocio.EquipamentoEmServicoException;
import br.ufrpe.assistec.negocio.OSExisteException;
import br.ufrpe.assistec.negocio.ServidorAssisTech;
import br.ufrpe.assistec.negocio.beans.Cliente;
import br.ufrpe.assistec.negocio.beans.Equipamento;
import br.ufrpe.assistec.negocio.beans.Ordem;
import br.ufrpe.assistec.negocio.beans.Tecnico;

import java.util.Scanner;

public class Demo {

	public static void main(String[] args) throws Exception {

		ServidorAssisTech servidor = ServidorAssisTech.getInstance();

		Ordem os = new Ordem();

		//Criando, preenchendo cadastro de cliente e salvando em seu reposit�rio
		Cliente cli = new Cliente("032401127-59", "Jos� Padilha Almeida Caetano", "Rua das Flores, Nova Atalaia, 701, S�o Paulo - SP", "3437-4132", "josepad27@yahoo.com.br", null, 0);
		cli.aumentarNumOrdens();
		servidor.cadastrarCliente(cli);

		Equipamento equipamento = new Equipamento();
		Tecnico tecnico = new Tecnico();

		os.setNumero("123456");
		os.setDataEntrada("24/09/2016");
		os.setPortador("Josias Miguel");

		//Cadastro do equipamento
		equipamento.setTipo("Computador HP 200 G1 Slim Tower");
		equipamento.setNumeroSerie("LW430UA#ABA");
		equipamento.setNumeroDeOrdem(os.getNumero());
		servidor.cadastrarEquipamento(equipamento);

		//cadastrando t�cnico
		tecnico.setNomeCompleto("Cl�udio Ara�jo");
		tecnico.setTelefone("3071-8763");
		tecnico.setEmail("tec_claudio@diginfo.com.br");
		tecnico.aumentarNumOrdens();
		servidor.cadastrarTecnico(tecnico);

		/*Setando os dados na OS.*/
		os.setCliente(cli);
		os.setEquipamento(equipamento);
		os.setTecnico(tecnico);

		os.setCaracteristicasDoDefeito("Equipamento n�o liga. Luz Power n�o acende.");
		os.setRelatorio("Equipamento ainda n�o aberto por um t�cnico.");

		servidor.cadastrarOrdem(os);

		Equipamento equip3 = null;
		equip3 = servidor.buscarEquipamento("LW430UA#ABA");

		Ordem os3 = null;
		os3 = servidor.buscarOrdem("123456");

		System.out.println("OS do equipamento3 eh: " + equip3.getNumeroDeOrdem());
		System.out.println();
		System.out.println(equip3);

		System.out.println("Printando ordem: ");
		System.out.println();
		System.out.println(os3);

		//servidor.listarOrdens();
		System.out.println("\n");

		Ordem os2 = null;
		Scanner input = new Scanner(System.in);

		Equipamento equip2 = new Equipamento();
		os2 = new Ordem();

	//	try {

			os2.setNumero("1234567");
			os2.setDataEntrada("24/09/2016");
			os2.setPortador("Josias Miguel");

			cli.setPrimeiroNome("Jos�");
			cli.setSegundoNome("Caetano");
			cli.setEmail("josepad27@yahoo.com.br");
			cli.setTelefone("3437-4132");

			equip2.setTipo("Computador HP 200 G1 Slim Tower");
			equip2.setNumeroSerie("LW430UA#ABA");
			os2.setEquipamento(equip2);

	/*		//servidor.cadastrarOrdem(os2);

		} catch(OSExisteException existeExcept) {

			System.err.println(existeExcept.getMessage());

		} catch(EquipamentoEmServicoException equipEmServico) {

			System.out.println("cheguei aqui");
			System.err.print(equipEmServico.getMessage());

		}*/
		
		
		servidor.listarOrdens();


	}

}
