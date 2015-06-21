#=================#
#  MODELO FÍSICO  #
#=================#

DROP DATABASE redepc;
CREATE DATABASE redepc;
USE redepc;

#--------------------------------------------------------------
# Criação de tabelas
#--------------------------------------------------------------

CREATE TABLE pacote (
    nome CHAR(30) PRIMARY KEY,
    versao CHAR(10)
);

#--------------------------------------------------------------

CREATE TABLE depende_de (
    nomePacote CHAR(30),
    nomeDep CHAR(30),
    PRIMARY KEY(nomePacote, nomeDep),
    FOREIGN KEY(nomePacote) REFERENCES pacote (nome),
    FOREIGN KEY(nomeDep)    REFERENCES pacote (nome)
);

#--------------------------------------------------------------

CREATE TABLE sala (
    salaID INT PRIMARY KEY,
    nome CHAR(20),
    local CHAR(20)
);

#--------------------------------------------------------------

CREATE TABLE impressora (
    nome CHAR(20) PRIMARY KEY,
    ip CHAR(20),
    marca CHAR(15),
    modelo CHAR(15),
    driver CHAR(10),
    salaID INT,
    FOREIGN KEY(salaID) REFERENCES sala (salaID)
);

#--------------------------------------------------------------

CREATE TABLE maquina (
    hostname CHAR(20) PRIMARY KEY,
    ip CHAR(20),
    macAddress CHAR(20),
    tipo CHAR(10),
    salaID INT,
    FOREIGN KEY(salaID) REFERENCES sala (salaID)
);

#--------------------------------------------------------------

CREATE TABLE usuario (
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
    admin TINYINT,
    suspenso TINYINT
);

#--------------------------------------------------------------

CREATE TABLE imprime_em (
    impressora CHAR(20),
    data DATE,
    hora TIME,
    usuario CHAR(20),
    tamanhoArq INT,
    tituloArq CHAR(20),
    numFolhas INT,
    PRIMARY KEY(impressora, data, hora),
    FOREIGN KEY(impressora) REFERENCES impressora (nome),
    FOREIGN KEY(usuario)    REFERENCES usuario    (username)
);

#--------------------------------------------------------------

CREATE TABLE acessa (
    usuario CHAR(20),
    maquina CHAR(20),
    data DATE,
    hora TIME,
    meio CHAR(10),
    PRIMARY KEY(usuario, maquina, data, hora),
    FOREIGN KEY(usuario) REFERENCES usuario (username),
    FOREIGN KEY(maquina) REFERENCES maquina (hostname)
);

#--------------------------------------------------------------

CREATE TABLE email (
    id INT PRIMARY KEY,
    remetente CHAR(20),
    assunto CHAR(30),
    data DATE,
    hora TIME,
    FOREIGN KEY(remetente) REFERENCES usuario (username)
);

#--------------------------------------------------------------

CREATE TABLE enviado_para (
    idEmail INT,
    destinatario CHAR(20),
    tipo CHAR(10),
    PRIMARY KEY(idEmail, destinatario),
    FOREIGN KEY(idEmail)      REFERENCES email   (id),
    FOREIGN KEY(destinatario) REFERENCES usuario (username)
);

#--------------------------------------------------------------
# Inserção de tuplas
#--------------------------------------------------------------

INSERT INTO pacote VALUES ("gcc", "4.7");
INSERT INTO pacote VALUES ("g++", "4.6");
INSERT INTO pacote VALUES ("python", "2.7");
INSERT INTO pacote VALUES ("python3", "3.4");
INSERT INTO pacote VALUES ("java", "6.3");
INSERT INTO pacote VALUES ("valgrind", "3.10.0");
INSERT INTO pacote VALUES ("perl", "5.18.2");
INSERT INTO pacote VALUES ("xlib", "4.0.0");
INSERT INTO pacote VALUES ("wine", "1.7.2");
INSERT INTO pacote VALUES ("logisim", "3.4.1");
INSERT INTO pacote VALUES ("sublime_text3", "3083");
INSERT INTO pacote VALUES ("emacs", "9.1.5");
INSERT INTO pacote VALUES ("blender", "6.4");
INSERT INTO pacote VALUES ("firefox", "37.2");
INSERT INTO pacote VALUES ("chromium", "40.4");

#--------------------------------------------------------------

INSERT INTO depende_de VALUES ("valgrind", "gcc");
INSERT INTO depende_de VALUES ("wine", "gcc");
INSERT INTO depende_de VALUES ("wine", "valgrind");
INSERT INTO depende_de VALUES ("wine", "xlib");
INSERT INTO depende_de VALUES ("logisim", "java");
INSERT INTO depende_de VALUES ("blender", "python");

#--------------------------------------------------------------

INSERT INTO sala VALUES (1, "Administração", "Sala 111-A");
INSERT INTO sala VALUES (2, "Heróis", "Sala 135-A");
INSERT INTO sala VALUES (3, "Corredor", "Sala 200-A");
INSERT INTO sala VALUES (4, "Pesquisa Restrita", "Sala 321-A");

#--------------------------------------------------------------

INSERT INTO impressora VALUES ("colossus", "191.142.88.00", "HP", "LaserJet Pro MFP M125a", "CQue 2.0.8 Linux Driver DEB 64-bit", 2);
INSERT INTO impressora VALUES ("eniac", "191.142.88.01", "Dell", "1355cnw Multifunction Color Printer", "JRE 64-bit", 2);
INSERT INTO impressora VALUES ("univac", "191.142.88.02", "Epson", "WorkForce WF-3640", "CQue 2.0.8 Linux Driver DEB 64-bit", 4);

#--------------------------------------------------------------

INSERT INTO maquina VALUES ("alpha", "202.153.44.00", "00:16:E9:74:1D:27", "Cliente", 1);
INSERT INTO maquina VALUES ("beta", "202.153.44.01", "FD:FE:5D:46:B3:1B", "Cliente", 1);
INSERT INTO maquina VALUES ("gama", "202.153.44.02", "D6:78:81:5A:FC:84", "Cliente", 1);
INSERT INTO maquina VALUES ("sigma", "202.153.44.03", "85:A8:30:02:62:5D", "Servidor", 1);
INSERT INTO maquina VALUES ("omega", "202.153.44.04", "65:BE:CB:1D:34:2F", "Servidor", 1);

INSERT INTO maquina VALUES ("ryu", "202.153.44.10", "70:93:81:F7:C6:49", "Cliente", 2);
INSERT INTO maquina VALUES ("ken", "202.153.44.11", "3C:82:4B:C7:DE:C4", "Cliente", 2);
INSERT INTO maquina VALUES ("guile", "202.153.44.12", "32:D2:F6:3C:FF:FF", "Cliente", 2);
INSERT INTO maquina VALUES ("chunli", "202.153.44.13", "20:2F:5D:8B:F1:38", "Cliente", 2);
INSERT INTO maquina VALUES ("honda", "202.153.44.14", "67:99:8B:3C:28:24", "Cliente", 2);
INSERT INTO maquina VALUES ("dhalsim", "202.153.44.15", "38:4E:59:56:43:F1", "Cliente", 2);
INSERT INTO maquina VALUES ("sagat", "202.153.44.16", "D8:3C:5C:4C:FE:AA", "Cliente", 2);
INSERT INTO maquina VALUES ("vega", "202.153.44.17", "18:EC:FC:90:49:85", "Cliente", 2);

INSERT INTO maquina VALUES ("luke", "202.153.44.20", "48:BF:A2:B4:EC:95", "Cliente", 3);
INSERT INTO maquina VALUES ("obiwan", "202.153.44.21", "86:7C:7E:C2:FD:E4", "Cliente", 3);
INSERT INTO maquina VALUES ("yoda", "202.153.44.22", "2D:1A:99:01:01:B4", "Cliente", 3);
INSERT INTO maquina VALUES ("vader", "202.153.44.23", "31:24:19:65:5A:8E", "Cliente", 3);

INSERT INTO maquina VALUES ("ignis", "202.153.44.30", "85:66:6E:B8:59:B9", "Cliente", 4);
INSERT INTO maquina VALUES ("flumen", "202.153.44.31", "8C:7E:45:23:6F:0B", "Cliente", 4);
INSERT INTO maquina VALUES ("terra", "202.153.44.32", "7E:89:94:77:5B:DE", "Cliente", 4);
INSERT INTO maquina VALUES ("ventus", "202.153.44.33", "2E:64:4A:89:74:1D", "Cliente", 4);
INSERT INTO maquina VALUES ("lychnus", "202.153.44.34", "1A:AF:09:51:E6:41", "Cliente", 4);
INSERT INTO maquina VALUES ("umbra", "202.153.44.35", "72:39:02:21:1D:5C", "Cliente", 4);

#--------------------------------------------------------------

INSERT INTO usuario VALUES ("gaspar", 5006007, "batata", "Gaspar", "S", "Zinho", "Comp", "2013:04:05", 30000, 64, FALSE, FALSE);
INSERT INTO usuario VALUES ("fulano", 1234567, "pclegal", "Fulano", "S", "Júnior", "Pura", "2015:02:20", 10000, 10, FALSE, TRUE);
INSERT INTO usuario VALUES ("sicrano", 7654321, "pagodebom", "Sicrano", "D", "Sicro", "Comp", "2015:03:26", 45000, 42, FALSE, FALSE);
INSERT INTO usuario VALUES ("tiopatinhas", 4565656, "dinheiro", "Patinhas", "M", "Patinhas", "Estat", "2002:10:16", 500, 2, TRUE, FALSE);
INSERT INTO usuario VALUES ("monstro", 3213210, "podevim", "Leo", "S", "Stronda", "Lic", "2010:07:01", 22000, 30, FALSE, FALSE);
INSERT INTO usuario VALUES ("cirno", 9999999, "baka", "Cirno", "I", "Fairy", "Pura", "2009:09:09", 9999, 9, FALSE, FALSE);
INSERT INTO usuario VALUES ("mugiwara", 5432121, "niku", "Monkey", "D", "Luffy", "Aplic", "2000:05:02", 40000, 10, FALSE, FALSE);
INSERT INTO usuario VALUES ("nappa", 8000000, "vegeta", "Grande", "F", "Nappa", "Comp", "2004:08:08", 8000, 80, FALSE, TRUE);
INSERT INTO usuario VALUES ("cnorris", 1000001, "rhkick", "Chuck", "R", "Norris", "Aplic", "1998:01:01", 4000, 50, TRUE, FALSE);
INSERT INTO usuario VALUES ("newton", 5432345, "fisicaS2", "Isaac", "P", "Newton", "Pura", "2006:06:04", 21000, 42, FALSE, FALSE);
INSERT INTO usuario VALUES ("mario", 8521474, "cogumelo", "Super", "K", "Mario", "Lic", "1999:11:26", 37001, 15, FALSE, FALSE);
INSERT INTO usuario VALUES ("ssnape", 3213210, "sonserina", "Severus", "S", "Snape", "Estat", "2003:09:14", 12500, 38, FALSE, FALSE);
INSERT INTO usuario VALUES ("gandalf", 4040404, "donotpass", "Gandalf", "T", "Grey", "Comp", "2007:05:02", 14000, 70, TRUE, FALSE);

#--------------------------------------------------------------

INSERT INTO imprime_em VALUES ("eniac", "2015:06:01", "13:20", "cirno", 0.5, "Lista Cálculo II", 2);

INSERT INTO imprime_em VALUES ("univac", "2015:06:02", "17:01", "monstro", 20, "Academia 101", 10);
INSERT INTO imprime_em VALUES ("eniac", "2015:06:02", "17:32", "gandalf", 10, "Resumo Anéis", 6);
INSERT INTO imprime_em VALUES ("colossus", "2015:06:02", "21:00", "monstro", 30, "Monster Chef", 8);
INSERT INTO imprime_em VALUES ("univac", "2015:06:02", "21:42", "newton", 70, "Leis de Newton", 30);

INSERT INTO imprime_em VALUES ("univac", "2015:06:03", "7:07", "nappa", 4, "Lidando com Fracasso", 5);
INSERT INTO imprime_em VALUES ("univac", "2015:06:03", "9:45", "cnorris", 1, "Chuck Norris Facts", 2);
INSERT INTO imprime_em VALUES ("eniac", "2015:06:03", "17:12", "monstro", 20, "Way of the Whey", 12);
INSERT INTO imprime_em VALUES ("colossus", "2015:06:03", "17:13", "mario", 0.7, "Princesa Raptada", 1);
INSERT INTO imprime_em VALUES ("eniac", "2015:06:03", "19:10", "mugiwara", 12, "One Piece 543", 7);

INSERT INTO imprime_em VALUES ("eniac", "2015:06:04", "8:00", "ssnape", 3, "Aula de Poções", 4);
INSERT INTO imprime_em VALUES ("colossus", "2015:06:04", "8:58", "nappa", 36, "8000 fórmulas", 20);
INSERT INTO imprime_em VALUES ("eniac", "2015:06:04", "9:06", "nappa", 50, "Dragon Ball Z 004", 18);
INSERT INTO imprime_em VALUES ("univac", "2015:06:04", "9:33", "fulano", 0.2, "Alguma folha", 1);
INSERT INTO imprime_em VALUES ("colossus", "2015:06:04", "10:01", "sicrano", 1.3, "Papéis legais", 3);
INSERT INTO imprime_em VALUES ("colossus", "2015:06:04", "10:35", "gaspar", 4, "Assombrando Legal", 3);

INSERT INTO imprime_em VALUES ("univac", "2015:06:05", "11:20", "mario", 14, "Irmão Verde", 10);
INSERT INTO imprime_em VALUES ("eniac", "2015:06:05", "12:01", "ssnape", 12, "Piadas da Grifinória", 5);

#--------------------------------------------------------------

INSERT INTO acessa VALUES ("cirno", "yoda", "2015:06:01", "13:05", "Físico");

INSERT INTO acessa VALUES ("monstro", "ryu", "2015:06:02", "16:52", "Físico");
INSERT INTO acessa VALUES ("gandalf", "alpha", "2015:06:02", "17:00", "Físico");
INSERT INTO acessa VALUES ("tiopatinhas", "beta", "2015:06:02", "17:04", "SSH");
INSERT INTO acessa VALUES ("monstro", "guile", "2015:06:02", "21:38", "Físico");
INSERT INTO acessa VALUES ("newton", "flumen", "2015:06:02", "21:30", "Físico");
INSERT INTO acessa VALUES ("mario", "obiwan", "2015:06:02", "21:34", "Físico");

INSERT INTO acessa VALUES ("cirno", "sagat", "2015:06:03", "6:40", "Físico");
INSERT INTO acessa VALUES ("fulano", "luke", "2015:06:03", "6:52", "Físico");
INSERT INTO acessa VALUES ("gandalf", "beta", "2015:06:03", "7:00", "SSH");
INSERT INTO acessa VALUES ("nappa", "ignis", "2015:06:03", "7:03", "Físico");
INSERT INTO acessa VALUES ("sicrano", "vader", "2015:06:03", "8:15", "Físico");
INSERT INTO acessa VALUES ("sicrano", "ken", "2015:06:03", "8:31", "SSH");
INSERT INTO acessa VALUES ("cnorris", "gama", "2015:06:03", "9:10", "Físico");
INSERT INTO acessa VALUES ("tiopatinhas", "alpha", "2015:06:03", "12:09", "Físico");
INSERT INTO acessa VALUES ("mario", "lychnus", "2015:06:03", "16:49", "Físico");
INSERT INTO acessa VALUES ("monstro", "vega", "2015:06:03", "17:00", "Físico");
INSERT INTO acessa VALUES ("ssnape", "umbra", "2015:06:03", "17:20", "Físico");
INSERT INTO acessa VALUES ("monstro", "ryu", "2015:06:03", "17:33", "SSH");
INSERT INTO acessa VALUES ("mugiwara", "guile", "2015:06:03", "18:42", "Físico");
INSERT INTO acessa VALUES ("gaspar", "terra", "2015:06:03", "21:00", "Físico");

INSERT INTO acessa VALUES ("ssnape", "ignis", "2015:06:04", "7:40", "Físico");
INSERT INTO acessa VALUES ("tiopatinhas", "alpha", "2015:06:04", "8:00", "SSH");
INSERT INTO acessa VALUES ("nappa", "chunli", "2015:06:04", "8:10", "Físico");
INSERT INTO acessa VALUES ("mario", "ventus", "2015:06:04", "8:22", "Físico");
INSERT INTO acessa VALUES ("fulano", "luke", "2015:06:04", "9:20", "Físico");
INSERT INTO acessa VALUES ("sicrano", "obiwan", "2015:06:04", "9:21", "Físico");
INSERT INTO acessa VALUES ("monstro", "sagat", "2015:06:04", "10:00", "Físico");
INSERT INTO acessa VALUES ("gaspar", "umbra", "2015:06:04", "10:29", "Físico");
INSERT INTO acessa VALUES ("cnorris", "beta", "2015:06:04", "10:42", "SSH");
INSERT INTO acessa VALUES ("ssnape", "vader", "2015:06:04", "14:41", "Físico");
INSERT INTO acessa VALUES ("gandalf", "alpha", "2015:06:04", "17:13", "Físico");

INSERT INTO acessa VALUES ("mario", "dhalsim", "2015:06:05", "11:00", "Físico");
INSERT INTO acessa VALUES ("ssnape", "lychnus", "2015:06:05", "12:32", "Físico");
INSERT INTO acessa VALUES ("tiopatinhas", "gama", "2015:06:05", "13:00", "SSH");

#--------------------------------------------------------------

INSERT INTO email VALUES (1, "cirno", "Como usa a impressora?", "2015:06:01", "13:30");

INSERT INTO email VALUES (2, "monstro", "Quero ficar monstrão!", "2015:06:02", "17:22");
INSERT INTO email VALUES (3, "tiopatinhas", "Atualização da rede", "2015:06:02", "17:30");
INSERT INTO email VALUES (4, "monstro", "Academia não vai dar férias", "2015:06:02", "17:42");
INSERT INTO email VALUES (5, "gandalf", "Tutorial de magia", "2015:06:02", "18:00");

INSERT INTO email VALUES (6, "fulano", "Link do vídeo legal", "2015:06:03", "7:20");
INSERT INTO email VALUES (7, "nappa", "chunli deve estar quebrada!", "2015:06:03", "7:45");
INSERT INTO email VALUES (8, "sicrano", "Gostei, haha", "2015:06:03", "8:21");
INSERT INTO email VALUES (9, "cnorris", "Obrigado por avisar", "2015:06:03", "9:37");
INSERT INTO email VALUES (10, "cnorris", "PC na corredor com defeito", "2015:06:03", "9:44");
INSERT INTO email VALUES (11, "tiopatinhas", "chunli consertada", "2015:06:03", "13:10");
INSERT INTO email VALUES (12, "mario", "Alguém viu o Luigi?", "2015:06:03", "17:03");
INSERT INTO email VALUES (13, "ssnape", "Discussão sobre tutorial", "2015:06:03", "18:00");
INSERT INTO email VALUES (14, "gaspar", "Boo!!!", "2015:06:03", "21:34");

INSERT INTO email VALUES (15, "fulano", "Sobre a academia", "2015:06:04", "9:30");
INSERT INTO email VALUES (16, "monstro", "Pode vim fazer, cara!", "2015:06:04", "10:10");
INSERT INTO email VALUES (17, "gaspar", "Tinta da impressora", "2015:06:04", "11:03");
INSERT INTO email VALUES (18, "gandalf", "Verificamos a tinta", "2015:06:04", "17:34");

INSERT INTO email VALUES (19, "mario", "Poção de cogumelos", "2015:06:05", "11:20");
INSERT INTO email VALUES (20, "ssnape", "Ingredientes da poção", "2015:06:05", "12:44");

#--------------------------------------------------------------

INSERT INTO enviado_para VALUES (1, "tiopatinhas", "Para");
INSERT INTO enviado_para VALUES (1, "gandalf", "Cc");
INSERT INTO enviado_para VALUES (1, "cnorris", "Cc");
INSERT INTO enviado_para VALUES (2, "nappa", "Para");
INSERT INTO enviado_para VALUES (2, "cnorris", "Cco");
INSERT INTO enviado_para VALUES (3, "gaspar", "Cco");
INSERT INTO enviado_para VALUES (3, "fulano", "Cco");
INSERT INTO enviado_para VALUES (3, "sicrano", "Cco");
INSERT INTO enviado_para VALUES (3, "tiopatinhas", "Cco");
INSERT INTO enviado_para VALUES (3, "monstro", "Cco");
INSERT INTO enviado_para VALUES (3, "cirno", "Cco");
INSERT INTO enviado_para VALUES (3, "mugiwara", "Cco");
INSERT INTO enviado_para VALUES (3, "nappa", "Cco");
INSERT INTO enviado_para VALUES (3, "cnorris", "Cco");
INSERT INTO enviado_para VALUES (3, "newton", "Cco");
INSERT INTO enviado_para VALUES (3, "mario", "Cco");
INSERT INTO enviado_para VALUES (3, "ssnape", "Cco");
INSERT INTO enviado_para VALUES (3, "gandalf", "Cco");
INSERT INTO enviado_para VALUES (4, "mario", "Para");
INSERT INTO enviado_para VALUES (4, "cirno", "Cc");
INSERT INTO enviado_para VALUES (5, "ssnape", "Para");
INSERT INTO enviado_para VALUES (6, "sicrano", "Para");
INSERT INTO enviado_para VALUES (7, "tiopatinhas", "Para");
INSERT INTO enviado_para VALUES (7, "gandalf", "Cc");
INSERT INTO enviado_para VALUES (7, "cnorris", "Cc");
INSERT INTO enviado_para VALUES (8, "fulano", "Para");
INSERT INTO enviado_para VALUES (9, "nappa", "Para");
INSERT INTO enviado_para VALUES (10, "tiopatinhas", "Para");
INSERT INTO enviado_para VALUES (10, "gandalf", "Cc");
INSERT INTO enviado_para VALUES (11, "cnorris", "Para");
INSERT INTO enviado_para VALUES (11, "gandalf", "Cc");
INSERT INTO enviado_para VALUES (11, "nappa", "Cc");
INSERT INTO enviado_para VALUES (12, "mugiwara", "Para");
INSERT INTO enviado_para VALUES (12, "newton", "Cco");
INSERT INTO enviado_para VALUES (12, "sicrano", "Cco");
INSERT INTO enviado_para VALUES (13, "gandalf", "Para");
INSERT INTO enviado_para VALUES (14, "mugiwara", "Para");
INSERT INTO enviado_para VALUES (15, "monstro", "Para");
INSERT INTO enviado_para VALUES (16, "fulano", "Para");
INSERT INTO enviado_para VALUES (17, "tiopatinhas", "Para");
INSERT INTO enviado_para VALUES (17, "gandalf", "Cc");
INSERT INTO enviado_para VALUES (17, "cnorris", "Cc");
INSERT INTO enviado_para VALUES (18, "gaspar", "Para");
INSERT INTO enviado_para VALUES (19, "ssnape", "Para");
INSERT INTO enviado_para VALUES (20, "mario", "Para");
