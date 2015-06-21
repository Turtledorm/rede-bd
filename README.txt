<--- MAC0426 - Prof. João Eduardo Ferreira --->
<--------- Projeto de Banco de Dados --------->

Integrantes:
    - (7557797) Gustavo Chicato Wandeur
    - (8536065) Leonardo Pereira Macedo
    - (8536221) Vinícius Bitencourt Matos

+-----------------+
|   VISÂO GERAL   |
+-----------------+

Citaremos aqui um resumo geral dos arquivos presentes neste trabalho.

brModelo/
=========
  - **conceitual.brM**: Contém o projeto conceitual do BD;
  - **logico.brM**: Contém o projeto lógico do BD.

sql/
====
  - **fisico.sql**: Contém o projeto físico. Inclui a criação do BD, das tabelas e a inserção de tuplas;
  - **consulta.sql**: Contém exemplos de consultas para serem usadas no projeto físico.

+-------------------------------+
|     DESCRIÇÃO DO DOMÍNIO      |
| Projeto: Rede de Computadores |
+-------------------------------+

Inspirados na Rede Linux do IME-USP, buscamos criar um Banco de Dados para uma
rede de computadores. São contidas informações a respeito dos usuários, salas, máquinas
e impressoras, bem como lista de pacotes (programas) instalados. Para cada usuário,
são guardados seus atributos de identificação, quotas, bem como listas de emails
enviados e recebidos. Máquina consta com suas especificações e um histórico de
acesso dos usuários. Impressora possui atributos técnicos e histórico de
impressões. Por fim, email contém os dados de cada mensagem (por simplicidade,
são considerados emails enviados apenas entre usuários da rede local).

Abaixo encontram-se os tópicos principais e um esboço dos respectivos atributos.

Usuário
=======
- Username
- Senha (criptografada)
- Nº USP
- Nome completo
- Grupo (curso)
- Data de cadastro
- Quota de disco
- Quota de impressão
- Administrador? (sim/não)
- Suspenso? (sim/não)

Máquina
=======
- Hostname
- Endereço IP
- MAC Address
- Sala (ID)
- Tipo (cliente/servidor)

Impressora
==========
- Nome
- Endereço IP
- Marca
- Modelo
- Driver
- Sala (ID)

Sala
====
- ID
- Nome
- Localização

Pacote
======
- Nome
- Versão instalada
- Dependências (outros pacotes)

Acesso
======
- Máquina
- Usuário
- Data/hora
- Meio (físico/ssh)

Impressão
=========
- Impressora
- Usuário
- Data/hora
- Título do arquivo
- Tamanho do arquivo
- Nº de folhas impressas

Email
=====
- De
- Para/cópia/cópia oculta
- Assunto
- Corpo
- Data/hora
