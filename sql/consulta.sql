#=========================#
#  EXEMPLOS DE CONSULTAS  #
#=========================#

#--------------------------------------------------------------
# EXEMPLO 1
#
# Buscar os usernames, primeiros nomes e sobrenomes dos
# usuários não suspensos que imprimiram pelo menos uma vez em
# cada impressora.
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
# Buscar pacotes que simultaneamente dependam e sejam
# dependência de outros pacotes.
#--------------------------------------------------------------
