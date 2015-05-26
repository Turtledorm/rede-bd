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
- Sala (local)
- Tipo (cliente/servidor)

Impressora
==========
- Nome
- Endereço IP
- Marca
- Modelo
- Driver
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
- Data/hora
- Meio (físico/ssh)

Impressão
=========
- Usuário
- Impressora
- Data/hora
- Título do arquivo
- Nº de folhas impressas
