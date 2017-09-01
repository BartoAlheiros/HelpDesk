-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema assistech
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema assistech
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `assistech` DEFAULT CHARACTER SET utf8 ;
USE `assistech` ;

-- -----------------------------------------------------
-- Table `assistech`.`empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`empresa` (
  `CNPJ` VARCHAR(14) NOT NULL,
  `RazaoSocial` VARCHAR(20) NULL DEFAULT NULL,
  `Endereço` VARCHAR(30) NOT NULL,
  `Fone` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`CNPJ`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`unidade_de_suporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`unidade_de_suporte` (
  `CNPJ` VARCHAR(14) NOT NULL,
  `Nro_Funcionarios` INT NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `matriz` VARCHAR(20) NOT NULL,
  `endereço` VARCHAR(30) NOT NULL,
  `Estado` VARCHAR(10) NOT NULL,
  `UF` VARCHAR(2) NOT NULL,
  `RazaoSocial` VARCHAR(20) NOT NULL,
  INDEX `fk_unidade_de_suporte_empresa1_idx` (`CNPJ` ASC),
  PRIMARY KEY (`CNPJ`),
  CONSTRAINT `fk_unidade_de_suporte_empresa1`
    FOREIGN KEY (`CNPJ`)
    REFERENCES `assistech`.`empresa` (`CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`supervisor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`supervisor` (
  `funcionario_matricula` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`funcionario_matricula`),
  CONSTRAINT `fk_supervisor_funcionario1`
    FOREIGN KEY (`funcionario_matricula`)
    REFERENCES `assistech`.`funcionario` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`supervisiona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`supervisiona` (
  `supervisor_matricula` VARCHAR(10) NOT NULL,
  `data_inicio` DATE NOT NULL,
  INDEX `fk_supervisiona_supervisor1_idx` (`supervisor_matricula` ASC),
  PRIMARY KEY (`supervisor_matricula`),
  CONSTRAINT `fk_supervisiona_supervisor1`
    FOREIGN KEY (`supervisor_matricula`)
    REFERENCES `assistech`.`supervisor` (`funcionario_matricula`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assistech`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`funcionario` (
  `matricula` VARCHAR(10) NOT NULL DEFAULT '',
  `Cpf` VARCHAR(14) NOT NULL,
  `supervisor_matricula` VARCHAR(10) NOT NULL,
  `unidade_de_suporte_CNPJ` VARCHAR(14) NOT NULL,
  `Login` VARCHAR(15) NOT NULL,
  `Senha` VARCHAR(8) NOT NULL,
  `Nome` VARCHAR(15) NOT NULL,
  `Cod_Contracheque` VARCHAR(10) NULL DEFAULT NULL,
  `Sequencial_Dependente` VARCHAR(15) NULL DEFAULT NULL,
  `Email` VARCHAR(12) NOT NULL,
  `Carga_hora` INT(10) NULL DEFAULT NULL,
  PRIMARY KEY (`matricula`, `Cpf`),
  UNIQUE INDEX `Matricula_UNIQUE` (`matricula` ASC),
  INDEX `fk_funcionario_unidade_de_suporte1_idx` (`unidade_de_suporte_CNPJ` ASC),
  INDEX `fk_funcionario_supervisiona1_idx` (`supervisor_matricula` ASC),
  CONSTRAINT `fk_funcionario_unidade_de_suporte1`
    FOREIGN KEY (`unidade_de_suporte_CNPJ`)
    REFERENCES `assistech`.`unidade_de_suporte` (`CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcionario_supervisiona1`
    FOREIGN KEY (`supervisor_matricula`)
    REFERENCES `assistech`.`supervisiona` (`supervisor_matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`adm_financeiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`adm_financeiro` (
  `funcionario_matricula` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`funcionario_matricula`),
  INDEX `fk_adm_financeiro_funcionario1_idx` (`funcionario_matricula` ASC),
  CONSTRAINT `fk_adm_financeiro_funcionario1`
    FOREIGN KEY (`funcionario_matricula`)
    REFERENCES `assistech`.`funcionario` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`almoxarifado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`almoxarifado` (
  `ID` VARCHAR(14) NOT NULL,
  `Qtd_total` INT(11) NULL DEFAULT NULL,
  `Entrada_mes` DATE NULL DEFAULT NULL,
  `Saida_mes` DATE NULL DEFAULT NULL,
  `Descricao` VARCHAR(16) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`tecnico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`tecnico` (
  `funcionario_matricula` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`funcionario_matricula`),
  CONSTRAINT `fk_tecnico_funcionario1`
    FOREIGN KEY (`funcionario_matricula`)
    REFERENCES `assistech`.`funcionario` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assistech`.`atendente_solucionador_direcionador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`atendente_solucionador_direcionador` (
  `funcionario_matricula` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`funcionario_matricula`),
  CONSTRAINT `fk_atendente_solucionador_direcionador_tecnico1`
    FOREIGN KEY (`funcionario_matricula`)
    REFERENCES `assistech`.`tecnico` (`funcionario_matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`tecnico_campo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`tecnico_campo` (
  `funcionario_matricula` VARCHAR(10) NOT NULL,
  `tel_movel` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`funcionario_matricula`),
  CONSTRAINT `fk_tecnico_campo_tecnico1`
    FOREIGN KEY (`funcionario_matricula`)
    REFERENCES `assistech`.`tecnico` (`funcionario_matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`cliente` (
  `COD` VARCHAR(15) NOT NULL DEFAULT '',
  `Prioridade` ENUM('Alta','Media','Baixa') NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `fone` VARCHAR(16) NOT NULL,
  `Endereco` VARCHAR(100) NOT NULL,
  `estado` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`COD`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`abre_chamado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`abre_chamado` (
  `cliente_COD` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`cliente_COD`),
  CONSTRAINT `fk_cliente_abre_chamado_cliente1`
    FOREIGN KEY (`cliente_COD`)
    REFERENCES `assistech`.`cliente` (`COD`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assistech`.`chamado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`chamado` (
  `No_Seq` INT(11) NOT NULL DEFAULT '0',
  `Tipo` VARCHAR(30) NOT NULL,
  `Status_` VARCHAR(20) NOT NULL,
  `Descric` VARCHAR(100) NOT NULL,
  `Prioridade` VARCHAR(20) NOT NULL,
  `tecnico_campo_matricula` VARCHAR(10) NOT NULL,
  `cliente_abre_chamado_cliente_COD` VARCHAR(15) NOT NULL,
  `supervisor_funcionario_matricula` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`No_Seq`, `cliente_abre_chamado_cliente_COD`, `supervisor_funcionario_matricula`),
  INDEX `fk_chamado_tecnico_campo1_idx` (`tecnico_campo_matricula` ASC),
  INDEX `fk_chamado_cliente_abre_chamado1_idx` (`cliente_abre_chamado_cliente_COD` ASC),
  INDEX `fk_chamado_supervisor1_idx` (`supervisor_funcionario_matricula` ASC),
  CONSTRAINT `fk_chamado_tecnico_campo1`
    FOREIGN KEY (`tecnico_campo_matricula`)
    REFERENCES `assistech`.`tecnico_campo` (`funcionario_matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_chamado_cliente_abre_chamado1`
    FOREIGN KEY (`cliente_abre_chamado_cliente_COD`)
    REFERENCES `assistech`.`abre_chamado` (`cliente_COD`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_chamado_supervisor1`
    FOREIGN KEY (`supervisor_funcionario_matricula`)
    REFERENCES `assistech`.`supervisor` (`funcionario_matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`orcamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`orcamento` (
  `CodOrcamento` VARCHAR(10) NOT NULL DEFAULT '',
  `DescOrcamento` VARCHAR(50) NOT NULL,
  `DtAbert_Orcto` DATE NOT NULL,
  `DtEmissao_Orcto` DATE NOT NULL,
  `ValidadeEmDias_Orcto` DATE NOT NULL,
  `UltimaData_Orcto` DATE NOT NULL,
  PRIMARY KEY (`CodOrcamento`),
  UNIQUE INDEX `CodOrcamento_UNIQUE` (`CodOrcamento` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`ordem_de_servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`ordem_de_servico` (
  `Num_OS` VARCHAR(10) NOT NULL DEFAULT '',
  `chamado_No_Seq` INT(11) NOT NULL,
  `orcamento_CodOrcamento` VARCHAR(10) NOT NULL,
  `Status_OS` VARCHAR(20) NOT NULL,
  `DataCricao_OS` DATE NOT NULL,
  `Prazo_EmDias_OS` SMALLINT(6) NOT NULL,
  `DtDevida` TINYINT(1) NOT NULL,
  PRIMARY KEY (`Num_OS`, `chamado_No_Seq`, `orcamento_CodOrcamento`),
  INDEX `fk_ordem_de_servico_chamado1_idx` (`chamado_No_Seq` ASC),
  INDEX `fk_ordem_de_servico_orcamento1_idx` (`orcamento_CodOrcamento` ASC),
  CONSTRAINT `fk_ordem_de_servico_chamado1`
    FOREIGN KEY (`chamado_No_Seq`)
    REFERENCES `assistech`.`chamado` (`No_Seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordem_de_servico_orcamento1`
    FOREIGN KEY (`orcamento_CodOrcamento`)
    REFERENCES `assistech`.`orcamento` (`CodOrcamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`tipo_servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`tipo_servico` (
  `Cod_tipo_servico` VARCHAR(15) NOT NULL DEFAULT '',
  `Descricao` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`Cod_tipo_servico`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`servico` (
  `COD` VARCHAR(13) NOT NULL DEFAULT '',
  `COD_Tipo_Servico` VARCHAR(15) NOT NULL,
  `Num_OS` VARCHAR(10) NOT NULL,
  `Status` VARCHAR(20) NOT NULL,
  `Descricao` VARCHAR(255) NOT NULL,
  `Valor` INT NOT NULL,
  PRIMARY KEY (`COD`, `Num_OS`, `COD_Tipo_Servico`),
  INDEX `fk_servico_ordem_de_servico1_idx` (`Num_OS` ASC),
  INDEX `fk_servico_tipo_servico1_idx` (`COD_Tipo_Servico` ASC),
  CONSTRAINT `fk_servico_ordem_de_servico1`
    FOREIGN KEY (`Num_OS`)
    REFERENCES `assistech`.`ordem_de_servico` (`Num_OS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servico_tipo_servico1`
    FOREIGN KEY (`COD_Tipo_Servico`)
    REFERENCES `assistech`.`tipo_servico` (`Cod_tipo_servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`base_problema_kb`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`base_problema_kb` (
  `Id_base_problema_KB` VARCHAR(26) NOT NULL DEFAULT '',
  `servico_COD` VARCHAR(13) NOT NULL,
  `Descricao` VARCHAR(300) NOT NULL,
  `Solucao` VARCHAR(150) NOT NULL,
  `Dt_entrada` DATE NOT NULL,
  `Tempo_necessario` INT NOT NULL,
  `Obs` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Id_base_problema_KB`),
  INDEX `fk_base_problema_kb_servico1_idx` (`servico_COD` ASC),
  CONSTRAINT `fk_base_problema_kb_servico1`
    FOREIGN KEY (`servico_COD`)
    REFERENCES `assistech`.`servico` (`COD`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`categoria` (
  `Cod_categoria` VARCHAR(15) NOT NULL,
  `Descricao` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`Cod_categoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`cliente_fisico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`cliente_fisico` (
  `Cod_Cliente` VARCHAR(15) NOT NULL DEFAULT '',
  `CPF` VARCHAR(11) NOT NULL,
  `Nome` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Cod_Cliente`),
  UNIQUE INDEX `CPF` (`CPF` ASC),
  CONSTRAINT `cliente_fisico_cliente_fk`
    FOREIGN KEY (`Cod_Cliente`)
    REFERENCES `assistech`.`cliente` (`COD`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`cliente_jur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`cliente_jur` (
  `Cod_Cliente` VARCHAR(15) NOT NULL DEFAULT '',
  `CNPJ` VARCHAR(14) NOT NULL,
  `Razao_Social` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Cod_Cliente`),
  UNIQUE INDEX `CNPJ` (`CNPJ` ASC),
  CONSTRAINT `cliente_jur_fk`
    FOREIGN KEY (`Cod_Cliente`)
    REFERENCES `assistech`.`cliente` (`COD`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`tipo_contrato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`tipo_contrato` (
  `ID_Tipo_Contrato` VARCHAR(5) NOT NULL,
  `Descrição` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`ID_Tipo_Contrato`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`contrato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`contrato` (
  `COD_Contrato` VARCHAR(5) NOT NULL DEFAULT '',
  `ID_Tipo_Contrato` VARCHAR(5) NOT NULL,
  `unidade_de_suporte_CNPJ` VARCHAR(14) NOT NULL,
  `DataInicio` DATE NOT NULL,
  `DataFim` DATE NOT NULL,
  `StatusContrato` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`COD_Contrato`),
  INDEX `contrato_ID_Tipo_Contrato_fk` (`ID_Tipo_Contrato` ASC),
  UNIQUE INDEX `ID_Tipo_Contrato_UNIQUE` (`ID_Tipo_Contrato` ASC),
  INDEX `fk_contrato_unidade_de_suporte1_idx` (`unidade_de_suporte_CNPJ` ASC),
  CONSTRAINT `contrato_ID_Tipo_Contrato_fk`
    FOREIGN KEY (`ID_Tipo_Contrato`)
    REFERENCES `assistech`.`tipo_contrato` (`ID_Tipo_Contrato`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_contrato_unidade_de_suporte1`
    FOREIGN KEY (`unidade_de_suporte_CNPJ`)
    REFERENCES `assistech`.`unidade_de_suporte` (`CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`equipamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`equipamento` (
  `Cod_Equipamento` VARCHAR(8) NOT NULL DEFAULT '',
  `Num_OS` VARCHAR(10) NOT NULL,
  `Cod_Contrato` VARCHAR(5) NOT NULL,
  `Fabricante` VARCHAR(30) NOT NULL,
  `Status` ENUM('Bom','Regular','Ruim') NOT NULL,
  `Historico` VARCHAR(40) NULL DEFAULT NULL,
  `Descricao` VARCHAR(50) NOT NULL,
  `Setor` VARCHAR(20) NOT NULL,
  `DataEntrada` DATE NOT NULL,
  `Num_Serie` VARCHAR(11) NULL DEFAULT NULL,
  `IP_Rede` VARCHAR(12) NULL DEFAULT NULL,
  `Mask_Rede` VARCHAR(12) NULL DEFAULT NULL,
  PRIMARY KEY (`Cod_Equipamento`, `Num_OS`),
  INDEX `equipamento_contrato_fk_idx` (`Cod_Contrato` ASC),
  INDEX `fk_equipamento_ordem_de_servico1_idx` (`Num_OS` ASC),
  CONSTRAINT `equipamento_contrato_fk`
    FOREIGN KEY (`Cod_Contrato`)
    REFERENCES `assistech`.`contrato` (`COD_Contrato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipamento_ordem_de_servico1`
    FOREIGN KEY (`Num_OS`)
    REFERENCES `assistech`.`ordem_de_servico` (`Num_OS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`computador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`computador` (
  `Cod_Equipamento` VARCHAR(8) NOT NULL DEFAULT '',
  `Sist_OP` VARCHAR(30) NOT NULL,
  `End_IP` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`Cod_Equipamento`),
  CONSTRAINT `computador_equipamento_fk`
    FOREIGN KEY (`Cod_Equipamento`)
    REFERENCES `assistech`.`equipamento` (`Cod_Equipamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`contracheque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`contracheque` (
  `Codigo` VARCHAR(14) NOT NULL DEFAULT '',
  `admin_financeiro_matricula` VARCHAR(10) NOT NULL,
  `funcionario_matricula` VARCHAR(10) NOT NULL,
  `Data_Contracheque` DATE NOT NULL,
  `Horas_extras` INT(10) NULL DEFAULT 0,
  `Salario_Base` INT(9) NOT NULL,
  `Adicional_Salario` INT(9) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Codigo`),
  INDEX `contracheque_admin_fincanceiro_fk_idx` (`admin_financeiro_matricula` ASC),
  INDEX `contracheque_func_fk` (`funcionario_matricula` ASC),
  CONSTRAINT `contracheque_admin_financeiro_fk`
    FOREIGN KEY (`admin_financeiro_matricula`)
    REFERENCES `assistech`.`adm_financeiro` (`funcionario_matricula`),
  CONSTRAINT `contracheque_func_fk`
    FOREIGN KEY (`funcionario_matricula`)
    REFERENCES `assistech`.`funcionario` (`matricula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`dependente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`dependente` (
  `Sequencial` INT(10) NOT NULL DEFAULT '0',
  `Matricula_Func` VARCHAR(10) NOT NULL DEFAULT '',
  `Sexo` VARCHAR(1) NOT NULL,
  `Data_Nascimento` DATE NOT NULL,
  `Parentesco` VARCHAR(20) NOT NULL,
  `Idade` INT(3) NOT NULL,
  PRIMARY KEY (`Matricula_Func`, `Sequencial`),
  CONSTRAINT `dependente_funcionario_fk`
    FOREIGN KEY (`Matricula_Func`)
    REFERENCES `assistech`.`funcionario` (`matricula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`tipo_despesa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`tipo_despesa` (
  `ID` VARCHAR(7) NOT NULL,
  `dsc` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`despesa_viagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`despesa_viagem` (
  `COD` VARCHAR(10) NOT NULL,
  `tecnico_campo_matricula` VARCHAR(10) NOT NULL,
  `adm_financeiro_matricula` VARCHAR(10) NOT NULL,
  `tipo_despesa_ID` VARCHAR(7) NOT NULL,
  `Valor` MEDIUMINT(9) NOT NULL,
  PRIMARY KEY (`COD`),
  INDEX `fk_despesa_viagem_adm_financeiro1_idx` (`adm_financeiro_matricula` ASC),
  INDEX `fk_despesa_viagem_tipo_despesa1_idx` (`tipo_despesa_ID` ASC),
  INDEX `fk_despesa_viagem_tecnico_campo1_idx` (`tecnico_campo_matricula` ASC),
  CONSTRAINT `fk_despesa_viagem_adm_financeiro1`
    FOREIGN KEY (`adm_financeiro_matricula`)
    REFERENCES `assistech`.`adm_financeiro` (`funcionario_matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_despesa_viagem_tipo_despesa1`
    FOREIGN KEY (`tipo_despesa_ID`)
    REFERENCES `assistech`.`tipo_despesa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_despesa_viagem_tecnico_campo1`
    FOREIGN KEY (`tecnico_campo_matricula`)
    REFERENCES `assistech`.`tecnico_campo` (`funcionario_matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`documento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`documento` (
  `ID_Documento` VARCHAR(10) NOT NULL,
  `contrato_COD_Contrato` VARCHAR(5) NOT NULL,
  `Tipo` VARCHAR(30) NOT NULL,
  `Título` VARCHAR(50) NOT NULL,
  `Data_De_Criação` DATE NOT NULL,
  `Arquivo` VARCHAR(6) NOT NULL,
  `Versão` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`ID_Documento`),
  INDEX `fk_documento_contrato1_idx` (`contrato_COD_Contrato` ASC),
  CONSTRAINT `fk_documento_contrato1`
    FOREIGN KEY (`contrato_COD_Contrato`)
    REFERENCES `assistech`.`contrato` (`COD_Contrato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`estante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`estante` (
  `COD` INT(11) NOT NULL,
  `Descric` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`COD`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`fatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`fatura` (
  `COD` VARCHAR(10) NOT NULL DEFAULT '',
  `Num_OS` VARCHAR(10) NOT NULL,
  `status_` VARCHAR(50) NOT NULL,
  `No_Parcelas` INT(11) NOT NULL,
  `Valor_Total` FLOAT NOT NULL,
  PRIMARY KEY (`COD`, `Num_OS`),
  INDEX `fk_fatura_ordem_de_servico1_idx` (`Num_OS` ASC),
  CONSTRAINT `fk_fatura_ordem_de_servico1`
    FOREIGN KEY (`Num_OS`)
    REFERENCES `assistech`.`ordem_de_servico` (`Num_OS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`insumo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`insumo` (
  `Cod_Insumo` VARCHAR(15) NOT NULL,
  `Cod_categoria_insumo` VARCHAR(15) NOT NULL,
  `Descric` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Cod_Insumo`, `Cod_categoria_insumo`),
  INDEX `fk_insumo_categoria1_idx` (`Cod_categoria_insumo` ASC),
  CONSTRAINT `fk_insumo_categoria1`
    FOREIGN KEY (`Cod_categoria_insumo`)
    REFERENCES `assistech`.`categoria` (`Cod_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`fornecedor` (
  `Cnpj_fornecedor` VARCHAR(10) NOT NULL,
  `Telefone` INT(11) NULL DEFAULT NULL,
  `Razao` VARCHAR(20) NULL DEFAULT NULL,
  `Endereco` VARCHAR(30) NULL DEFAULT NULL,
  `Email` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`Cnpj_fornecedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`fornece`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`fornece` (
  `Cnpj_fornecedor` VARCHAR(10) NOT NULL,
  `Cod_insumo` VARCHAR(10) NOT NULL,
  `Dta` VARCHAR(15) NOT NULL,
  `Valor_unit` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`Cnpj_fornecedor`, `Cod_insumo`),
  INDEX `fornece_fk` (`Cod_insumo` ASC),
  CONSTRAINT `fornece_fk`
    FOREIGN KEY (`Cod_insumo`)
    REFERENCES `assistech`.`insumo` (`Cod_Insumo`),
  CONSTRAINT `fornece_fornecedor_fk`
    FOREIGN KEY (`Cnpj_fornecedor`)
    REFERENCES `assistech`.`fornecedor` (`Cnpj_fornecedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`impressora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`impressora` (
  `Cod_Equip` VARCHAR(8) NOT NULL DEFAULT '',
  `modelo` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Cod_Equip`),
  CONSTRAINT `impressora_equip_fk`
    FOREIGN KEY (`Cod_Equip`)
    REFERENCES `assistech`.`equipamento` (`Cod_Equipamento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`item_estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`item_estoque` (
  `Sequencial_insumo` VARCHAR(16) NOT NULL,
  `Cod_insumo` VARCHAR(15) NOT NULL,
  `Data_entrada` DATE NOT NULL,
  `Data_final` DATE NOT NULL,
  `Data_validade` DATE NOT NULL,
  `Preco_compra` VARCHAR(14) NOT NULL,
  `Qtd_minima` INT(11) NOT NULL,
  `Qtd_atual` INT(11) NOT NULL,
  `Cod_Estante` INT(11) NOT NULL,
  `ID_Almoxarif` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`Cod_insumo`, `Sequencial_insumo`),
  INDEX `item_estoq_estante_fk` (`Cod_Estante` ASC),
  INDEX `item_estoq_almoxarif_fk` (`ID_Almoxarif` ASC),
  CONSTRAINT `insumo_fk`
    FOREIGN KEY (`Cod_insumo`)
    REFERENCES `assistech`.`insumo` (`Cod_Insumo`),
  CONSTRAINT `item_estoq_almoxarif_fk`
    FOREIGN KEY (`ID_Almoxarif`)
    REFERENCES `assistech`.`almoxarifado` (`ID`),
  CONSTRAINT `item_estoq_estante_fk`
    FOREIGN KEY (`Cod_Estante`)
    REFERENCES `assistech`.`estante` (`COD`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`jornada_trabalho`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`jornada_trabalho` (
  `ID` VARCHAR(8) NOT NULL DEFAULT '',
  `funcionario_matricula` VARCHAR(10) NOT NULL,
  `Horario_Inicio` INT(11) NOT NULL,
  `Horario_Fim` INT(11) NOT NULL,
  `Trabalha_Sabado` VARCHAR(5) NOT NULL,
  `Descricao` VARCHAR(60) NULL,
  PRIMARY KEY (`ID`, `funcionario_matricula`),
  INDEX `fk_jornada_trabalho_funcionario1_idx` (`funcionario_matricula` ASC),
  CONSTRAINT `fk_jornada_trabalho_funcionario1`
    FOREIGN KEY (`funcionario_matricula`)
    REFERENCES `assistech`.`funcionario` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`kpi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`kpi` (
  `tecnico_matricula` VARCHAR(10) NOT NULL,
  `Sequencial` INT(11) NOT NULL DEFAULT '0',
  `Kpi_1` VARCHAR(30) NULL DEFAULT NULL,
  `Kpi_2` VARCHAR(30) NULL DEFAULT NULL,
  `Dsc_kpi_1` VARCHAR(100) NULL DEFAULT NULL,
  `Dsc_kpi_2` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`tecnico_matricula`, `Sequencial`),
  INDEX `fk_kpi_tecnico1_idx` (`tecnico_matricula` ASC),
  CONSTRAINT `fk_kpi_tecnico1`
    FOREIGN KEY (`tecnico_matricula`)
    REFERENCES `assistech`.`tecnico` (`funcionario_matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`nobreak`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`nobreak` (
  `Cod_Equip` VARCHAR(8) NOT NULL DEFAULT '',
  `modelo` VARCHAR(20) NOT NULL,
  `kva` INT(11) NOT NULL,
  PRIMARY KEY (`Cod_Equip`),
  CONSTRAINT `nobreak_equip_fk`
    FOREIGN KEY (`Cod_Equip`)
    REFERENCES `assistech`.`equipamento` (`Cod_Equipamento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`parcela_pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`parcela_pagamento` (
  `Seq` INT(11) NOT NULL DEFAULT '0',
  `fatura_COD` VARCHAR(10) NOT NULL,
  `Dta_Pagto` DATE NOT NULL,
  `Dta_Parcela` DATE NOT NULL,
  `vl_pag_parcela` DOUBLE NOT NULL,
  `vl_total` DOUBLE NOT NULL,
  `juros` FLOAT NOT NULL,
  PRIMARY KEY (`Seq`, `fatura_COD`),
  INDEX `fk_parcela_pagamento_fatura1_idx` (`fatura_COD` ASC),
  CONSTRAINT `fk_parcela_pagamento_fatura1`
    FOREIGN KEY (`fatura_COD`)
    REFERENCES `assistech`.`fatura` (`COD`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`tecnico_interno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`tecnico_interno` (
  `funcionario_matricula` VARCHAR(10) NOT NULL,
  `Grau_tecnico` VARCHAR(30) NOT NULL,
  `Ramal` VARCHAR(20) NULL,
  PRIMARY KEY (`funcionario_matricula`),
  CONSTRAINT `fk_tecnico_interno_tecnico1`
    FOREIGN KEY (`funcionario_matricula`)
    REFERENCES `assistech`.`tecnico` (`funcionario_matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`Localizacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`Localizacao` (
  `unidade_de_suporte_CNPJ` VARCHAR(14) NOT NULL,
  `estado` VARCHAR(20) NOT NULL,
  `end` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`unidade_de_suporte_CNPJ`),
  CONSTRAINT `fk_Localizacao_unidade_de_suporte1`
    FOREIGN KEY (`unidade_de_suporte_CNPJ`)
    REFERENCES `assistech`.`unidade_de_suporte` (`CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assistech`.`baseou_em`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`baseou_em` (
  `Id_base_problema_KB` VARCHAR(26) NOT NULL,
  `servico_COD` VARCHAR(13) NOT NULL,
  PRIMARY KEY (`Id_base_problema_KB`, `servico_COD`),
  INDEX `fk_servico_has_base_problema_kb_base_problema_kb1_idx` (`Id_base_problema_KB` ASC),
  INDEX `fk_servico_has_base_problema_kb_servico1_idx` (`servico_COD` ASC),
  CONSTRAINT `fk_servico_has_base_problema_kb_servico1`
    FOREIGN KEY (`servico_COD`)
    REFERENCES `assistech`.`servico` (`COD`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servico_has_base_problema_kb_base_problema_kb1`
    FOREIGN KEY (`Id_base_problema_KB`)
    REFERENCES `assistech`.`base_problema_kb` (`Id_base_problema_KB`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`insumo_usado_servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`insumo_usado_servico` (
  `COD_servico` VARCHAR(13) NOT NULL,
  `COD_Insumo` VARCHAR(15) NOT NULL,
  `qtd` INT NOT NULL,
  PRIMARY KEY (`COD_servico`, `COD_Insumo`),
  INDEX `fk_servico_has_insumo_insumo1_idx` (`COD_Insumo` ASC),
  INDEX `fk_servico_has_insumo_servico1_idx` (`COD_servico` ASC),
  CONSTRAINT `fk_servico_has_insumo_servico1`
    FOREIGN KEY (`COD_servico`)
    REFERENCES `assistech`.`servico` (`COD`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servico_has_insumo_insumo1`
    FOREIGN KEY (`COD_Insumo`)
    REFERENCES `assistech`.`insumo` (`Cod_Insumo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
