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

SELECT assunto
FROM email e
WHERE remetente IN (
    SELECT username
    FROM usuario
    WHERE ADMIN = TRUE
) AND EXISTS (
    SELECT *
    FROM enviado_para, usuario u
    WHERE 
        destinatario = username
        AND u.ADMIN = TRUE
        AND idEmail = e.id
);

#--------------------------------------------------------------
# EXEMPLO 3
#
# Buscar nome e versão de pacotes que simultaneamente dependam
# e sejam dependência de outros pacotes.
#--------------------------------------------------------------

SELECT nome, versao
FROM pacote AS p, depende_de AS d
WHERE d.nomeDep = p.nome AND EXISTS (
    SELECT *
    FROM depende_de AS x
    WHERE x.nomePacote = p.nome
);
