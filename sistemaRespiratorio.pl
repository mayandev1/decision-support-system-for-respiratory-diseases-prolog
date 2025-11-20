% ---------------------------------------------------------
% SISTEMA DE APOIO À DECISÃO PARA DOENÇAS RESPIRATÓRIAS
% ---------------------------------------------------------

:- initialization(iniciar).

% Carregar a base de fatos enviada

carregarBase :-
    ( exists_file('Doencas_respiratorias.pl') ->
        consult('Doencas_respiratorias.pl'),
        write('Base de dados carregada com sucesso.'), nl
    ;
        write('ERRO: Arquivo Doencas_respiratorias.pl nao encontrado.'), nl
    ).

% Pesos e multiplicadores definidos pelo professor

pesoClassificacao(comum, 1.0).
pesoClassificacao(raro, 0.5).
pesoClassificacao(critico, 2.0).

multiplicadorIntensidade(leve, 0.8).
multiplicadorIntensidade(moderada, 1.0).
multiplicadorIntensidade(alta, 1.1).
multiplicadorIntensidade(severa, 1.2).

multiplicadorFrequencia(raro, 0.7).
multiplicadorFrequencia(intermitente, 1.0).
multiplicadorFrequencia(continuo, 1.2).

% Função auxiliar para verificar se um item está na lista

pertence(X, [X|_]).
pertence(X, [_|Cauda]) :- pertence(X, Cauda).

% Listar todas as doenças existentes na base

listarDoencas(Doencas) :-
    coletarDoencas([], Doencas).

coletarDoencas(Acumulador, ResultadoFinal) :-
    sintoma(Doenca, _, _, _, _, _, _),
    ( pertence(Doenca, Acumulador) ->
        fail
    ;
        coletarDoencas([Doenca|Acumulador], ResultadoFinal)
    ).
coletarDoencas(Resultado, Resultado).

% Calcular o score de UM sintoma para UMA doença

calcularScoreSintoma(Doenca, SintomaInformado, IntensidadeUser, FrequenciaUser, ScoreFinal) :-
    ( sintoma(Doenca, SintomaInformado, intensidade(IntBase), prob(P), _, frequencia(FreqBase), Classificacao) ->
        
        ( pesoClassificacao(Classificacao, PC) -> true ; PC = 1.0),
        ( multiplicadorIntensidade(IntBase, MI) -> true ; MI = 1.0),
        ( multiplicadorFrequencia(FreqBase, MF) -> true ; MF = 1.0),

        % Como o professor pediu fórmula com intensidade e frequencia do usuário:
        (multiplicadorIntensidade(IntensidadeUser, MIuser) -> true ; MIuser = 1.0 ),
        (multiplicadorFrequencia(FrequenciaUser, MFuser) -> true ; MFuser = 1.0 ),

        ScoreFinal is P * PC * MI * MF * MIuser * MFuser
    ;
        ScoreFinal = 0
    ).

% Somar os scores de todos os sintomas informados

somarScores(_, [], Ac, Ac).
somarScores(Doenca, [(Sint, Int, Freq)|Resto], Ac, Resultado) :-
    calcularScoreSintoma(Doenca, Sint, Int, Freq, Parcial),
    NovoAc is Ac + Parcial,
    somarScores(Doenca, Resto, NovoAc, Resultado).

% Diagnosticar doenças baseado nos sintomas fornecidos

diagnosticar(ListaSintomas, ResultadoFinal) :-
    listarDoencas(Doencas),
    avaliarTodas(Doencas, ListaSintomas, [], ResultadoFinal).

avaliarTodas([], _, Ac, Ac).
avaliarTodas([Doenca|Resto], ListaSintomas, Ac, ResultadoFinal) :-
    somarScores(Doenca, ListaSintomas, 0, Score),
    avaliarTodas(Resto, ListaSintomas, [Doenca-Score|Ac], ResultadoFinal).

% Explicar diagnóstico: detalha o score sintoma por sintoma

explicar(Doenca, ListaSintomas, ExplicacaoFinal) :-
    explicarRec(Doenca, ListaSintomas, [], ExplicacaoFinal).

explicarRec(_, [], Ac, Ac).
explicarRec(Doenca, [(Sint, Int, Freq)|Resto], Ac, Final) :-
    calcularScoreSintoma(Doenca, Sint, Int, Freq, Score),
    explicarRec(Doenca, Resto,
        [(Sint, intensidade_usuario=Int, frequencia_usuario=Freq, score=Score)|Ac],
        Final).

% Perguntar os sintomas ao usuário

perguntarSintomas(ListaFinal) :-
    write('Digite sintomas (escreva fim para terminar).'), nl,
    perguntarSintoma([], ListaFinal).

perguntarSintoma(Ac, Ac) :-
    write('Sintoma: '),
    read_line_to_string(user_input, S),
    string_lower(S, "fim"), !.

perguntarSintoma(Ac, ListaFinal) :-
    write('Sintoma: '),
    read_line_to_string(user_input, SintStr),

    ( string_lower(SintStr, "fim") ->
        ListaFinal = Ac
    ;
        atom_string(SintomaAtom, SintStr),

        write('Intensidade (leve/moderada/alta/severa): '),
        read_line_to_string(user_input, Istr),
        atom_string(IntAtom, Istr),

        write('Frequencia (raro/intermitente/continuo): '),
        read_line_to_string(user_input, Fstr),
        atom_string(FreqAtom, Fstr),

        % Adiciona o novo sintoma completo
        perguntarSintoma([(SintomaAtom, IntAtom, FreqAtom)|Ac], ListaFinal)
    ).

% Iniciar sistema

iniciar :-
    carregarBase,
    nl,
    write('Sistema de Apoio a Doenças Respiratorias iniciado.'), nl,
    write('Use: perguntarSintomas(L), diagnosticar(L, Resultado).'), nl,
    write('Ou: diagnosticar([(tosse,moderada,continuo)], R).'), nl, nl.
