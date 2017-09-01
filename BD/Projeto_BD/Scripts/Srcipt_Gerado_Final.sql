-- MySQL Workbench Synchronization
-- Generated: 2017-08-05 18:17
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: BARTOLOMEU.DIAS

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

use assistech;

DROP SCHEMA IF EXISTS `mydb` ;

ALTER TABLE `assistech`.`adm_financeiro` 
DROP FOREIGN KEY `adm_financeiro_funcionario_fk`;

ALTER TABLE `assistech`.`atendente_solucionador_direcionador` 
DROP FOREIGN KEY `atendente_solucionador_direcionador_funcionario_fk`;

ALTER TABLE `assistech`.`cliente_fisico` 
DROP FOREIGN KEY `cliente_fisico_cliente_fk`;

ALTER TABLE `assistech`.`cliente_jur` 
DROP FOREIGN KEY `cliente_jur_fk`;

ALTER TABLE `assistech`.`computador` 
DROP FOREIGN KEY `computador_equipamento_fk`;

ALTER TABLE `assistech`.`contracheque` 
DROP FOREIGN KEY `contracheque_admin_financeiro_fk`,
DROP FOREIGN KEY `contracheque_func_fk`;

ALTER TABLE `assistech`.`contrato` 
DROP FOREIGN KEY `contrato_ID_Documento_fk`;

ALTER TABLE `assistech`.`equipamento` 
DROP FOREIGN KEY `equipamento_contrato_fk`;


-- -----------------------------------------------------
-- Table `assistech`.`funcionario`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `assistech`.`funcionario` (
  `matricula` VARCHAR(10) NOT NULL DEFAULT '',
  `Cpf` VARCHAR(14) NOT NULL,
  `Matricula_supervisor` VARCHAR(10) NOT NULL,
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
  INDEX `fk_funcionario_supervisiona1_idx` (`Matricula_supervisor` ASC),
  CONSTRAINT `fk_funcionario_supervisiona1`
    FOREIGN KEY (`Matricula_supervisor`)
    REFERENCES `assistech`.`supervisiona` (`Matricula_supervisor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

ALTER TABLE funcionario
	add INDEX fk_funcionario_unidade_de_suporte_idx (unidade_de_suporte_CNPJ ASC),
	add constraint fk_funcionario_unid_suporte foreign key(unidade_de_suporte_CNPJ)
    references unidade_de_suporte(CNPJ) 
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

ALTER TABLE `assistech`.`item_estoque` DROP FOREIGN KEY `item_estoq_almoxarif_fk`,

DROP FOREIGN KEY `item_estoq_estante_fk`;

ALTER TABLE `assistech`.`kpi` 
DROP FOREIGN KEY `kpi_tecnico_fk`;

ALTER TABLE `assistech`.`ordem_de_servico` 
DROP FOREIGN KEY `orcamento_ordem_fk`;

ALTER TABLE `assistech`.`supervisor` 
DROP FOREIGN KEY `funcionario_supervisor_fk`;

ALTER TABLE `assistech`.`tecnico_campo` 
DROP FOREIGN KEY `funcionario_tecnico_campo_fk`;

ALTER TABLE `assistech`.`tecnico_interno` 
DROP FOREIGN KEY `tecnico_interno_funcionario_fk`;

ALTER TABLE `assistech`.`tipo_despesa` 
DROP FOREIGN KEY `tipo_despesa_desp_viag_fk`;

ALTER TABLE `assistech`.`tecnico` 
DROP FOREIGN KEY `funcionario_tecnico_fk`;

#ALTER TABLE `assistech`.`adm_financeiro` 
#DROP COLUMN `Cod_Contracheque`,
#DROP COLUMN `Cod_Desp_Viag`,
#DROP COLUMN `Matricula`,
#ADD COLUMN `funcionario_matricula` VARCHAR(10) NOT NULL FIRST;

#ALTER TABLE `assistech`.`adm_financeiro`
#DROP PRIMARY KEY,
#ADD PRIMARY KEY (`funcionario_matricula`),
#ADD INDEX `fk_adm_financeiro_funcionario1_idx` (`funcionario_matricula` ASC),
#DROP INDEX `adm_fincanceiro_contracheque` ;

ALTER TABLE `assistech`.`almoxarifado` 
CHANGE COLUMN `COD_ID` `ID` VARCHAR(14) NOT NULL ;

ALTER TABLE `assistech`.`atendente_solucionador_direcionador` 
DROP COLUMN `Matricula_funcionario`,
ADD COLUMN `funcionario_matricula` VARCHAR(10) NOT NULL FIRST,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`funcionario_matricula`);

CREATE TABLE IF NOT EXISTS `assistech`.`base_problema_kb` (
  `Id_base_problema_KB` VARCHAR(26) NOT NULL DEFAULT '',
  `servico_COD` VARCHAR(13) NOT NULL,
  `Descricao` VARCHAR(300) NOT NULL,
  `Solucao` VARCHAR(150) NOT NULL,
  `Dt_entrada` DATE NOT NULL,
  `Tempo_necessario` INT(11) NOT NULL,
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

ALTER TABLE `assistech`.`categoria` 
CHANGE COLUMN `Descricao` `Descricao` VARCHAR(12) NOT NULL ;

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

ALTER TABLE `assistech`.`cliente` 
CHANGE COLUMN `COD` `COD` VARCHAR(15) NOT NULL DEFAULT '' ,
CHANGE COLUMN `Prioridade` `Prioridade` ENUM('Alta','Media','Baixa') NOT NULL ,
CHANGE COLUMN `Endereco` `Endereco` VARCHAR(100) NOT NULL ,
CHANGE COLUMN `UF_Estado` `estado` VARCHAR(50) NOT NULL ,
ADD COLUMN `email` VARCHAR(45) NOT NULL AFTER `Prioridade`,
ADD COLUMN `fone` VARCHAR(16) NOT NULL AFTER `email`;

ALTER TABLE `assistech`.`cliente_fisico` 
CHANGE COLUMN `Cod_Cliente` `Cod_Cliente` VARCHAR(15) NOT NULL DEFAULT '' ,
CHANGE COLUMN `Nome` `Nome` VARCHAR(50) NOT NULL ;

ALTER TABLE `assistech`.`cliente_jur` 
CHANGE COLUMN `Cod_Cliente` `Cod_Cliente` VARCHAR(15) NOT NULL DEFAULT '' ,
CHANGE COLUMN `Razao_Social` `Razao_Social` VARCHAR(50) NOT NULL ;

ALTER TABLE `assistech`.`computador` 
CHANGE COLUMN `Sist_OP` `Sist_OP` VARCHAR(30) NOT NULL ,
ADD COLUMN `End_IP` VARCHAR(15) NOT NULL AFTER `Sist_OP`;

ALTER TABLE `assistech`.`contracheque` 
CHANGE COLUMN `Matricula_Admin_Financeiro` `admin_financeiro_matricula` VARCHAR(10) NOT NULL ,
CHANGE COLUMN `Mat_Funcionario` `funcionario_matricula` VARCHAR(10) NOT NULL ,
CHANGE COLUMN `Data_Contracheque` `Data_Contracheque` DATE NOT NULL ,
CHANGE COLUMN `Horas_extras` `Horas_extras` INT(10) NULL DEFAULT 0 ,
CHANGE COLUMN `Salario_Base` `Salario_Base` INT(9) NOT NULL ,
CHANGE COLUMN `Adicional_Salario` `Adicional_Salario` INT(9) NOT NULL DEFAULT 0 ;

ALTER TABLE `assistech`.`contrato` 
DROP COLUMN `ID_Documento`,
CHANGE COLUMN `ID_Tipo_Contrato` `ID_Tipo_Contrato` VARCHAR(5) NOT NULL AFTER `COD_Contrato`,
CHANGE COLUMN `DataInicio` `DataInicio` DATE NOT NULL ,
CHANGE COLUMN `DataFim` `DataFim` DATE NOT NULL ,
CHANGE COLUMN `StatusContrato` `StatusContrato` VARCHAR(30) NOT NULL ,
ADD COLUMN `unidade_de_suporte_CNPJ` VARCHAR(14) NOT NULL AFTER `ID_Tipo_Contrato`,
ADD INDEX `fk_contrato_unidade_de_suporte1_idx` (`unidade_de_suporte_CNPJ` ASC),
DROP INDEX `contrato_ID_Documento_fk` ;

ALTER TABLE `assistech`.`dependente` 
CHANGE COLUMN `Sequencial` `Sequencial` INT(10) NOT NULL DEFAULT '0' ,
CHANGE COLUMN `Sexo` `Sexo` VARCHAR(1) NOT NULL ,
CHANGE COLUMN `Data_Nascimento` `Data_Nascimento` DATE NOT NULL ,
CHANGE COLUMN `Parentesco` `Parentesco` VARCHAR(20) NOT NULL ,
CHANGE COLUMN `Idade` `Idade` INT(3) NOT NULL ;

ALTER TABLE `assistech`.`despesa_viagem` 
ADD COLUMN `tecnico_campo_matricula` VARCHAR(10) NOT NULL AFTER `COD`,
ADD COLUMN `adm_financeiro_matricula` VARCHAR(10) NOT NULL AFTER `tecnico_campo_matricula`,
ADD COLUMN `tipo_despesa_ID` VARCHAR(7) NOT NULL AFTER `adm_financeiro_matricula`,
ADD INDEX `fk_despesa_viagem_adm_financeiro1_idx` (`adm_financeiro_matricula` ASC),
ADD INDEX `fk_despesa_viagem_tipo_despesa1_idx` (`tipo_despesa_ID` ASC),
ADD INDEX `fk_despesa_viagem_tecnico_campo1_idx` (`tecnico_campo_matricula` ASC);

ALTER TABLE `assistech`.`documento` 
CHANGE COLUMN `Tipo` `Tipo` VARCHAR(30) NOT NULL ,
CHANGE COLUMN `Título` `Título` VARCHAR(50) NOT NULL ,
CHANGE COLUMN `Data_De_Criação` `Data_De_Criação` DATE NOT NULL ,
CHANGE COLUMN `Arquivo` `Arquivo` VARCHAR(6) NOT NULL ,
CHANGE COLUMN `Versão` `Versão` VARCHAR(5) NOT NULL ,
ADD COLUMN `contrato_COD_Contrato` VARCHAR(5) NOT NULL AFTER `ID_Documento`,
ADD INDEX `fk_documento_contrato1_idx` (`contrato_COD_Contrato` ASC);

ALTER TABLE `assistech`.`empresa` 
CHANGE COLUMN `CNPJ` `CNPJ` VARCHAR(14) NOT NULL ,
CHANGE COLUMN `Endereço` `Endereço` VARCHAR(30) NOT NULL ,
CHANGE COLUMN `Fone` `Fone` VARCHAR(15) NOT NULL ;

ALTER TABLE `assistech`.`equipamento` 
DROP COLUMN `Modelo`,
CHANGE COLUMN `Cod_Contrato` `Cod_Contrato` VARCHAR(5) NOT NULL ,
ADD COLUMN `Num_OS` VARCHAR(10) NOT NULL AFTER `Cod_Equipamento`,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`Cod_Equipamento`, `Num_OS`),
ADD INDEX `fk_equipamento_ordem_de_servico1_idx` (`Num_OS` ASC);

ALTER TABLE `assistech`.`estante` 
DROP COLUMN `COD_ID_Almoxarif`;

CREATE TABLE IF NOT EXISTS `assistech`.`fatura` (
  `COD` VARCHAR(10) NOT NULL DEFAULT '',
  `Num_OS` VARCHAR(10) NOT NULL,
  `status_` VARCHAR(50) NOT NULL,
  `No_Parcelas` INT(11) NOT NULL,
  `Valor_Total` FLOAT(11) NOT NULL,
  PRIMARY KEY (`COD`, `Num_OS`),
  INDEX `fk_fatura_ordem_de_servico1_idx` (`Num_OS` ASC),
  CONSTRAINT `fk_fatura_ordem_de_servico1`
    FOREIGN KEY (`Num_OS`)
    REFERENCES `assistech`.`ordem_de_servico` (`Num_OS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `assistech`.`impressora` (
  `Cod_Equip` VARCHAR(8) NOT NULL DEFAULT '',
  `modelo` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Cod_Equip`),
  CONSTRAINT `impressora_equip_fk`
    FOREIGN KEY (`Cod_Equip`)
    REFERENCES `assistech`.`equipamento` (`Cod_Equipamento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

ALTER TABLE `assistech`.`item_estoque` 
CHANGE COLUMN `Data_entrada` `Data_entrada` DATE NOT NULL ,
CHANGE COLUMN `Data_final` `Data_final` DATE NOT NULL ,
CHANGE COLUMN `Data_valida` `Data_validade` DATE NOT NULL ,
CHANGE COLUMN `Preco_compra` `Preco_compra` VARCHAR(14) NOT NULL ,
CHANGE COLUMN `Qtd_minima` `Qtd_minima` INT(11) NOT NULL ,
CHANGE COLUMN `Qtd_atual` `Qtd_atual` INT(11) NOT NULL ,
CHANGE COLUMN `Cod_Estante` `Cod_Estante` INT(11) NOT NULL ,
CHANGE COLUMN `Cod_Almoxarif` `ID_Almoxarif` VARCHAR(14) NOT NULL ;

ALTER TABLE `assistech`.`jornada_trabalho` 
CHANGE COLUMN `Horario_Inicio` `Horario_Inicio` INT(11) NOT NULL ,
CHANGE COLUMN `Horario_Fim` `Horario_Fim` INT(11) NOT NULL ,
CHANGE COLUMN `Trabalha_Sabado` `Trabalha_Sabado` VARCHAR(5) NOT NULL ,
CHANGE COLUMN `Descricao` `Descricao` VARCHAR(60) NULL DEFAULT NULL ,
ADD COLUMN `funcionario_matricula` VARCHAR(10) NOT NULL AFTER `ID`,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`ID`, `funcionario_matricula`),
ADD INDEX `fk_jornada_trabalho_funcionario1_idx` (`funcionario_matricula` ASC);

ALTER TABLE `assistech`.`kpi` 
DROP COLUMN `Matricula_tecnico`,
ADD COLUMN `tecnico_matricula` VARCHAR(10) NOT NULL FIRST,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`tecnico_matricula`, `Sequencial`),
ADD INDEX `fk_kpi_tecnico1_idx` (`tecnico_matricula` ASC),
DROP INDEX `kpi_tecnico_fk` ;

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

ALTER TABLE `assistech`.`orcamento` 
CHANGE COLUMN `DescOrcamento` `DescOrcamento` VARCHAR(50) NOT NULL ,
CHANGE COLUMN `DtAbert_Orcto` `DtAbert_Orcto` DATE NOT NULL ,
CHANGE COLUMN `DtEmissao_Orcto` `DtEmissao_Orcto` DATE NOT NULL ,
CHANGE COLUMN `ValidadeEmDias_Orcto` `ValidadeEmDias_Orcto` DATE NOT NULL ,
CHANGE COLUMN `UltimaData_Orcto` `UltimaData_Orcto` DATE NOT NULL ;

ALTER TABLE `assistech`.`ordem_de_servico` 
DROP COLUMN `Cod_Orcamento`,
CHANGE COLUMN `Status_OS` `Status_OS` VARCHAR(20) NOT NULL ,
CHANGE COLUMN `DataCricao_OS` `DataCricao_OS` DATE NOT NULL ,
CHANGE COLUMN `Prazo_EmDias_OS` `Prazo_EmDias_OS` SMALLINT(6) NOT NULL ,
CHANGE COLUMN `DtDevida` `DtDevida` TINYINT(1) NOT NULL ,
ADD COLUMN `chamado_No_Seq` INT(11) NOT NULL AFTER `Num_OS`,
ADD COLUMN `orcamento_CodOrcamento` VARCHAR(10) NOT NULL AFTER `chamado_No_Seq`,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`Num_OS`, `chamado_No_Seq`, `orcamento_CodOrcamento`),
ADD INDEX `fk_ordem_de_servico_chamado1_idx` (`chamado_No_Seq` ASC),
ADD INDEX `fk_ordem_de_servico_orcamento1_idx` (`orcamento_CodOrcamento` ASC),
DROP INDEX `Cod_Orcamento_UNIQUE` ;

CREATE TABLE IF NOT EXISTS `assistech`.`parcela_pagamento` (
  `Seq` INT(11) NOT NULL DEFAULT '0',
  `fatura_COD` VARCHAR(10) NOT NULL,
  `Dta_Pagto` DATE NOT NULL,
  `Dta_Parcela` DATE NOT NULL,
  `vl_pag_parcela` DOUBLE NOT NULL,
  `vl_total` DOUBLE NOT NULL,
  `juros` FLOAT(11) NOT NULL,
  PRIMARY KEY (`Seq`, `fatura_COD`),
  INDEX `fk_parcela_pagamento_fatura1_idx` (`fatura_COD` ASC),
  CONSTRAINT `fk_parcela_pagamento_fatura1`
    FOREIGN KEY (`fatura_COD`)
    REFERENCES `assistech`.`fatura` (`COD`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `assistech`.`servico` (
  `COD` VARCHAR(13) NOT NULL DEFAULT '',
  `COD_Tipo_Servico` VARCHAR(15) NOT NULL,
  `Num_OS` VARCHAR(10) NOT NULL,
  `Status` VARCHAR(20) NOT NULL,
  `Descricao` VARCHAR(255) NOT NULL,
  `Valor` INT(11) NOT NULL,
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

ALTER TABLE `assistech`.`supervisor` 
DROP COLUMN `Matricula_funcionario`,
ADD COLUMN `funcionario_matricula` VARCHAR(10) NOT NULL FIRST,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`funcionario_matricula`);

ALTER TABLE `assistech`.`tecnico_campo` 
DROP COLUMN `Matricula_funcionario`,
CHANGE COLUMN `Telefone_movel` `tel_movel` VARCHAR(14) NOT NULL ,
ADD COLUMN `funcionario_matricula` VARCHAR(10) NOT NULL FIRST,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`funcionario_matricula`);

ALTER TABLE `assistech`.`tecnico_interno` 
DROP COLUMN `Matricula_funcionario`,
ADD COLUMN `funcionario_matricula` VARCHAR(10) NOT NULL FIRST,
CHANGE COLUMN `Grau_tecnico` `Grau_tecnico` VARCHAR(30) NOT NULL AFTER `funcionario_matricula`,
CHANGE COLUMN `Ramal` `Ramal` VARCHAR(20) NULL DEFAULT NULL ,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`funcionario_matricula`);

ALTER TABLE `assistech`.`tipo_despesa` 
DROP COLUMN `Cod_Despesa`,
DROP INDEX `tipo_despesa_desp_viag_fk` ;

CREATE TABLE IF NOT EXISTS `assistech`.`tipo_servico` (
  `Cod_tipo_servico` VARCHAR(15) NOT NULL DEFAULT '',
  `Descricao` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`Cod_tipo_servico`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

ALTER TABLE `assistech`.`unidade_de_suporte` 
DROP COLUMN `COD`,
CHANGE COLUMN `Matriz` `matriz` VARCHAR(20) NOT NULL AFTER `nome`,
CHANGE COLUMN `Endereço` `endereço` VARCHAR(30) NOT NULL AFTER `matriz`,
CHANGE COLUMN `Nome` `nome` VARCHAR(50) NOT NULL ,
ADD COLUMN `Nro_Funcionarios` INT(11) NOT NULL AFTER `CNPJ`,
ADD INDEX `fk_unidade_de_suporte_empresa1_idx` (`CNPJ` ASC),
DROP PRIMARY KEY,
ADD PRIMARY KEY (`CNPJ`);

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
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

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
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

ALTER TABLE `assistech`.`tecnico` 
DROP COLUMN `Matricula_funcionario`,
ADD COLUMN `funcionario_matricula` VARCHAR(10) NOT NULL FIRST,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`funcionario_matricula`);

CREATE TABLE IF NOT EXISTS `assistech`.`abre_chamado` (
  `cliente_COD` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`cliente_COD`),
  CONSTRAINT `fk_cliente_abre_chamado_cliente1`
    FOREIGN KEY (`cliente_COD`)
    REFERENCES `assistech`.`cliente` (`COD`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

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

CREATE TABLE IF NOT EXISTS `assistech`.`insumo_usado_servico` (
  `COD_servico` VARCHAR(13) NOT NULL,
  `COD_Insumo` VARCHAR(15) NOT NULL,
  `qtd` INT(11) NOT NULL,
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

DROP TABLE IF EXISTS `assistech`.`supervisao` ;

DROP TABLE IF EXISTS `assistech`.`cliente_contato` ;

DROP TABLE IF EXISTS `assistech`.`unid_suporte_tem_funcionario` ;

ALTER TABLE `assistech`.`atendente_solucionador_direcionador` 
ADD CONSTRAINT `fk_atendente_solucionador_direcionador_tecnico1`
  FOREIGN KEY (`funcionario_matricula`)
  REFERENCES `assistech`.`tecnico` (`funcionario_matricula`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `assistech`.`cliente_fisico` 
ADD CONSTRAINT `cliente_fisico_cliente_fk`
  FOREIGN KEY (`Cod_Cliente`)
  REFERENCES `assistech`.`cliente` (`COD`);

ALTER TABLE `assistech`.`cliente_jur` 
ADD CONSTRAINT `cliente_jur_fk`
  FOREIGN KEY (`Cod_Cliente`)
  REFERENCES `assistech`.`cliente` (`COD`);

ALTER TABLE `assistech`.`computador` 
ADD CONSTRAINT `computador_equipamento_fk`
  FOREIGN KEY (`Cod_Equipamento`)
  REFERENCES `assistech`.`equipamento` (`Cod_Equipamento`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `assistech`.`contrato` 
ADD CONSTRAINT `fk_contrato_unidade_de_suporte1`
  FOREIGN KEY (`unidade_de_suporte_CNPJ`)
  REFERENCES `assistech`.`unidade_de_suporte` (`CNPJ`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `assistech`.`despesa_viagem` 
ADD CONSTRAINT `fk_despesa_viagem_adm_financeiro1`
  FOREIGN KEY (`adm_financeiro_matricula`)
  REFERENCES `assistech`.`adm_financeiro` (`funcionario_matricula`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_despesa_viagem_tipo_despesa1`
  FOREIGN KEY (`tipo_despesa_ID`)
  REFERENCES `assistech`.`tipo_despesa` (`ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_despesa_viagem_tecnico_campo1`
  FOREIGN KEY (`tecnico_campo_matricula`)
  REFERENCES `assistech`.`tecnico_campo` (`funcionario_matricula`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `assistech`.`documento` 
ADD CONSTRAINT `fk_documento_contrato1`
  FOREIGN KEY (`contrato_COD_Contrato`)
  REFERENCES `assistech`.`contrato` (`COD_Contrato`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `assistech`.`equipamento` 
ADD CONSTRAINT `equipamento_contrato_fk`
  FOREIGN KEY (`Cod_Contrato`)
  REFERENCES `assistech`.`contrato` (`COD_Contrato`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_equipamento_ordem_de_servico1`
  FOREIGN KEY (`Num_OS`)
  REFERENCES `assistech`.`ordem_de_servico` (`Num_OS`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `assistech`.`insumo` 
ADD CONSTRAINT `fk_insumo_categoria1`
  FOREIGN KEY (`Cod_categoria_insumo`)
  REFERENCES `assistech`.`categoria` (`Cod_categoria`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `assistech`.`item_estoque` 
ADD CONSTRAINT `item_estoq_almoxarif_fk`
  FOREIGN KEY (`ID_Almoxarif`)
  REFERENCES `assistech`.`almoxarifado` (`ID`),
ADD CONSTRAINT `item_estoq_estante_fk`
  FOREIGN KEY (`Cod_Estante`)
  REFERENCES `assistech`.`estante` (`COD`);

ALTER TABLE `assistech`.`jornada_trabalho` 
ADD CONSTRAINT `fk_jornada_trabalho_funcionario1`
  FOREIGN KEY (`funcionario_matricula`)
  REFERENCES `assistech`.`funcionario` (`matricula`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `assistech`.`kpi` 
ADD CONSTRAINT `fk_kpi_tecnico1`
  FOREIGN KEY (`tecnico_matricula`)
  REFERENCES `assistech`.`tecnico` (`funcionario_matricula`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `assistech`.`ordem_de_servico` 
ADD CONSTRAINT `fk_ordem_de_servico_chamado1`
  FOREIGN KEY (`chamado_No_Seq`)
  REFERENCES `assistech`.`chamado` (`No_Seq`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_ordem_de_servico_orcamento1`
  FOREIGN KEY (`orcamento_CodOrcamento`)
  REFERENCES `assistech`.`orcamento` (`CodOrcamento`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `assistech`.`supervisor` 
ADD CONSTRAINT `fk_supervisor_funcionario1`
  FOREIGN KEY (`funcionario_matricula`)
  REFERENCES `assistech`.`funcionario` (`matricula`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `assistech`.`tecnico_campo` 
ADD CONSTRAINT `fk_tecnico_campo_tecnico1`
  FOREIGN KEY (`funcionario_matricula`)
  REFERENCES `assistech`.`tecnico` (`funcionario_matricula`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `assistech`.`tecnico_interno` 
ADD CONSTRAINT `fk_tecnico_interno_tecnico1`
  FOREIGN KEY (`funcionario_matricula`)
  REFERENCES `assistech`.`tecnico` (`funcionario_matricula`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `assistech`.`unidade_de_suporte` 
ADD CONSTRAINT `fk_unidade_de_suporte_empresa1`
  FOREIGN KEY (`CNPJ`)
  REFERENCES `assistech`.`empresa` (`CNPJ`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `assistech`.`tecnico` 
ADD CONSTRAINT `fk_tecnico_funcionario1`
  FOREIGN KEY (`funcionario_matricula`)
  REFERENCES `assistech`.`funcionario` (`matricula`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
