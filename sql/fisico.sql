#-----------------#
#  MODELO FÍSICO  #
#-----------------#

CREATE DATABASE redepc;
USE redepc;

#--------------------------------------------------------------
# Criação de tabelas

CREATE TABLE IMPRIME_EM (
    impressora CHAR(20),
    data DATE,
    hora TIME,
    usuario CHAR(20),
    tamanhoArq CHAR(8),
    tituloArq CHAR(20),
    numFolhas INT,
    PRIMARY KEY(impressora, data, hora)
);

CREATE TABLE IMPRESSORA (
    ip CHAR(20) PRIMARY KEY,
    nome CHAR(20),
    marca CHAR(15),
    modelo CHAR(15),
    driver CHAR(10),
    salaID INT
);

CREATE TABLE ENVIADO_PARA (
    idEmail INT,
    destinatario CHAR(20),
    tipo CHAR(10),
    PRIMARY KEY(idEmail, destinatario)
);

CREATE TABLE SALA (
    salaID INT PRIMARY KEY,
    nome CHAR(20),
    local CHAR(20)
);

CREATE TABLE USUARIO (
    username CHAR(20) PRIMARY KEY,
    nusp INT,
    senha CHAR(20),
    pNome CHAR(20),
    mNome CHAR(1),
    sNome CHAR(20),
    curso CHAR(5),
    dataCadastro DATE,
    quotaDisco INT,
    quotaImpressao INT,
    admin BIT,
    suspenso BIT
);

CREATE TABLE ACESSA (
    usuario CHAR(20),
    maquina CHAR(20),
    data DATE,
    hora TIME,
    meio CHAR(10),
    PRIMARY KEY(usuario, maquina, data, hora),
    FOREIGN KEY(usuario) REFERENCES USUARIO (username)
);

CREATE TABLE MAQUINA (
    ip CHAR(20) PRIMARY KEY,
    macAddress CHAR(20),
    hostname CHAR(20),
    tipo CHAR(10),
    salaID INT,
    FOREIGN KEY(salaID) REFERENCES SALA (salaID)
);

CREATE TABLE EMAIL (
    id INT PRIMARY KEY,
    remetente CHAR(20),
    assunto CHAR(30),
    data DATE,
    hora TIME,
    FOREIGN KEY(remetente) REFERENCES USUARIO (username)
);

CREATE TABLE PACOTE (
    nome CHAR(30) PRIMARY KEY,
    versao CHAR(10)
);

CREATE TABLE DEPENDE_DE (
    nomePacote CHAR(30),
    nomeDep CHAR(30),
    PRIMARY KEY(nomePacote, nomeDep),
    FOREIGN KEY(nomePacote) REFERENCES PACOTE (nome)
);

#--------------------------------------------------------------
# Definição das chaves estrangeiras

ALTER TABLE IMPRIME_EM   ADD FOREIGN KEY(impressora)   REFERENCES IMPRESSORA (ip);
ALTER TABLE IMPRIME_EM   ADD FOREIGN KEY(usuario)      REFERENCES USUARIO    (username);
ALTER TABLE IMPRESSORA   ADD FOREIGN KEY(salaID)       REFERENCES SALA       (salaID);
ALTER TABLE ENVIADO_PARA ADD FOREIGN KEY(idEmail)      REFERENCES EMAIL      (id);
ALTER TABLE ENVIADO_PARA ADD FOREIGN KEY(destinatario) REFERENCES USUARIO    (username);
ALTER TABLE ACESSA       ADD FOREIGN KEY(maquina)      REFERENCES MAQUINA    (ip);
