<--- MAC0426 - Prof. João Eduardo Ferreira --->
<--------- Projeto de Banco de Dados --------->

Integrantes:
    - (7557797) Gustavo Chicato Wandeur
    - (8536065) Leonardo Pereira Macedo
    - (8536221) Vinícius Bitencourt Matos

+-------------------------------+
|     DESCRIÇÃO DO DOMÍNIO      |
| Projeto: Rede de Computadores |
+-------------------------------+

Inspirados na Rede Linux do IME-USP, buscamos criar um Banco
de Dados para uma rede de computadores. Abaixo encontram-se
os tópicos principais e suas respectivas informações a serem
armazenadas.

Usuário
=======
- Username
- Senha (criptografada)
- Nome completo
- Nº USP
- Grupo (curso)
- Data de cadastro
- Quota de disco
- Quota de impressão
- Administrador? (sim/não)

Máquina
=======
- Hostname
- Endereço IP
- MAC Address
- Sala (local)
- Tipo (cliente/servidor)

Impressora
==========
- Nome
- Endereço IP
- Marca
- Modelo
- Sala (local)

Pacote
======
- Nome
- Versão instalada
- Dependências (outros pacotes)

Acesso
======
- Usuário
- Máquina
- Data
- Horário

Impressão
=========
- Usuário
- Impressora
- Data
- Horário
- Nº de folhas impressas
