package br.ufrpe.assistec.dados;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import br.ufrpe.assistec.negocio.beans.Cliente;

public class RepositorioClientesArrayList implements IRepositorioClientes, Serializable{
	private List<Cliente> listaClientes = null;
	private static RepositorioClientesArrayList instance;

	private RepositorioClientesArrayList() {
		this.listaClientes = new ArrayList(); 
	}

	public static RepositorioClientesArrayList getInstance() {
		if(instance == null) {
			instance = lerDoArquivo();
		}

		return instance;
	}

	@Override
	public boolean cadastrar(Cliente cliente) {
		List<Cliente> listaClientes = getInstance().listaClientes;
		
		if(!listaClientes.contains(cliente)) {
			getInstance().listaClientes.add(cliente);
			this.salvarArquivo();
			return true;
		}

		return false;

	}

	public boolean existe(Cliente cliente) {
		for(Cliente cli: getInstance().listaClientes) {
			if(cli.equals(cliente)) {
				return true;
			}
		}

		return false;
	}

	@Override
	public Cliente buscaPorCpf(Long cpf) {
		Cliente cliente = null;

		for(Cliente cli: getInstance().listaClientes) {
			if(cli.getCpf().equals(cpf)) {
				cliente = cli;
				break;
			}
		}

		return cliente;
	}

	public boolean buscarPorLogin(String usrName, String pswd) {

		for(Cliente cli: getInstance().listaClientes) {
			if(cli.getUsrName().equals(usrName) && cli.getPasswrd().equals(pswd)) {
				return true;
			}
		}

		return false;
	}

	@Override
	public void remover(Long cpf) {

		for(Cliente cli: getInstance().listaClientes) {
			if(cli.getCpf().equals(cpf)) {
				getInstance().listaClientes.remove(cli);
				this.salvarArquivo();
				break;
			}
		}

	}

	@Override
	public void atualizar(Cliente cli) {
		List<Cliente> listaClientes = getInstance().listaClientes;

		if( getInstance().existe(cli) ){
			listaClientes.set(listaClientes.indexOf(cli), cli);
			this.salvarArquivo();
		}


	}


	private static RepositorioClientesArrayList lerDoArquivo() {
		RepositorioClientesArrayList instanciaLocal = null;

		File in = new File("clientes.dat");
		FileInputStream fis = null;
		ObjectInputStream ois = null;
		try {
			fis = new FileInputStream(in);
			ois = new ObjectInputStream(fis);
			Object o = ois.readObject();
			instanciaLocal = (RepositorioClientesArrayList) o;
		} catch (Exception e) {
			instanciaLocal = new RepositorioClientesArrayList();
		} finally {
			if (ois != null) {
				try {
					ois.close();
				} catch (IOException e) {/* Silent exception */
				}
			}
		}

		return instanciaLocal;
	}

	public void salvarArquivo() {
		if (instance == null) {
			return;
		}
		File out = new File("clientes.dat");
		FileOutputStream fos = null;
		ObjectOutputStream oos = null;

		try {
			fos = new FileOutputStream(out);
			oos = new ObjectOutputStream(fos);
			oos.writeObject(instance);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (oos != null) {
				try { oos.close(); } catch (IOException e) {/*Silent*/}
			}
		}
	}

	public List<Cliente> listarTodos() {
		return getInstance().listaClientes;

	}

	public List<Cliente> listarTodosOrdenadosPorNome() {

		Collections.sort(getInstance().listaClientes);

		return getInstance().listaClientes;

	}

	public static void main(String[] args) {

		RepositorioClientesArrayList repo = RepositorioClientesArrayList.getInstance();

		Cliente cli1 = new Cliente("JoaoSilva", "12791", new Long(1234567), "Jo�o", "Silva", "Rua das Gar�as, 72.", "3493-0282", "joao@gmail.com", 2);
		Cliente cli2 = new Cliente("Claudio", "123", new Long(1234568), "Cl�udio", "Silva", "Rua das Gar�as, 72.", "3493-0282", "joao@gmail.com", 2);
		Cliente cli3 = new Cliente("CSilva", "456", new Long(1234569), "Cristiano", "Silva", "Rua das Gar�as, 72.", "3493-0282", "joao@gmail.com", 2);
		Cliente cli4 = new Cliente("NSilva", "321", new Long(1234561), "Norma", "Silva", "Rua das Gar�as, 72.", "3493-0282", "joao@gmail.com", 2);



		System.out.println("Adicionando CLientes");
		repo.cadastrar(cli1);
		repo.cadastrar(cli2);
		repo.cadastrar(cli3);



		System.out.println("Imprimindo todos os Clientes");
		imprimir(repo.listarTodos());

		System.out.println("Clientes em Ordem Alfab�tica");
		imprimir(repo.listarTodosOrdenadosPorNome());




	}

	public static void imprimir(List<Cliente> listaCli) {
		for(Cliente cli: listaCli) {
			System.out.println(cli);
		}
	}

}
