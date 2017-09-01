USE assistech;

#TABELA UNIDADE DE SUPORTE
CREATE TABLE UNIDADE_DE_SUPORTE(
CNPJ VARCHAR(14), 
estado VARCHAR(10),
uf VARCHAR(2), 
endereco VARCHAR(30), 
nome VARCHAR(15), 
matriz VARCHAR(20),
primary key(CNPJ) 
);

alter table unidade_de_suporte 
change estado Estado VARCHAR(10),
change uf UF VARCHAR(2), 
change endereco Endereço VARCHAR(30), 
change nome Nome VARCHAR(15), 
change matriz Matriz VARCHAR(20);

CREATE TABLE IF NOT EXISTS `assistech`.`jornada_trabalho` (
  `ID` VARCHAR(8) NOT NULL DEFAULT '',
  `Horario_Inicio` INT(11) NULL DEFAULT NULL,
  `Horario_Fim` INT(11) NULL DEFAULT NULL,
  `Trabalha_Sabado` VARCHAR(5) NULL DEFAULT NULL,
  `Descricao` VARCHAR(7) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

#tentando resolver o problema de não conseguir adicionar CNPJ como chave estrangeira de empresa
alter table unidade_de_suporte change CNPJ CNPJ INTEGER(14);
alter table unidade_de_suporte add RazãoSocial VARCHAR(20);
alter table unidade_de_suporte change RazãoSocial RazaoSocial VARCHAR(20);

#A chave primária CNPJ de unidade_de_suporte foi alterada para VARCHAR(14) utilizando o editor do workbench.
#motivo: inteiro pode dar problema apra números muito grandes.

#Alterando a tabela unidade_de_suporte
ALTER TABLE unidade_de_suporte
	add COD VARCHAR(15),
    drop primary key,
    add constraint unidade_suporte_pk primary key(CNPJ_Empresa, COD);

ALTER TABLE unidade_de_suporte
CHANGE COLUMN RazaoSocial RazaoSocial VARCHAR(20) NOT NULL ,
DROP PRIMARY KEY,
ADD PRIMARY KEY (RazaoSocial);

#ajeitando as besteiras que fiz nas linhas de cima
ALTER TABLE unidade_de_suporte drop primary key;
ALTER TABLE unidade_de_suporte add primary key(CNPJ);
#adicionando constraint...
ALTER TABLE unidade_de_suporte drop primary key;
ALTER TABLE unidade_de_suporte add constraint unidade_sup_cnpj_pk primary key(CNPJ);

#TABELA EMPRESA
CREATE TABLE empresa(
CNPJ INTEGER(14),
RazaoSocial VARCHAR(20),
Endereço VARCHAR(30),
Fone VARCHAR(15),
CONSTRAINT empresa_cnpj_pk primary key(CNPJ)
);

ALTER TABLE empresa
ADD CONSTRAINT CNPJ_empresa_fk
  FOREIGN KEY (CNPJ)
  REFERENCES unidade_de_suporte(CNPJ)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
  
#agora há um caminho entre empresa e unidade_de_suporte e vice-versa

CREATE TABLE insumo(
Qtde VARCHAR(15),
CONSTRAINT insumo_pk primary key(Cod_insumo)
);

alter table insumo
	add COD VARCHAR(15);
        

#CREATE TABLE solict_insumo(


#TABELA CONTRATO
CREATE TABLE contrato(
COD VARCHAR(5),
DataInicio DATE,
DataFim DATE,
StatusContrato ENUM('Aberto', 'Finalizado'),
ID_Documento VARCHAR(10),
ID_Tipo_Contrato VARCHAR(5),
CONSTRAINT contrato_pk primary key(cod, ID_Documento, ID_Tipo_Contrato)
);

ALTER TABLE contrato
	ADD CONSTRAINT contrato_ID_Documento_fk foreign key(ID_Documento) references documento(ID_Documento) ON DELETE CASCADE ON UPDATE CASCADE,
	ADD CONSTRAINT contrato_ID_Tipo_Contrato_fk foreign key(ID_Tipo_Contrato) references tipo_contrato(ID_Tipo_Contrato) ON DELETE CASCADE ON UPDATE CASCADE;
    
#Adicionando a coluna código equipamento à tabela contrato.
ALTER TABLE contrato ADD Cod_Equipamento VARCHAR(8);
#atualizando a chave primária de contrato.
ALTER TABLE contrato DROP PRIMARY KEY; #dropando a chave primária de contrato(cod, ID_Documento, ID_Tipo_Contrato)
#renomeando a coluna COD para COD_Contrato
ALTER TABLE contrato change COD COD_Contrato VARCHAR(5);
ALTER TABLE contrato ADD PRIMARY KEY(COD_Contrato, ID_Documento, ID_Tipo_Contrato, Cod_Equipamento);
#adicionando chave estrangeira Cod_Equipamento a contrato 
ALTER TABLE contrato  
	ADD CONSTRAINT contrato_equipamento_fk foreign key(Cod_Equipamento) references equipamento(Cod_Equipamento);

#adicionando chave estrangeira ID_Documento a contrato. RODAR QUANDO PEGAR O CÓDIGO DE LUCAS    
ALTER TABLE contrato
	ADD CONSTRAINT contrato_documento_fk foreign key(ID_Documento) references documento(ID_Documento) ON DELETE CASCADE ON UPDATE CASCADE;

#TABELA DOCUMENTO
CREATE TABLE documento(
ID_Documento VARCHAR(10),
Tipo VARCHAR(30),
Título VARCHAR(50),
Data_De_Criação DATE,
Arquivo VARCHAR(6),
Versão VARCHAR(4),
CONSTRAINT documento_pk primary key(ID_Documento)
);

#TABELA TIPO_CONTRATO
CREATE TABLE tipo_contrato(
ID_Tipo_Contrato varchar(5),
Descrição Varchar(30),
CONSTRAINT tipo_contrato_pk primary key(ID_Tipo_Contrato)
);

ALTER TABLE tipo_contrato
	change ID_Tipo_Contrato ID_Tipo_Contrato VARCHAR(10);

#TABELA EQUIPAMENTO
CREATE TABLE equipamento(
Cod_Equipamento VARCHAR(8),
StatusEquip ENUM('Bom', 'Regular', 'Ruim'),
FabricanteEquip VARCHAR(30),
HistoricoEquip VARCHAR(40),
DescricaoEquip VARCHAR(50),
SetorEquip VARCHAR(20),
DataEntradaEquip DATE,
CONSTRAINT equipamento_pk primary key(Cod_Equipamento)
);

CREATE TABLE fatura(
COD VARCHAR(10),
status_ VARCHAR(50),
No_Parcelas INT,
Valor_Total float,
constraint fatura_pk primary key(COD)
);

CREATE TABLE parcela_pagamento(
Cod_fat VARCHAR(10),
Seq INT,
Dta_Pagto date,
Dta_Parcela date,
vl_pag_parcela double,
vl_total double,
juros float,
constraint parc_pag_pk primary key(Cod_fat, Seq),
constraint parc_pgto_fat_fk foreign key(Cod_fat) references fatura(COD)
);

alter table equipamento
	add IP_Rede VARCHAR(12);

alter table equipamento
	add Mask_Rede VARCHAR(12);


#Adicionando Num_Serie a equipamento.
alter table equipamento
	add Num_Serie VARCHAR(11);

#Criando tabela computador
#computador cliente pode não ter IP fixo. Então foi colocado só o IP da rede.
CREATE TABLE computador(
Cod_Equipamento VARCHAR(8),
IP_Rede  VARCHAR(12),
Sist_OP VARCHAR(30),
Setor VARCHAR(20),
CONSTRAINT computador_pk primary key(Cod_Equipamento),
CONSTRAINT computador_equipamento_fk foreign key(Cod_Equipamento) references equipamento(Cod_Equipamento) 
);

CREATE TABLE impressora(
Cod_Equip VARCHAR(8),
modelo VARCHAR(50),
IP_Rede VARCHAR(12),
CONSTRAINT impressora_pk primary key(Cod_Equip),
CONSTRAINT impressora_equip_fk foreign key(Cod_Equip) references equipamento(Cod_Equipamento)
);

CREATE TABLE nobreak(
Cod_Equip VARCHAR(8),
modelo VARCHAR(20),
kva INT,
constraint nobreak_pk primary key(Cod_Equip),
constraint nobreak_equip_fk foreign key(Cod_Equip) references equipamento(Cod_Equipamento)
);

CREATE TABLE HISTORICO_MANUTENCAO(
Dta_Abertura VARCHAR(128) NOT NULL
);

CREATE TABLE MANUTENCAO(
Dta_Inicio VARCHAR(128) NOT NULL,
Dta_Fim VARCHAR(128) NOT NULL,
Garantia VARCHAR(128) NOT NULL
);


ALTER TABLE MANUTENCAO ADD Dta_Abertura  NOT NULL;
ALTER TABLE MANUTENCAO ADD CONSTRAINT FK_MANUTENCAO FOREIGN KEY (_) REFERENCES  ();

#Dropando Setor, pois já existe na tabela euiqpamento.
ALTER TABLE computador
	drop Setor;

#Dropando IP_Rede
#Foi adicionado a Equipamento    
ALTER TABLE computador
	drop IP_Rede;
    
#Adicionando máscara de rede à computador    
ALTER TABLE computador
	add Mask_Rede VARCHAR(12);
 
#Dropando máscara de rede. Foi adicionada a Equipamento. 
ALTER TABLE computador
	drop Mask_Rede;

CREATE TABLE servidor(
Cod_Equipamento VARCHAR(8),
IP VARCHAR(12),
CONSTRAINT servidor_pk primary key(Cod_Equipamento),
CONSTRAINT sevidor_computador_fk foreign key(Cod_Equipamento) references computador(Cod_Equipamento)
);

#Criando tabela cliente
CREATE TABLE cliente(
COD VARCHAR(7),
Prioridade ENUM('Alta', 'Media', 'Baixa'),
Endereco VARCHAR(100),
UF_Estado VARCHAR(2),
CONSTRAINT cliente_pk primary key(COD)
);

#Criando tabela cliente_fisico
CREATE TABLE cliente_fisico(
Cod_Cliente VARCHAR(7),
CPF VARCHAR(11) UNIQUE,
Nome VARCHAR(50),
CONSTRAINT cliente_fisico_pk primary key(Cod_Cliente),
CONSTRAINT cliente_fisico_cliente_fk foreign key(Cod_Cliente) references cliente(COD)
);

#Criando tabela cliente_jur
CREATE TABLE cliente_jur(
Cod_Cliente VARCHAR(7),
CNPJ VARCHAR(14),
CONSTRAINT cliente_jur_pk primary key(Cod_Cliente),
CONSTRAINT cliente_jur_fk foreign key(Cod_Cliente) references cliente(COD)
);

ALTER TABLE cliente_jur
	CHANGE CNPJ CNPJ VARCHAR(14) UNIQUE NOT NULL,
	ADD Razao_Social VARCHAR(50);

#Criando tabela cliente_contato
CREATE TABLE cliente_contato(
Cod_Cliente VARCHAR(7),
Fone VARCHAR(12),
Celular VARCHAR(13),
Email VARCHAR(30),
CONSTRAINT cliente_contato_pk primary key(Cod_Cliente),
CONSTRAINT cliente_contato_cliente_fk foreign key(Cod_Cliente) references cliente(COD)
);

#TABELA ORDEM DE SERVICO
CREATE TABLE ordem_de_servico(
Num_OS VARCHAR(10),
Status_OS ENUM('Aberto', 'Fechado'),
DataCricao_OS DATE,
PrazoEmDiasOS DATE,
DtDevida DATE,
CodOrcamento VARCHAR(10),
CONSTRAINT ordem_de_servico_pk primary key(Num_OS),
CONSTRAINT ordem_de_servico_fk foreign key(CodOrcamento) references orcamento(CodOrcamento)
);

#Alterando tabela ordem Prazo em dias de Date para SMALLINT valor máximo: 32767
ALTER table ordem_de_servico
	CHANGE PrazoEmDiasOS Prazo_EmDias_OS SMALLINT;
    
#TABELA ORCAMENTO
CREATE TABLE orcamento(
CodOrcamento VARCHAR(10),
DescOrcamento VARCHAR(50),
DtAbert_Orcto DATE,
DtEmissao_Orcto DATE,
ValidadeEmDias_Orcto DATE,
UltimaData_Orcto DATE,
CONSTRAINT orcamento_pk primary key(CodOrcamento));


#adicionando coluna 
ALTER TABLE orcamento ADD Num_OS VARCHAR(10);
#inserindo chave estrangeira orcamento-os NumOS à tabela orcamento
ALTER TABLE orcamento  
	ADD CONSTRAINT orcamento_os_fk foreign key(Num_OS) references ordem_de_servico(Num_OS);

#Criando tabela funcionário.    
CREATE TABLE funcionario(
Matricula VARCHAR(10),
Cod_Contracheque VARCHAR(10),
Sequencial_Dependente VARCHAR(12),
Id_Jornada_Trabalho VARCHAR(8),
Login VARCHAR(15),
Senha VARCHAR(8),
Nome VARCHAR(15),
Cpf INTEGER(9),
Email VARCHAR(12),
Carga_hora INTEGER(10),
CONSTRAINT funcionario_pk primary key(Matricula)
);

#Alterando Cpf para Varchar, pois o Integer não permitiria números muito grandes. 0 - 9 para cada dígito.
ALTER TABLE funcionario
	CHANGE Cpf Cpf VARCHAR(9);

#Atribuindo chave estrangeira Codigo da unidade de suporte a funcionário.
ALTER TABLE funcionario
	add Cod_Unid_Sup VARCHAR(15),
	add constraint func_unidade_de_sup_fk foreign key(Cod_Unid_Sup) references unidade_de_suporte(COD);

ALTER TABLE funcionario
	change Cod_Unid_Sup Cod_Unid_Sup VARCHAR(15) NOT NULL;
        

#Criando tabela supervisor
CREATE TABLE supervisor(
Matricula_funcionario VARCHAR(10),
CONSTRAINT funcionario_pk primary key(Matricula_funcionario),
CONSTRAINT funcionario_supervisor_fk foreign key(Matricula_funcionario) references funcionario(Matricula)
);    

#Criando tabela tecnico
CREATE TABLE tecnico(
Matricula_funcionario VARCHAR(10),
CONSTRAINT funcionario_pk primary key(Matricula_funcionario),
CONSTRAINT funcionario_tecnico_fk foreign key(Matricula_funcionario) references funcionario(Matricula)
);

#Criando tabela tecnico_campo
CREATE TABLE tecnico_campo(
Matricula_funcionario VARCHAR(10),
Telefone_movel integer,
CONSTRAINT funcionario_pk primary key(Matricula_funcionario),
CONSTRAINT funcionario_tecnico_campo_fk foreign key(Matricula_funcionario) references funcionario(Matricula)
);

#Criando tabela tecnico_interno
CREATE TABLE tecnico_interno(
Matricula_funcionario VARCHAR(10),
Ramal INTEGER,
Grau_tecnico VARCHAR(30),
CONSTRAINT tecnico_interno_pk primary key(Matricula_funcionario),
CONSTRAINT tecnico_interno_funcionario_fk foreign key(Matricula_funcionario) references funcionario(Matricula)
);

#Criando tabela atendente_solucionador_direcionador
CREATE TABLE atendente_solucionador_direcionador(
Matricula_funcionario VARCHAR(10),
CONSTRAINT funcionario_pk primary key(Matricula_funcionario),
CONSTRAINT atendente_solucionador_direcionador_funcionario_fk foreign key(Matricula_funcionario) references funcionario(Matricula)
);

ALTER TABLE atendente_solucionador_direcionador
	ADD CONSTRAINT atend_solu_dir_chamado_fk foreign key(No_Chamado) references chamado(No_Seq);

#Criando tabela kpi
CREATE TABLE kpi(
Matricula_tecnico Varchar(10),
Sequencial INTEGER,
Kpi_1 VARCHAR(30),
Kpi_2 VARCHAR(30),
Dsc_kpi_1 VARCHAR(100),
Dsc_kpi_2 VARCHAR(100),
CONSTRAINT funcionario_pk primary key(Sequencial, Matricula_tecnico),
CONSTRAINT kpi_tecnico_fk foreign key(Matricula_tecnico) references tecnico(Matricula_funcionario)
);

CREATE TABLE supervisao(
Data_inicio date,
Matricula_supervisor VARCHAR(10),
Matricula_supervisionado VARCHAR(10),
CONSTRAINT supervisao_pk primary key(Matricula_supervisor, Matricula_supervisionado),
CONSTRAINT supervisao_supervisor_fk foreign key(Matricula_supervisor) references funcionario(Matricula),
CONSTRAINT supervisao_supervisionado_fk foreign key(Matricula_supervisionado) references funcionario(Matricula)
);
#ADD CONSTRAINT funcionario_contracheque_fk foreign key(Cod_Contracheque) references contracheque(Codigo),
#ADD CONSTRAINT funcionario_dependente_fk foreign key(Sequencial_Dependente) references dependente(Sequencial),

#Definindo Id_jornada_Trabalho como chave estrangeira para a jornada de trabalho, na tabela de funcionario.
ALTER TABLE funcionario
	ADD CONSTRAINT funcionario_jornada_trabalho_fk foreign key(Id_Jornada_Trabalho) references jornada_trabalho(ID_Jornada_Trabalho);

CREATE TABLE dependente(
Sequencial INTEGER(10),
Matricula_Func VARCHAR(10),
Sexo VARCHAR(1),
Data_Nascimento DATE,
Parentesco VARCHAR(8),
Idade INTEGER(3),
CONSTRAINT dependente_pk primary key(Matricula_Func, Sequencial),
CONSTRAINT dependente_funcionario_fk foreign key(Matricula_Func) references funcionario(Matricula)
);

CREATE TABLE contracheque(
Codigo INTEGER(14),
Data_Contracheque DATE,
Horas_extras INTEGER(10),
Salario_Base INTEGER(9),
Adicional_Salario INTEGER(9),
CONSTRAINT contracheque_pk primary key(Codigo)
);

ALTER TABLE contracheque
	add Mat_Funcionario VARCHAR(10) NOT NULL,
	add constraint contracheque_func_fk foreign key(Mat_Funcionario) references funcionario(Matricula);
    
CREATE TABLE jornada_trabalho( 
ID_Jornada_Trabalho VARCHAR(8), 
Horario_Inicio INTEGER, 
Horario_Fim INTEGER, 
Trabalha_Sabado VARCHAR(5), 
Descricao VARCHAR(7), 
CONSTRAINT jornada_trabalho_pk primary key(ID_Jornada_Trabalho) 
);

#alterando o tipo de dado de Código em contracheque de Integer pra Varchar.
ALTER TABLE contracheque	
	CHANGE Codigo Codigo VARCHAR(14);
#Adicionando código de contracheque à tabela funcionário e tornando-o uma chave estrangeira para tabela contracheque.
ALTER TABLE funcionario 
	ADD CONSTRAINT funcionario_contracheque_fk foreign key(Cod_Contracheque) references contracheque(Codigo);

CREATE TABLE adm_financeiro(
Matricula VARCHAR(10),
CONSTRAINT adm_financeiro_pk primary key(Matricula),
CONSTRAINT adm_financeiro_funcionario_fk foreign key(Matricula) references funcionario(Matricula)
);

ALTER TABLE adm_financeiro
	ADD Cod_Contracheque VARCHAR(14),
    ADD CONSTRAINT adm_fincanceiro_contracheque foreign key(Cod_Contracheque) references contracheque(Codigo);
    
ALTER TABLE contracheque
	ADD CONSTRAINT contracheque_admin_financeiro_fk foreign key(Matricula_Admin_Financeiro) references adm_financeiro(Matricula);
    
ALTER TABLE adm_financeiro
	DROP foreign key adm_fincanceiro_contracheque;
  
#Criando o relacionamento 1:N de adm_financeiro com despesa_viagem.  
ALTER TABLE adm_financeiro
	add Cod_Desp_Viag VARCHAR(10),
    ADD CONSTRAINT adm_financeiro_desp_viag_fk foreign key(Cod_Desp_Viag) 
    references despesa_viagem(COD);
    
CREATE TABLE despesa_viagem(
COD VARCHAR(10),
VALOR MEDIUMINT,
CONSTRAINT despesa_viagem_pk primary key(COD)
);

ALTER TABLE despesa_viagem
	change VALOR Valor MEDIUMINT NOT NULL;
    
CREATE TABLE tipo_despesa(
ID VARCHAR(7),
Cod_Despesa VARCHAR(10),
dsc VARCHAR(50),
CONSTRAINT tipo_despesa_pk primary key(ID),
CONSTRAINT tipo_despesa_desp_viag_fk foreign key(Cod_Despesa) references despesa_viagem(COD)
);

ALTER TABLE tipo_despesa
	change Cod_Despesa Cod_Despesa VARCHAR(10) NOT NULL,
    change dsc dsc VARCHAR(50) NOT NULL;
    
CREATE TABLE chamado(
No_Seq INT,
Tipo VARCHAR(30),
Status_ VARCHAR(20),
Descric VARCHAR(100),
Prioridade VARCHAR(20),
CONSTRAINT chamado_pk primary key(No_Seq)
);


CREATE TABLE fornecedor(
Cnpj_fornecedor VARCHAR(10),
Telefone INTEGER,
Razao VARCHAR(20),
Endereco VARCHAR(30),
Email VARCHAR(20),
CONSTRAINT fornecedor_pk primary key(Cnpj_fornecedor)
);

CREATE TABLE insumo(
Cod_Insumo VARCHAR(15),
Descri VARCHAR(15),
CONSTRAINT insumo_pk primary key(Cod_insumo)
);

CREATE TABLE fornece(
Dt_inicio VARCHAR(15),
Dt_fim VARCHAR(15),
Valor_unit VARCHAR(15),
Cnpj_fornecedor VARCHAR(10),
Cod_insumo VARCHAR(10),
CONSTRAINT fornece_pk primary key(Cnpj_fornecedor, Cod_insumo),
CONSTRAINT fornece_fk foreign key(Cod_insumo) references insumo(Cod_insumo)
);


ALTER TABLE fornece
	add constraint fornece_fornecedor_fk foreign key(Cnpj_fornecedor) 
    references fornecedor(Cnpj_fornecedor);


CREATE TABLE categoria(
Cod_categoria VARCHAR(15),
Descricao VARCHAR(12),
CONSTRAINT categoria_pk primary key(Cod_categoria)
);

CREATE TABLE almoxarifado(
ID VARCHAR(14),
Qtd_total INTEGER,
Entrada_mes DATE,
Saida_mes DATE,
Descricao VARCHAR(16),
CONSTRAINT almoxarifado_pk primary key(ID)
);

ALTER TABLE almoxarifado
	add Sequencial_item_estoq VARCHAR(16),
    add Cod_insumo VARCHAR(15),
	add CONSTRAINT almoxarif_item_estoq_fk foreign key(Cod_insumo, Sequencial_item_estoq)
    references item_estoque(Cod_insumo, Sequencial_insumo);

CREATE TABLE estante(
COD INT,
COD_ID_Almoxarif VARCHAR(1),
Descric VARCHAR(30) NOT NULL,
CONSTRAINT estante_pk primary key (COD)
);

#Modificando o tamanho do Código de almoxarifado, é pra ser 10 e não varchar de 1.
ALTER TABLE estante
	CHANGE COD_ID_Almoxarif COD_ID_Almoxarif VARCHAR(10) NOT NULL;
    
ALTER TABLE estante 
	ADD CONSTRAINT FK_ESTANTE FOREIGN KEY (COD_ID_almoxarifado) REFERENCES ALMOXARIFADO (Cod_ID);
    
ALTER TABLE estante
	ADD Seq_item_estoq VARCHAR(16),
    ADD Cod_insumo VARCHAR(15),
    ADD CONSTRAINT estante_item_estoq_fk foreign key(Cod_insumo, Seq_item_estoq)
    references item_estoque(Cod_insumo, Sequencial_insumo);

CREATE TABLE item_estoque(
Sequencial_insumo VARCHAR(16),
Cod_insumo VARCHAR(15),
Data_entrada DATE,
Data_final DATE,
Data_valida DATE,
Preco_compra VARCHAR(14),
Qtd_minima INTEGER,
Qtd_atual INTEGER,
CONSTRAINT item_estoque_pk primary key(Cod_insumo, Sequencial_insumo),
CONSTRAINT item_estoq_insumo_fk foreign key(Cod_insumo) references insumo(COD)
);

ALTER table item_estoque
	add Cod_Estante INT,
    add CONSTRAINT item_estoq_estante_fk foreign key(Cod_Estante)
    references estante(COD);
    
ALTER TABLE item_estoque
	add Cod_Almoxarif VARCHAR(14) NOT NULL,
    add CONSTRAINT item_estoq_almoxarif_fk foreign key(Cod_Almoxarif)
    references almoxarifado(COD_ID);

CREATE TABLE insumo_usado_servico(
Cod_insumo VARCHAR(15),
Qtd INTEGER
);

CREATE TABLE servico(
COD VARCHAR(13),
Status VARCHAR(11),
Descricao VARCHAR(17),
Valor VARCHAR(17),
CONSTRAINT servico_pk primary key(COD)
);

CREATE TABLE tipo_servico(
Cod_tipo_servico VARCHAR(15),
Cod_servico VARCHAR(13),
Descricao VARCHAR(30),
CONSTRAINT tipo_servico_pk primary key(Cod_tipo_servico),
CONSTRAINT cod_servico_fk foreign key(Cod_servico) references servico(COD)
);

CREATE TABLE base_problema_KB(
Id_base_problema_KB VARCHAR(26),
Descricao VARCHAR(25),
Solucao VARCHAR(23),
Dt_entrada DATE,
Tempo_necessario VARCHAR(22),
Obs VARCHAR(21),
CONSTRAINT Id_base_problema_KB_pk primary key(Id_base_problema_KB)
);