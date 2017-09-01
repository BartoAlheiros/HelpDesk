create schema assistech;
use assistech;

CREATE TABLE EMPRESA ( 
CNPJ BIGINT(14) UNSIGNED,
Razao_social VARCHAR(20) NOT NULL UNIQUE, 
Endereco VARCHAR(30) NOT NULL, 
Fone VARCHAR(15) NOT NULL, 
estado VARCHAR(50),
CONSTRAINT PRIMARY KEY(CNPJ)
);

CREATE TABLE UNIDADE_DE_SUPORTE ( 
CNPJ BIGINT(14) UNSIGNED, 
Nro_funcionarios INT, 
Nome VARCHAR(50) NOT NULL, 
Matriz VARCHAR(20) NOT NULL, 
endereco VARCHAR(50) NOT NULL UNIQUE,
FONE VARCHAR(16) NOT NULL,
CONSTRAINT PRIMARY KEY(CNPJ),
CONSTRAINT fk_unid_suporte_empresa FOREIGN KEY(CNPJ) REFERENCES EMPRESA(CNPJ)
);

CREATE TABLE SUPERVISIONA ( 
Matricula_supervisor VARCHAR(13), 
data_inicio DATE NOT NULL,
CONSTRAINT PRIMARY KEY(Matricula_supervisor),
CONSTRAINT FOREIGN KEY(Matricula_supervisor) REFERENCES SUPERVISOR (matricula) 
);


CREATE TABLE FUNCIONARIO (
Matricula VARCHAR(13), 
CPF BIGINT(11) NOT NULL UNIQUE, 
Matricula_supervisor VARCHAR(13) NOT NULL, 
CNPJ BIGINT(14) UNSIGNED NOT NULL UNIQUE, 
Login VARCHAR(15) NOT NULL UNIQUE, 
Senha VARCHAR(15) NOT NULL UNIQUE, 
Nome VARCHAR(30), 
Cod_Contracheque BIGINT UNSIGNED UNIQUE, 
Email VARCHAR(50) UNIQUE, 
Carga_hora INT(2),
CONSTRAINT PRIMARY KEY(Matricula),
CONSTRAINT funcionario_unid_sup_fk FOREIGN KEY (CNPJ) REFERENCES UNIDADE_DE_SUPORTE (CNPJ)
);

ALTER TABLE FUNCIONARIO
	ADD CONSTRAINT funcionario_supervisiona_fk FOREIGN KEY(Matricula_supervisor) REFERENCES SUPERVISIONA(Matricula_supervisor);

CREATE TABLE SUPERVISOR ( 
matricula VARCHAR(13),
CONSTRAINT PRIMARY KEY(matricula),
CONSTRAINT funcionario_supervisor_fk FOREIGN KEY(matricula) REFERENCES FUNCIONARIO (Matricula)
);


CREATE TABLE TECNICO ( 
Matricula_tecnico VARCHAR(13),
CONSTRAINT PRIMARY KEY(Matricula_tecnico),
CONSTRAINT tecnico_funcionario_fk FOREIGN KEY(Matricula_tecnico) references FUNCIONARIO( Matricula )
);

CREATE TABLE TECNICO_CAMPO ( 
matricula VARCHAR(13), 
tel_movel VARCHAR(14) UNIQUE,
CONSTRAINT PRIMARY KEY(matricula),
CONSTRAINT tecnico_campo_tecnico_fk FOREIGN KEY(matricula) references TECNICO(Matricula_tecnico)
 );


CREATE TABLE ATENDENTE_SOLUCIONADOR_DIRECIONADOR (
matricula VARCHAR(13),
CONSTRAINT PRIMARY KEY(matricula),
CONSTRAINT atendente_soluc_direc_funciionario_fk FOREIGN KEY(matricula) references TECNICO (Matricula_tecnico)
);

CREATE TABLE TECNICO_INTERNO ( 
matricula VARCHAR(13), 
Ramall VARCHAR(20), 
Grau_tec VARCHAR(30),
CONSTRAINT PRIMARY KEY(matricula),
CONSTRAINT tec_interno_tecnico_fk FOREIGN KEY(matricula) references TECNICO (Matricula_tecnico)
);

CREATE TABLE DEPENDENTE ( 
Sequencial INT(10), 
Matricula_funcionario VARCHAR(13), 
Sexo VARCHAR(1) NOT NULL, 
Data_nascimento DATE NOT NULL, 
Parentesco VARCHAR(20) NOT NULL, 
Idade INT(3) NOT NULL,
PRIMARY KEY(Sequencial, Matricula_funcionario),
CONSTRAINT dependente_funcionario_fk FOREIGN KEY(Matricula_funcionario) references FUNCIONARIO(Matricula)
);

CREATE TABLE JORNADA_DE_TRABALHO ( 
Id VARCHAR(8), 
Hora_inicio TIME NOT NULL, 
Hora_final TIME NOT NULL, 
Trabalha_sabado BOOLEAN NOT NULL, 
descricao VARCHAR(60), 
Matricula_funcionario VARCHAR(13) NOT NULL UNIQUE,
CONSTRAINT PRIMARY KEY(Id),
CONSTRAINT jorn_trab_funcionario_fk FOREIGN KEY(Matricula_funcionario) references FUNCIONARIO (Matricula)
);

CREATE TABLE ADM_FINANCEIRO ( 
Matricula VARCHAR(13),
CONSTRAINT PRIMARY KEY(Matricula),
CONSTRAINT adm_financeiro_func_fk FOREIGN KEY(Matricula) references FUNCIONARIO(Matricula)
);

CREATE TABLE CONTRACHEQUE ( 
Codigo VARCHAR(14), 
Horas_extras SMALLINT UNSIGNED NOT NULL, 
Salario_Base INT(9) NOT NULL, 
Adicional_Salario INT(9), 
Dta DATE NOT NULL, 
Matricula_Funcionario VARCHAR(13) NOT NULL UNIQUE,
Matricula_adm_financeiro VARCHAR(13) NOT NULL UNIQUE, 
CONSTRAINT PRIMARY KEY(Codigo),
CONSTRAINT contracheque_funcionario_fk FOREIGN KEY( Matricula_Funcionario ) references FUNCIONARIO(Matricula),
CONSTRAINT contracheque_adm_finc_fk FOREIGN KEY(Matricula_adm_financeiro ) references ADM_FINANCEIRO(Matricula)
);

CREATE TABLE ORCAMENTO ( 
Cod INT, 
Data_emissao DATE NOT NULL, 
Validade_num_dias INT NOT NULL, 
ultima_data DATE NOT NULL, 
Descricao VARCHAR(255) NOT NULL, 
Data_abertura DATE NOT NULL, 
Num_OS INT NOT NULL UNIQUE,
CONSTRAINT PRIMARY KEY(Cod)
);

CREATE TABLE CHAMADO ( 
Sequencial INT(11), 
Tipo VARCHAR(30), 
Status_ VARCHAR(20), 
Descricao VARCHAR(100), 
Prioridade VARCHAR(20), 
Mat_supervisor VARCHAR(13), 
Mat_tec_campo VARCHAR(13), 
Mat_tec_interno VARCHAR(13), 
Mat_atend VARCHAR(13), 
Num_ordem_servico INT,
Dta_abertura DATE NOT NULL,
Cod_cliente INT NOT NULL,
PRIMARY KEY(Sequencial),
CONSTRAINT chamado_supervisor_fk FOREIGN KEY(Mat_supervisor) references SUPERVISOR(matricula),
CONSTRAINT chamado_tec_campo_fk FOREIGN KEY(Mat_tec_campo) references TECNICO_CAMPO(matricula),
CONSTRAINT chamado_tec_interno_fk FOREIGN KEY(Mat_tec_interno) references TECNICO_INTERNO(matricula),
CONSTRAINT chamado_atend_sol_direc_fk FOREIGN KEY(Mat_atend) references ATENDENTE_SOLUCIONADOR_DIRECIONADOR(matricula), 
CONSTRAINT chamado_cliente_fk FOREIGN KEY(Cod_cliente) REFERENCES CLIENTE(Cod)
);

ALTER TABLE CHAMADO ADD CONSTRAINT chamado_cliente_fk FOREIGN KEY(Cod_cliente) REFERENCES CLIENTE(Cod);

CREATE TABLE ORDEM_SERVICO ( 
Num INT, 
Data_devida DATE NOT NULL, 
Prazo_em_dias INT NOT NULL, 
Data_criacao DATE NOT NULL, 
Status_ VARCHAR(20) NOT NULL,  
Cod_servico INT NOT NULL, 
sequencial_chamado INT(11) NOT NULL,
Cod_orcamento INT UNIQUE,
CONSTRAINT PRIMARY KEY(Num),
CONSTRAINT ord_servico_orcamento_fk FOREIGN KEY(Cod_orcamento) references ORCAMENTO(Cod),
CONSTRAINT ord_servico_chamado_fk FOREIGN KEY(sequencial_chamado) references CHAMADO (Sequencial) 
);

ALTER TABLE ORCAMENTO
	ADD CONSTRAINT orcamento_os_fk FOREIGN KEY(Num_OS) references ORDEM_SERVICO(Num);

ALTER TABLE CHAMADO
	ADD CONSTRAINT chamado_ordem_servico_fk FOREIGN KEY(Num_ordem_servico) references ORDEM_SERVICO(Num);

CREATE TABLE ATENDE ( 
Sequencial_chamado INT(11),  
Mat_tec_campo VARCHAR(13),
CONSTRAINT PRIMARY KEY(Sequencial_chamado, Mat_tec_campo),
CONSTRAINT atende_chamado_fk FOREIGN KEY(Sequencial_chamado) references CHAMADO(Sequencial),
CONSTRAINT atemnde_tec_campo_fk FOREIGN KEY(Mat_tec_campo) references TECNICO_CAMPO(matricula)
);

CREATE TABLE TIPO_DESPESA ( 
Id INT, 
Descricao VARCHAR(50) NOT NULL,
PRIMARY KEY(Id)
);

CREATE TABLE DESPESA_VIAGEM ( 
Cod VARCHAR(10), 
Valor FLOAT(4,2) NOT NULL,
Id_tipo_despesa INT NOT NULL, 
Mat_adm_financeiro VARCHAR(13) NOT NULL UNIQUE, 
Sequencial_chamado INT(11) NOT NULL,  
Mat_tec_campo VARCHAR(13) NOT NULL,
CONSTRAINT PRIMARY KEY(Cod),
CONSTRAINT despesa_tipo_despesa_fk FOREIGN KEY(Id_tipo_despesa) references TIPO_DESPESA(Id),
CONSTRAINT despesa_adm_financeiro_fk FOREIGN KEY(Mat_adm_financeiro) references ADM_FINANCEIRO(Matricula),
CONSTRAINT chamado_fk FOREIGN KEY(Sequencial_chamado) references ATENDE(Sequencial_chamado),
CONSTRAINT tec_campo_fk FOREIGN KEY(Mat_tec_campo) references ATENDE (Mat_tec_campo)
);

CREATE TABLE KPI ( 
Sequencial INT, 
Matricula_tecnico VARCHAR(13), 
KPI_1 INT NOT NULL, 
KPI_2 INT NOT NULL, 
Dsc_KPI_1 VARCHAR(100) NOT NULL, 
Dsk_KPI_2 VARCHAR(100) NOT NULL,
CONSTRAINT PRIMARY KEY(Sequencial, Matricula_tecnico),
CONSTRAINT kpi_tecnico_fk FOREIGN KEY(Matricula_tecnico) references TECNICO (Matricula_tecnico)
);

CREATE TABLE TIPO_SERVICO ( 
Cod INT, 
Descricao VARCHAR(255) NOT NULL,
CONSTRAINT PRIMARY KEY(Cod)
);

CREATE TABLE SERVICO ( 
Cod INT, 
Descricao VARCHAR(255) NOT NULL, 
Valor FLOAT(4,2) NOT NULL, 
Status_ VARCHAR(255) NOT NULL, 
Cod_Tipo_Servico INT NOT NULL,
Num_OS INT NOT NULL UNIQUE,
CONSTRAINT PRIMARY KEY(Cod),
CONSTRAINT servico_ord_servico_fk FOREIGN KEY(Num_OS) references ORDEM_SERVICO(Num),
CONSTRAINT servico_tipo_servic_fk FOREIGN KEY(Cod_Tipo_Servico) references TIPO_SERVICO(Cod)
);

CREATE TABLE BASE_PROBLEMAS_KB ( 
Id INT, 
Descricao VARCHAR(255) NOT NULL, 
Procedimento VARCHAR(1023) NOT NULL, 
Solucao VARCHAR(1023) NOT NULL, 
Data_entrada DATE NOT NULL, 
Tempo_necessario FLOAT(4,2) NOT NULL, 
obs VARCHAR(1023) NOT NULL, 
Id_relacionado INT NOT NULL, 
Cod_servico INT NOT NULL,
CONSTRAINT PRIMARY KEY(Id),
CONSTRAINT base_probs_relacionado_com_fk FOREIGN KEY(Id_relacionado) references BASE_PROBLEMAS_KB(Id),
CONSTRAINT base_probs_servico_fk FOREIGN KEY(Cod_servico) references SERVICO(Cod)
);


CREATE TABLE BASEOU_EM ( 
Id_base_prob INT, 
Cod_servico INT,
CONSTRAINT PRIMARY KEY(Id_base_prob, Cod_servico),
CONSTRAINT baseou_em_base_probs_fk FOREIGN KEY(Id_base_prob) references BASE_PROBLEMAS_KB(Id),
CONSTRAINT baseou_em_servico_fk FOREIGN KEY(Cod_servico) references SERVICO(Cod)
);

CREATE TABLE CLIENTE ( 
Cod INT, 
Prioridade VARCHAR(20) NOT NULL, 
Endereco VARCHAR(200) NOT NULL, 
Estado VARCHAR(50) NOT NULL, 
Email VARCHAR(100) UNIQUE, 
Fone VARCHAR(30) NOT NULL,
CONSTRAINT PRIMARY KEY(Cod)
);

CREATE TABLE CLIENTE_JUR ( 
Cod_cliente INT, 
Cnpj BIGINT(14) NOT NULL, 
Razao_social VARCHAR(100) NOT NULL,
CONSTRAINT PRIMARY KEY(Cod_Cliente),
CONSTRAINT cliente_jur_cliente_fk FOREIGN KEY( Cod_cliente ) references CLIENTE(Cod)
);

CREATE TABLE CLIENTE_FISICO ( 
Cod_cliente INT, 
Cpf VARCHAR(11) NOT NULL, 
Nome VARCHAR(255) NOT NULL,
CONSTRAINT PRIMARY KEY(Cod_Cliente),
CONSTRAINT cliente_fis_cliente_fk FOREIGN KEY( Cod_cliente ) references CLIENTE(Cod)
);

CREATE TABLE FATURA ( 
Cod INT, 
Num_parcelas INT NOT NULL,
Valor_total INT NOT NULL, 
Status_ VARCHAR(30) NOT NULL, 
Cod_cliente INT NOT NULL,
CONSTRAINT PRIMARY KEY(Cod), 
CONSTRAINT fatura_cliente_fk FOREIGN KEY(Cod_cliente) references CLIENTE(Cod)
);

CREATE TABLE ALMOXARIFADO ( 
Id INT, 
Saida_mes VARCHAR(20) NOT NULL, 
Descricao VARCHAR(255) NOT NULL, 
Entrada_mes VARCHAR(20) NOT NULL, 
Quantidade_total INT NOT NULL, 
Cod_Insumo INT NOT NULL,
CONSTRAINT PRIMARY KEY(Id)
);

CREATE TABLE TIPO_CONTRATO(
Id INT(10),
Descricao VARCHAR(255) NOT NULL,
CONSTRAINT PRIMARY KEY(Id)
);

CREATE TABLE CONTRATO ( 
Cod_contrato VARCHAR(15), 
Cnpj_Unidade_suporte BIGINT(14) UNSIGNED, 
Id_tipo_contrato INT(10) NOT NULL, 
Data_inicio DATE NOT NULL, 
Data_fim DATE NOT NULL, 
Status_contrato VARCHAR(58) NOT NULL, 
CONSTRAINT PRIMARY KEY (Cod_contrato, Cnpj_Unidade_suporte, Id_tipo_contrato),
CONSTRAINT contrato_tipo_contrato_fk FOREIGN KEY (ID_Tipo_Contrato ) references  TIPO_CONTRATO(Id),
CONSTRAINT contrato_unidade_suporte_fk FOREIGN KEY (Cnpj_Unidade_suporte) references  UNIDADE_DE_SUPORTE(CNPJ)
);

CREATE TABLE EQUIPAMENTO(
Cod VARCHAR(15),
Data_entrada DATE NOT NULL,
Setor VARCHAR(30) NOT NULL,
historico VARCHAR(80) NOT NULL,
Fabricante VARCHAR(20) NOT NULL,
Estado VARCHAR(15) NOT NULL,
Cod_contrato VARCHAR(15) NOT NULL,
CONSTRAINT PRIMARY KEY(Cod),
CONSTRAINT Cod_contrato_fk FOREIGN KEY(Cod_contrato) references CONTRATO(Cod_contrato)
);

CREATE TABLE ENVOLVEU ( 
Num_ordem_servico INT,
Cod_equipamento VARCHAR(15),
CONSTRAINT PRIMARY KEY(Num_ordem_servico, Cod_equipamento),
CONSTRAINT envolveu_os_fk FOREIGN KEY(Num_ordem_servico) references ORDEM_SERVICO(Num),
CONSTRAINT envolve_equipamento_fk FOREIGN KEY ( Cod_equipamento ) references EQUIPAMENTO(Cod)
);

CREATE TABLE PARCELA_PAGAMENTO ( 
Sequencial INT, 
Cod_fatura INT, 
Data_pagamento DATE NOT NULL, 
Data_parcela DATE NOT NULL, 
Juros FLOAT(2,2) NOT NULL, 
Valor_total FLOAT(4,2) NOT NULL, 
Valor_pagamento_parcelado FLOAT(4,2) NOT NULL, 
CONSTRAINT PRIMARY KEY (Sequencial, Cod_fatura),
CONSTRAINT parcela_pagamento_fatura_fk FOREIGN KEY ( Cod_fatura ) references FATURA ( Cod )
);

CREATE TABLE CATEGORIA ( 
Cod VARCHAR(20), 
Descricao VARCHAR(80) NOT NULL,
CONSTRAINT PRIMARY KEY(Cod)
);

#mudar Cod para int
 
CREATE TABLE SOLICITA(
Mat_supervisor VARCHAR(13),
Quantidade INT(4),
CONSTRAINT PRIMARY KEY(Mat_supervisor),
CONSTRAINT solicita_supervisor_fk FOREIGN KEY(Mat_supervisor) references SUPERVISOR(matricula)
); 
 
CREATE TABLE INSUMO(
Cod VARCHAR(15),
Descricao VARCHAR(128) NOT NULL,
Cod_categoria VARCHAR(20) NOT NULL,
Mat_supervisor VARCHAR(13) NOT NULL,
CONSTRAINT PRIMARY KEY(Cod),
CONSTRAINT insumo_categoria_fk FOREIGN KEY(Cod_categoria) references CATEGORIA(Cod),
CONSTRAINT insumo_supervisor_fk FOREIGN KEY(Mat_supervisor) references SUPERVISOR(matricula)
);

#tive que add esse alter table, pois insumo já tinha sido criada e não
#havia uma chave estrangeira para solicita. Nõ consegui dropar INSUMO,
#devido a suas relações já existentes.
ALTER TABLE INSUMO
	ADD CONSTRAINT insumo_solicita_fk FOREIGN KEY(Mat_supervisor) references SOLICITA(Mat_supervisor);

CREATE TABLE INSUMO_USADO_SERVICO ( 
Cod_Insumo VARCHAR(15), 
Cod_servico INT, 
Quantidade VARCHAR(29) NOT NULL,
CONSTRAINT PRIMARY KEY (Cod_Insumo, Cod_servico),
CONSTRAINT insumo_usado_servico_insumo_fk FOREIGN KEY ( Cod_insumo ) references INSUMO(Cod),
CONSTRAINT insumo_usado_servico_servico FOREIGN KEY ( Cod_servico ) references SERVICO(Cod)
);

CREATE TABLE DOCUMENTO (
Id INT,
Tipo VARCHAR(60) NOT NULL,
Data_Criacao DATE NOT NULL,
Arquivo VARCHAR(50) NOT NULL,
Versao FLOAT(2,2) NOT NULL,
Titulo VARCHAR(50) NOT NULL,
Cod_contrato VARCHAR(15) NOT NULL UNIQUE,
CONSTRAINT PRIMARY KEY(Id),
CONSTRAINT documento_cod_contrato_fk FOREIGN KEY(Cod_contrato) references CONTRATO(Cod_contrato)
);

CREATE TABLE COMPUTADOR(
Cod_equipamento VARCHAR(15),
Sistema_operacional VARCHAR(10) NOT NULL,
Endereco_IP VARCHAR(15) NOT NULL,
CONSTRAINT PRIMARY KEY(Cod_equipamento),
CONSTRAINT computador_equipamento_fk FOREIGN KEY(Cod_equipamento) references EQUIPAMENTO(Cod)
);

CREATE TABLE TV(
Cod_equipamento VARCHAR(15),
Modelo VARCHAR(15) NOT NULL,
CONSTRAINT PRIMARY KEY(Cod_equipamento),
CONSTRAINT tv_equipamento_fk FOREIGN KEY(Cod_equipamento) references EQUIPAMENTO(Cod)
);

CREATE TABLE IMPRESSORA(
Cod_equipamento VARCHAR(15),
Modelo VARCHAR(15) NOT NULL,
CONSTRAINT PRIMARY KEY(Cod_equipamento),
CONSTRAINT impressora_equipamento_fk FOREIGN KEY(Cod_equipamento) references EQUIPAMENTO(Cod)
);

CREATE TABLE NOBREAK(
Cod_equipamento VARCHAR(15),
KVA VARCHAR(20) NOT NULL,
CONSTRAINT PRIMARY KEY(Cod_equipamento),
CONSTRAINT nobreak_equipamento_fk FOREIGN KEY(Cod_equipamento) references EQUIPAMENTO(Cod)
);

CREATE TABLE FORNECEDOR(
Cnpj BIGINT(14),
Razao_social VARCHAR(30) NOT NULL UNIQUE,
Email VARCHAR(40) NOT NULL,
Telefone VARCHAR(20) NOT NULL,
CONSTRAINT PRIMARY KEY(Cnpj)
);

CREATE TABLE FORNECE(
Cnpj_Fornecedor BIGINT(14),
Cod_Insumo VARCHAR(15) NOT NULL,
Data_inicio DATE NOT NULL,
Data_fim DATE NOT NULL,
Valor_unitario FLOAT(4,2) NOT NULL,
CONSTRAINT PRIMARY KEY(Cnpj_Fornecedor),
CONSTRAINT Cnpj_Fornecedor_fk FOREIGN KEY(Cnpj_Fornecedor) references FORNECEDOR(Cnpj),
CONSTRAINT Cod_Insumo_fk FOREIGN KEY(Cod_Insumo) references INSUMO(Cod)
);

CREATE TABLE END_FORNECEDOR(
Cnpj_Fornecedor BIGINT(14),
Endereco VARCHAR(80),
CONSTRAINT PRIMARY KEY(Cnpj_Fornecedor, Endereco),
CONSTRAINT end_fornecedor_fk FOREIGN KEY(Cnpj_Fornecedor) references FORNECEDOR(Cnpj)
);

CREATE TABLE ITEM_ESTOQUE(
Sequencial INT(8),
Cod_Insumo VARCHAR(15),
Quantidade_Atual INT(6) NOT NULL,
Data_validade DATE NOT NULL,
Data_final DATE NOT NULL,
Data_entrada DATE NOT NULL,
Preco_compra INT(8) NOT NULL,
Quantidade_minima INT(6) NOT NULL,
Id_almoxarifado INT NOT NULL,
CONSTRAINT PRIMARY KEY(Sequencial, Cod_Insumo),
CONSTRAINT item_estoque_insumo_fk FOREIGN KEY(Cod_Insumo) references INSUMO(Cod),
CONSTRAINT item_estoque_almoxarifado_fk FOREIGN KEY(Id_almoxarifado) references ALMOXARIFADO(Id)
);