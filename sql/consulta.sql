#=========================#
#  EXEMPLOS DE CONSULTAS  #
#=========================#

#--------------------------------------------------------------
# EXEMPLO 1
#
# Buscar username, primeiro nome e sobrenome dos usuários
# não suspensos que imprimiram pelo menos uma vez em
# todas as impressoras.
#--------------------------------------------------------------

SELECT username, pNome, sNome
FROM usuario AS u
WHERE u.suspenso = FALSE AND NOT EXISTS (
    SELECT *
    FROM impressora AS i
    WHERE NOT EXISTS (
        SELECT *
        FROM imprime_em AS ie
        WHERE ie.impressora = i.nome AND ie.usuario = u.username
    ) 
);

#--------------------------------------------------------------
# EXEMPLO 2
# 
# Buscar assunto de e-mails cujo remetente e ao menos um
# destinatário sejam ambos administradores.
#--------------------------------------------------------------



#--------------------------------------------------------------
# EXEMPLO 3
#
# Buscar nome e versão dos pacotes que sejam simultaneamente
# dependentes e dependência de outros pacotes.
#--------------------------------------------------------------

SELECT nome
FROM pacotes AS p and depende_de AS d
WHERE p.nome = d.nome AND 

