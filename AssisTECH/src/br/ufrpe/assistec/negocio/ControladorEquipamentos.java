package br.ufrpe.assistec.negocio;

import br.ufrpe.assistec.bkp.RepositorioEquipamentosArray;
import br.ufrpe.assistec.dados.IRepositorioEquipamentos;
import br.ufrpe.assistec.dados.RepositorioEquipamentoArrayList;
import br.ufrpe.assistec.negocio.beans.Equipamento;
import br.ufrpe.assistec.exceptions.*;

public class ControladorEquipamentos {
	private IRepositorioEquipamentos repositorio;

	public ControladorEquipamentos() {
		this.repositorio = RepositorioEquipamentoArrayList.getInstance();
	}

	/*
	 * Cadastra um equipamento no array de equipamentos, somente se 
	 * n�o existir nenhum equipamento cadastrado com o mesmo n�mero de s�rie do equipamento passado
	 * como par�metro.
	 * 
	 * */
	public void cadastrar(Equipamento e) throws EquipamentoExisteException {

		if(this.existe(e)) {
			throw new EquipamentoExisteException(e.getNumeroSerie());
		}else {
			this.repositorio.cadastrar(e);
		}

	}

	public Equipamento buscar(String numero) throws EquipamentoNaoExisteException{ 
		Equipamento equip = null;
		equip = this.repositorio.buscar(numero);

		if(equip == null) {
			throw new EquipamentoNaoExisteException(numero);
		}

		return equip;
	}

	public void remover(String numero) throws EquipamentoExisteException, EquipamentoNaoExisteException {
		if(this.existeEquipSerie(numero)) {
			((RepositorioEquipamentosArray)this.repositorio).remover(numero);
		}else {
			throw new EquipamentoNaoExisteException(numero);
		}
	}

	public void atualizar(Equipamento equip) throws EquipamentoNaoExisteException {
		((RepositorioEquipamentosArray)this.repositorio).atualizar(equip);
	}

	public boolean existe(Equipamento equip) { 
		return ((RepositorioEquipamentoArrayList)this.repositorio).existe(equip);
	}

	public boolean existeEquipSerie(String numSerie) { 
		return ((RepositorioEquipamentoArrayList)this.repositorio).existe(numSerie);
	}

	public void listar() { 
		this.repositorio.listar();
	}
}
