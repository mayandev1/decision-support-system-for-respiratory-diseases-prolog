% 1) FATOS - sintomas por doença

% --- Tosse
sintoma(gripe, tosse, intensidade(moderada), prob(0.7), duracao(dias), frequencia(intermitente), comum).
sintoma(resfriado, tosse, intensidade(leve), prob(0.8), duracao(dias), frequencia(intermitente), comum).
sintoma(covid19, tosse, intensidade(moderada), prob(0.85), duracao(dias), frequencia(continuo), critico).
sintoma(influenza, tosse, intensidade(alta), prob(0.9), duracao(dias), frequencia(continuo), critico).
sintoma(asma, tosse, intensidade(moderada), prob(0.6), duracao(dias), frequencia(intermitente), comum).
sintoma(rinite, tosse, intensidade(leve), prob(0.4), duracao(dias), frequencia(intermitente), raro).
sintoma(tuberculose, tosse, intensidade(severa), prob(0.9), duracao(semanas), frequencia(continuo), critico).
sintoma(pneumonia, tosse, intensidade(severa), prob(0.8), duracao(semanas), frequencia(continuo), critico).

% --- Falta de ar (Dispneia)
sintoma(covid19, falta_de_ar, intensidade(severa), prob(0.9), duracao(dias), frequencia(continuo), critico).
sintoma(influenza, falta_de_ar, intensidade(leve), prob(0.4), duracao(dias), frequencia(raro), comum).
sintoma(asma, falta_de_ar, intensidade(severa), prob(0.85), duracao(horas_dias), frequencia(intermitente), critico).
sintoma(tuberculose, falta_de_ar, intensidade(moderada), prob(0.7), duracao(semanas), frequencia(continuo), comum).
sintoma(pneumonia, falta_de_ar, intensidade(severa), prob(0.85), duracao(semanas), frequencia(continuo), critico).
sintoma(outras_respiratorias, falta_de_ar, intensidade(moderada), prob(0.75), duracao(dias), frequencia(intermitente), comum).

% --- Febre
sintoma(gripe, febre, intensidade(moderada), prob(0.8), duracao(dias), frequencia(continuo), comum).
sintoma(resfriado, febre, intensidade(leve), prob(0.2), duracao(horas), frequencia(raro), raro).
sintoma(covid19, febre, intensidade(alta), prob(0.9), duracao(dias), frequencia(continuo), critico).
sintoma(influenza, febre, intensidade(alta), prob(0.85), duracao(dias), frequencia(continuo), critico).
sintoma(pneumonia, febre, intensidade(moderada), prob(0.7), duracao(dias), frequencia(continuo), comum).

% --- Congestão Nasal
sintoma(resfriado, congestao_nasal, intensidade(moderada), prob(0.9), duracao(dias), frequencia(continuo), comum).
sintoma(rinite, congestao_nasal, intensidade(severa), prob(0.95), duracao(dias), frequencia(continuo), critico).
sintoma(gripe, congestao_nasal, intensidade(leve), prob(0.3), duracao(dias), frequencia(raro), raro).
sintoma(covid19, congestao_nasal, intensidade(leve), prob(0.2), duracao(dias), frequencia(raro), raro).

% --- Coriza
sintoma(resfriado, coriza, intensidade(moderada), prob(0.9), duracao(dias), frequencia(continuo), comum).
sintoma(rinite, coriza, intensidade(moderada), prob(0.95), duracao(dias), frequencia(continuo), critico).
sintoma(gripe, coriza, intensidade(leve), prob(0.3), duracao(dias), frequencia(raro), raro).

% --- Espirros
sintoma(resfriado, espirros, intensidade(leve), prob(0.85), duracao(dias), frequencia(intermitente), comum).
sintoma(rinite, espirros, intensidade(moderada), prob(0.9), duracao(dias), frequencia(continuo), critico).

% --- Dor de Garganta
sintoma(resfriado, dor_garganta, intensidade(moderada), prob(0.8), duracao(dias), frequencia(intermitente), comum).
sintoma(gripe, dor_garganta, intensidade(leve), prob(0.3), duracao(dias), frequencia(raro), raro).

% --- Dor de Cabeça
sintoma(pneumonia, dor_cabeca, intensidade(moderada), prob(0.6), duracao(dias), frequencia(intermitente), comum).
sintoma(covid19, dor_cabeca, intensidade(moderada), prob(0.5), duracao(dias), frequencia(intermitente), comum).
sintoma(influenza, dor_cabeca, intensidade(leve), prob(0.3), duracao(dias), frequencia(raro), raro).

% --- Mal-estar Geral
sintoma(gripe, mal_estar, intensidade(moderada), prob(0.8), duracao(dias), frequencia(continuo), comum).
sintoma(covid19, mal_estar, intensidade(alta), prob(0.85), duracao(dias), frequencia(continuo), critico).
sintoma(pneumonia, mal_estar, intensidade(alta), prob(0.7), duracao(dias), frequencia(continuo), comum).

% --- Fadiga
sintoma(covid19, fadiga, intensidade(severa), prob(0.85), duracao(dias_semanas), frequencia(continuo), critico).
sintoma(pneumonia, fadiga, intensidade(severa), prob(0.75), duracao(semanas), frequencia(continuo), critico).
sintoma(influenza, fadiga, intensidade(moderada), prob(0.4), duracao(dias), frequencia(intermitente), comum).

% --- Chiado no Peito
sintoma(asma, chiado, intensidade(severa), prob(0.95), duracao(horas_dias), frequencia(intermitente), critico).
sintoma(doencas_pulmonares_cronicas, chiado, intensidade(moderada), prob(0.8), duracao(semanas), frequencia(continuo), comum).

% --- Perda de Paladar / Olfato
sintoma(covid19, perda_paladar, intensidade(severa), prob(0.95), duracao(dias_semanas), frequencia(continuo), critico).
sintoma(covid19, perda_olfato, intensidade(severa), prob(0.95), duracao(dias_semanas), frequencia(continuo), critico).
sintoma(influenza, perda_paladar, intensidade(leve), prob(0.2), duracao(dias), frequencia(raro), raro).

% --- Hemoptise
sintoma(tuberculose, hemoptise, intensidade(severa), prob(0.9), duracao(semanas), frequencia(intermitente), critico).
sintoma(pneumonia, hemoptise, intensidade(moderada), prob(0.3), duracao(dias), frequencia(raro), comum).

% Pesos 
% =====================================================

pesoClassificacao(comum,1.0).
pesoClassificacao(raro,0.5). 
pesoClassificacao(critico,2.0). 

multiplicadorIntensidade(leve,0.8). 
multiplicadorIntensidade(moderada,1.0). 
multiplicadorIntensidade(alta,1.1). 
multiplicadorIntensidade(severa,1.2). 

multiplicadorFrequencia(raro,0.7).
multiplicadorFrequencia(intermitente,1.0).
multiplicadorFrequencia(continuo,1.2).

% Regras Aux
% =====================================================

pertence(X,[X|_]).
pertence(X,[_|R]) :- pertence(X,R).


% Lista de Doenças
% =====================================================

todasDoencas([
    gripe, resfriado, covid19, influenza,
    asma, rinite, tuberculose, pneumonia,
    outras_respiratorias, doencas_pulmonares_cronicas
]).

% Calculo de Score por Sintoma
% =====================================================

calcularScore(Doenca, SintomaUsuario, IntensidadeUsuario, FrequenciaUsuario, ResultadoScore) :-
    (
        sintoma(Doenca, SintomaUsuario, intensidade(IntensidadeBase),
                prob(Prob), _, frequencia(FreqBase), Classificacao)
    ->
        pesoClassificacao(Classificacao, Peso),
        multiplicadorIntensidade(IntensidadeBase, MIb),
        multiplicadorFrequencia(FreqBase, MFb),
        multiplicadorIntensidade(IntensidadeUsuario, MIu),
        multiplicadorFrequencia(FrequenciaUsuario, MFu),

        ResultadoScore is Prob * Peso * MIb * MFb * MIu * MFu
    ;
        ResultadoScore = 0
    ).

% Somar Score
% =====================================================

somarScores(_, [], Acumulado, Acumulado).

somarScores(Doenca, [(Sint,I,F)|Resto], Acumulado, ResultadoFinal) :-
    calcularScore(Doenca, Sint, I, F, Parcial),
    Novo is Acumulado + Parcial,
    somarScores(Doenca, Resto, Novo, ResultadoFinal).

% Diagnostico
% =====================================================

diagnosticar([], _) :-
    write('ERRO: Nenhum sintoma informado!'), nl,
    write('Use: perguntarSintomas(L).'), nl,
    !, fail.

diagnosticar(ListaSintomas, ResultadoFinal) :-
    todasDoencas(Doencas),
    processar(Doencas, ListaSintomas, [], ResultadoInvertido),
    reverse(ResultadoInvertido, ResultadoFinal),
    exibir(ResultadoFinal).

processar([], _, Ac, Ac).
processar([D|R], ListaSint, Ac, Final) :-
    somarScores(D, ListaSint, 0, Score),
    processar(R, ListaSint, [D-Score|Ac], Final).

% Exibir os Resultados
% =====================================================

exibir([]).
exibir([Doenca-Valor | R]) :-
    format('~w = ~2f~n', [Doenca, Valor]),
    exibir(R).

%  Perguntar os Sintomas do paciente
% =====================================================

perguntarSintomas(Final) :-
    perguntar([], Final).

perguntar(Ac, Final) :-
    write('Sintoma (digite fim para encerrar): '),
    read_line_to_string(user_input, S),
    (   string_lower(S, "fim") ->
        Final = Ac, !
    ;
        (   S = "" ->
            write('ERRO: Digite um sintoma valido!'), nl,
            perguntar(Ac, Final)
        ;
            atom_string(Sintoma, S),
            pedirIntensidade(Int),
            pedirFrequencia(Freq),
            perguntar([(Sintoma,Int,Freq)|Ac], Final)
        )
    ).

pedirIntensidade(I) :-
    write('Intensidade (leve/moderada/alta/severa): '),
    read_line_to_string(user_input, S),
    atom_string(Int, S),
    ( Int = leve ; Int = moderada ; Int = alta ; Int = severa ) ->
        I = Int
    ;
        write('ERRO: Intensidade invalida!'), nl,
        pedirIntensidade(I).

pedirFrequencia(F) :-
    write('Frequencia (raro/intermitente/continuo): '),
    read_line_to_string(user_input, S),
    atom_string(Freq, S),
    ( Freq = raro ; Freq = intermitente ; Freq = continuo ) ->
        F = Freq
    ;
        write('ERRO: Frequencia invalida!'), nl,
        pedirFrequencia(F).