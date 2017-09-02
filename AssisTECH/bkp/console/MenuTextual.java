package br.ufrpe.assistec.bkp.console;

import java.util.Scanner;

import br.ufrpe.assistec.negocio.ClienteJahCadastradoException;
import br.ufrpe.assistec.negocio.ClienteNaoCadastradoException;
import br.ufrpe.assistec.negocio.EquipamentoEmServicoException;
import br.ufrpe.assistec.negocio.EquipamentoExisteException;
import br.ufrpe.assistec.negocio.EquipamentoNaoExisteException;
import br.ufrpe.assistec.negocio.OSExisteException;
import br.ufrpe.assistec.negocio.OSNaoEncontradaException;
import br.ufrpe.assistec.negocio.ServidorAssisTech;
import br.ufrpe.assistec.negocio.TecnicoNaoCadastradoException;
import br.ufrpe.assistec.negocio.beans.Cliente;
import br.ufrpe.assistec.negocio.beans.Equipamento;
import br.ufrpe.assistec.negocio.beans.Ordem;
import br.ufrpe.assistec.negocio.beans.Tecnico;
import br.ufrpe.assistec.negocio.beans.Usuario;

public class MenuTextual {

	ServidorAssisTech servidor = ServidorAssisTech.getInstance();
	Scanner sc = new Scanner(System.in);


	public void menuPrincipal(int entrada) throws ClienteJahCadastradoException, TecnicoNaoCadastradoException{
		Cliente cli;
		Ordem ordem;

		switch(entrada) {

		
		case 1:
			//Cadastrar Cliente

			cli = this.novoCliente();

			try{
				servidor.cadastrarCliente(cli);
				System.out.println("Cliente Cadastrado com Sucesso!");
			}catch(ClienteJahCadastradoException e0) {
				System.err.println(e0.getMessage());
			}

			break;

		case 2:
			//Buscar Cliente

			cli = this.buscarCliente();
			System.out.println(cli);

			break;

		case 3:
			//Cadastrar T�cnico
			this.cadastrarTecnico();
			
			break;

		case 4:
			//Buscar T�cnico

			Usuario tec_2 = new Tecnico();
			String cpf_2 = null;

			System.out.println("Digite a matr�cula do T�cnico procurado: ");
			cpf_2 = sc.nextLine();
			sc.nextLine(); //Limpa o buffer do teclado

			try{
				tec_2 = servidor.buscarTecnico(cpf_2);
				System.out.println(tec_2);
			}catch(TecnicoNaoCadastradoException e1) {
				System.out.println(e1.getMessage());
			}

			break;

		case 5:
			//Cadastrar Equipamento

			this.cadastrarEquipamento();
			
			break;

		case 6:	
			//Buscar Equipamento

			Equipamento equip_2 = new Equipamento();
			String numSerie = null;

			System.out.println("Digite o n�mero de S�rie do equipamento: ");
			numSerie = sc.nextLine();
			sc.nextLine(); //Limpa o buffer do teclado

			try {
				equip_2 = servidor.buscarEquipamento(numSerie);
				System.out.println(equip_2); // caso ele encontre o equipamento. Ele printa o objetio para o usu�rio.
			}catch(EquipamentoNaoExisteException e3) {
				System.out.println(e3.getMessage());
			}

			break;

		case 7:
			//Nova Ordem
			ordem = this.novaOrdem();
			
			try {
				servidor.cadastrarOrdem(ordem);
			} catch (OSExisteException e) {
				// TODO Auto-generated catch block
				System.err.println(e.getMessage());
			} catch (EquipamentoEmServicoException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			

			break;

		case 8:
			//Buscar Ordem
			
			ordem = this.buscarOrdem();
			System.out.println(ordem);

			break;


		}

	}

	
	public Ordem buscarOrdem() {
		Ordem ordem = new Ordem();
		String numeroDaOrdem;
		boolean entradaInvalida = true;
		
		do{
			System.out.println("Digite o n�mero da Ordem que deseja buscar: ");
			numeroDaOrdem = sc.nextLine();
			sc.nextLine(); // limpa buffer do teclado.
			
			try {
				ordem = servidor.buscarOrdem(numeroDaOrdem);
				entradaInvalida = false;
			} catch (OSNaoEncontradaException e) {
				System.err.println(e.getMessage());
			}
			
		}while(entradaInvalida);
		
		return ordem;
	}
	
	/*cadastrarCliente():
	 * 
	 * Submenu que cadastra um cliente numa ordem*/

	public Cliente cadastrarCliente(Ordem os) {
		int opcao;
		Cliente cli = null;

		do {
			System.out.println("Deseja criar um novo cadastro de Cliente ou buscar no sistema?");

			System.out.println("1 - Cadastrar novo Cliente");
			System.out.println("2 - Utilize Cliente j� cadastrado");
			System.out.println("3 - Sair");

			
			opcao = sc.nextInt();


			switch(opcao) {
			case 1:
				cli = this.novoCliente();

				try{
					servidor.cadastrarCliente(cli);
					System.out.println("Cliente Cadastrado com Sucesso!");
				}catch(ClienteJahCadastradoException e0) {
					System.err.println(e0.getMessage());
				}

				break;

			case 2:
				sc.nextLine();
				cli = this.buscarCliente();

				System.out.println(cli);
				System.out.println("Tem certeza de que deseja utilizar este cliente na Ordem?");
				System.out.println("'S' ou 's' para Sim, 'n' ou 'N' para N�o.");

				String resposta = sc.next();

				if(resposta.equals("s") || resposta.equals("S")) {
					os.setCliente(cli);
					break;
				}else if (resposta.equals("n") || resposta.equals("N")) {
					this.cadastrarCliente(os);
				}

				break;


			}

			if(opcao  > 3) {
				throw new IllegalArgumentException("Op��o Inv�lida!");
			}

		}while(opcao < 3);


		return cli;
	}

	public Cliente novoCliente() {

		String var;

		sc.nextLine();
		System.out.println("Digite o cpf do cliente: ");
		var = sc.nextLine();
		sc.nextLine(); //Limpa o buffer do teclado

		//Criando um cliente, utilizando o Construtor que tem como par�metro a String cpf.
		Cliente cli = new Cliente(var);

		System.out.println("Digite o primeiro nome: ");
		var = sc.nextLine();
		sc.nextLine(); //Limpa o buffer do teclado

		cli.setPrimeiroNome(var);
		
		System.out.println("Digite o segundo nome: ");
		var = sc.nextLine();
		sc.nextLine(); //Limpa o buffer do teclado

		cli.setSegundoNome(var);

		System.out.println("Endere�o: ");
		var = sc.nextLine();
		sc.nextLine(); //Limpa o buffer do teclado

		cli.setEndereco(var);

		System.out.println("Telefone: ");
		var = sc.nextLine();
		sc.nextLine(); //Limpa o buffer do teclado

		cli.setTelefone(var);

		System.out.println("E-mail: ");
		var = sc.nextLine();
		sc.nextLine(); //Limpa o buffer do teclado

		cli.setEmail(var);

		return cli;

	}

	public Cliente buscarCliente() {

		Cliente cli_2 = null;
		String cpf;

		sc.nextLine();
		System.out.println("Digite o cpf: ");
		cpf = sc.nextLine();
		sc.nextLine(); //Limpa o buffer do teclado

		try{
			cli_2 = servidor.buscarCliente(cpf);
		}catch(ClienteNaoCadastradoException e1) {
			System.out.println(e1.getMessage());
		}

		return cli_2;
	}

	public Ordem novaOrdem() throws TecnicoNaoCadastradoException {
		Ordem ordem = new Ordem();
		String var, relatorio;
		int resposta;
		boolean continuar = true, equipamentoNaoCadastrado = true;

		System.out.println("Digite o n�mero da OS: \n");
		var = sc.nextLine();
		sc.nextLine(); //Limpa o buffer do teclado
		ordem.setNumero(var);

		System.out.println("Data de Entrada: \n");
		var = sc.nextLine();
		ordem.setDataEntrada(var);
		sc.nextLine(); //Limpa o buffer do teclado

		System.out.println("Portador: \n");
		var = sc.nextLine();
		sc.nextLine(); //Limpa o buffer do teclado
		ordem.setPortador(var);

		this.cadastrarCliente(ordem);
		
		do{
			
			try {
		
				this.cadastrarEquipamento(ordem);
				equipamentoNaoCadastrado = false;
			} catch (EquipamentoEmServicoException e) {
				System.err.println(e.getMessage());
			}
		
		}while(equipamentoNaoCadastrado);
		
		
		System.out.println("Digite as caracter�sticas do defeito(resumido)");
		var = sc.nextLine();
		ordem.setCaracteristicasDoDefeito(var);
		
		do{
			
			System.out.println("Deseja listar todos os t�cnicos ou digitar uma matr�cula espec�fica?");
			System.out.println("1 - Listar T�cnicos\n");
			System.out.println("2 - Digitar uma matr�cula de T�cnico\n");
			System.out.println("Op��o: ");
			resposta = sc.nextInt();
			sc.nextLine(); //Limpando o buffer do teclado.
			
			if(resposta > 2 || resposta < 1) {
				throw new IllegalArgumentException("Par�metro Inv�lido!");
			}else {
				continuar = false;
			}
			
		}while(continuar);
		
		if(resposta == 1) {
			servidor.listarTecnicos();
			this.associarTecnico(ordem);
		}else if(resposta == 2) {
			this.associarTecnico(ordem);
			
		}
		
		System.out.println("Relat�rio de Manuten��o: \n\n");
		System.out.println("Entre com o relat�rio de Manuten��o: \n");
		relatorio = sc.nextLine();
		sc.nextLine(); // limpando buffer do teclado.
		
		ordem.setRelatorio(relatorio);
		
		return ordem;

	}
	
	public void associarTecnico(Ordem ordem) throws TecnicoNaoCadastradoException {
		
		Tecnico tecnico = new Tecnico();
		String matricula, respostta;
		
		System.out.println("Digite a matr�cula do t�cnico que deseja atrelar � OS: ");
		matricula = sc.nextLine();
		sc.nextLine(); //limpando buffer
		
		tecnico = servidor.buscarTecnico(matricula);
		
		System.out.println(tecnico);
		System.out.println("Tem certeza de que deseja cadastrar este t�cnico na OS?");
		System.out.println("'S' ou 's' para Sim, 'n' ou 'N' para N�o.");
		respostta = sc.nextLine();
		sc.nextLine();
		
		if(respostta.equals("S") || respostta.equals("s")) {
			
			ordem.setTecnico(tecnico);
			System.out.println("T�cnico associado � ordem " + ordem.getNumero());
			
		}else if(respostta.equals("N") || respostta.equals("n")) {
			
			this.associarTecnico(ordem);
		}
	}
	
	/*
	 * Devolve a inst�ncia da ordem recebida como par�metro, com o equipamento cadastrado nela
	 * 
	 * */
	public Ordem cadastrarEquipamento(Ordem ordem) throws EquipamentoEmServicoException {
		
		Equipamento equipamento = new Equipamento();
		String tipoDeEquipamento = null, numeroDeSerie, inserirEquipamento, numeroDeOrdem;
		boolean resposta = true, alternativaInvalida = true;
		int opcao = -1;
		
		
		do{
			System.out.println("Deseja adicionar um equipamento j� existente no sistema � ordem ou criar um novo?");
			System.out.println("1 - Adicionar um equipamento existente");
			System.out.println("2 - Cadastrar um novo equipamento e adicionar � ordem");
			opcao = sc.nextInt();
			sc.nextLine(); // Limpa o buffer do teclado
			
			
			if(opcao == 1){
				System.out.println("Digite o n�mero  de S�rie do equipamento: ");
				numeroDeSerie = sc.nextLine();
				sc.nextLine(); 
				
				try {
					equipamento = servidor.buscarEquipamento(numeroDeSerie);
				} catch (EquipamentoNaoExisteException e) {
					System.err.println(e.getMessage());
				}
				
				numeroDeOrdem = equipamento.getNumeroDeOrdem();
				
				if(numeroDeOrdem.equals("00")){
					
					System.out.println("Equipamento: \n");
					System.out.println(equipamento);
					
					do{
						System.out.println("\n\nTem certeza que deseja inserir o equipamento na ordem?");
						System.out.println("'S' ou 's' para Sim. 'N' ou 'n' para N�o. (Volta ao menu anterior)");
						
						inserirEquipamento = sc.nextLine();
						sc.nextLine();
						
						if(inserirEquipamento.equals("S") || inserirEquipamento.equals("s")) {
							ordem.setEquipamento(equipamento);
							System.out.println("Equipamento inserido na ordem!");
							alternativaInvalida = false;
						}else if(inserirEquipamento.equals("N") || inserirEquipamento.equals("n")) {
							this.cadastrarEquipamento(ordem);
							alternativaInvalida = false;
						}
						
					}while(alternativaInvalida);
					
					resposta = false;
					
				}else {
					throw new EquipamentoEmServicoException(ordem.getNumero());
				}
				
				
				
			}else if(opcao == 2){
				System.out.println("Digite o no de S�rie: ");
				numeroDeSerie = sc.nextLine();
				sc.nextLine(); 

				equipamento.setNumeroSerie(numeroDeSerie);

				System.out.println("Tipo de Equipamento: ");
				tipoDeEquipamento = sc.nextLine();
				sc.nextLine(); 

				equipamento.setTipo(tipoDeEquipamento);
				
				equipamento.setNumeroDeOrdem(ordem.getNumero());

				System.out.println("OS no" + equipamento.getNumeroDeOrdem());

				try {
					servidor.cadastrarEquipamento(equipamento);
				}catch(EquipamentoExisteException e) {
					System.out.println(e.getMessage());
				}
				
				ordem.setEquipamento(equipamento);
				
				resposta = false;
			}else {
				throw new IllegalArgumentException("Par�metro Inv�lido!!");
			}
		}while(resposta);
		
		
		
		return ordem;
	}
	
	public void cadastrarEquipamento() {
		Equipamento equipamento = new Equipamento();
		String numeroDeSerie, tipoDeEquipamento;
		
		
		System.out.println("Digite o no de S�rie: ");
		numeroDeSerie = sc.nextLine();
		sc.nextLine(); 

		equipamento.setNumeroSerie(numeroDeSerie);

		System.out.println("Tipo de Equipamento: ");
		tipoDeEquipamento = sc.nextLine();
		sc.nextLine(); 

		equipamento.setTipo(tipoDeEquipamento);
		
		System.out.println("OS no" + equipamento.getNumeroDeOrdem());

		try {
			servidor.cadastrarEquipamento(equipamento);
			System.out.println("Equipamento Cadastrado com Sucesso.");
		}catch(EquipamentoExisteException e) {
			System.out.println(e.getMessage());
		}
	}
	
	public void cadastrarTecnico() {
		
		String var = null;

		System.out.println("Digite a matr�cula do tecnico: ");
		var = sc.nextLine();
		sc.nextLine(); //Limpa o buffer do teclado

		//Criando um tecnico, utilizando o Construtor que tem como par�metro a String matr�cula.
		Usuario tec = new Tecnico(var);

		System.out.println("Digite o primeiro nome: ");
		var = sc.nextLine();
		sc.nextLine(); //Limpa o buffer do teclado

		tec.setPrimeiroNome(var);
		
		System.out.println("Digite o segundo nome: ");
		var = sc.nextLine();
		sc.nextLine(); //Limpa o buffer do teclado

		tec.setSegundoNome(var);

		System.out.println("Endere�o: ");
		var = sc.nextLine();
		sc.nextLine(); //Limpa o buffer do teclado

		tec.setEndereco(var);

		System.out.println("Telefone: ");
		var = sc.nextLine();
		sc.nextLine(); //Limpa o buffer do teclado

		tec.setTelefone(var);

		System.out.println("E-mail: ");
		var = sc.nextLine();
		sc.nextLine(); //Limpa o buffer do teclado

		tec.setEmail(var);

		servidor.cadastrarTecnico((Tecnico)tec);

		System.out.println("Tecnico Cadastrado com Sucesso!");
		
	}
	
	
}

