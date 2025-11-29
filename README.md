# 🩺 Sistema Especialista para Diagnóstico de Doenças Respiratórias

> *Sistema inteligente em Prolog para auxílio no diagnóstico de doenças respiratórias*

## 📋 Sobre o Projeto

Sistema especialista desenvolvido em Prolog que utiliza uma base de conhecimento médica para auxiliar no diagnóstico de doenças respiratórias através da análise de sintomas, intensidade e frequência relatados pelo usuário.

### 🎯 Características Principais

- **Base de conhecimento robusta** com 10 doenças respiratórias
- **15 sintomas diferentes** com probabilidades específicas
- **Cálculo de scores** baseado em múltiplos fatores
- **Interface interativa** para coleta de sintomas
- **Validação completa** de entradas do usuário
- **Diagnóstico probabilístico** ordenado por relevância

## 🏥 Doenças Suportadas

| Doença | Sintomas Principais |
|--------|---------------------|
| 🤧 Gripe | Tosse, febre, mal-estar |
| 😷 COVID-19 | Febre, falta de ar, perda de olfato/paladar |
| 🦠 Influenza | Tosse, febre alta, fadiga |
| 🌬️ Asma | Chiado, falta de ar, tosse |
| 🤧 Rinite | Congestão nasal, espirros, coriza |
| 🦠 Tuberculose | Tosse severa, hemoptise, falta de ar |
| 🫁 Pneumonia | Tosse severa, febre, fadiga |
| 😪 Resfriado | Coriza, congestão nasal, espirros |

## 🚀 Como Usar

### 1. Iniciar o Sistema
```prolog
?- [sistema_respiratorio].
```

### 2. Coletar Sintomas
```prolog
?- perguntarSintomas(ListaSintomas).
```

### 3. Obter Diagnóstico
```prolog
?- diagnosticar(ListaSintomas, Resultado).
```

### 🎮 Exemplo de Uso
```
Sintoma (digite fim para encerrar): tosse
Intensidade (leve/moderada/alta/severa): moderada
Frequencia (raro/intermitente/continuo): intermitente

Sintoma (digite fim para encerrar): febre  
Intensidade (leve/moderada/alta/severa): alta
Frequencia (raro/intermitente/continuo): continuo

Sintoma (digite fim para encerrar): fim

?- diagnosticar(ListaSintomas, Resultado).
covid19 = 8.42
influenza = 7.92
gripe = 4.48
...
```

## 🔧 Estrutura do Sistema

### 📊 Base de Conhecimento
```prolog
sintoma(doenca, sintoma, intensidade(X), prob(P), duracao(Y), frequencia(Z), classificacao)
```

### ⚖️ Fatores de Ponderação
- **Classificação**: comum (1.0), raro (0.5), crítico (2.0)
- **Intensidade**: leve (0.8), moderada (1.0), alta (1.1), severa (1.2)
- **Frequência**: raro (0.7), intermitente (1.0), contínuo (1.2)

### 🧮 Fórmula do Score
```
Score = Prob × Peso × MI_base × MF_base × MI_user × MF_user
```

## 📁 Estrutura de Arquivos

```
sistema_respiratorio/
├── sistema_respiratorio.pl    # Código fonte principal
├── relatorio_sbc.pdf          # Relatório técnico
└── README.md                  # Este arquivo
```

## 🛠️ Requisitos

- **Sistema**: Qualquer interpretador Prolog (SWI-Prolog recomendado)
- **Dependências**: Nenhuma - sistema autossuficiente

## ⚠️ Aviso Importante

> **NOTA MÉDICA**: Este sistema é um **auxiliar educacional** e **NÃO substitui** diagnóstico médico profissional. Sempre consulte um médico para sintomas respiratórios.

## 👨‍💻 Desenvolvimento

**Desenvolvedor**: Mayan Gabriel  
**Disciplina**: Programação Lógica  
**Professor**: Alan Rafael  
**Instituição**: Universidade Federal do Piauí (UFPI)  
**Curso**: Bacharelado em Sistemas de Informação

## 📞 Suporte

Para dúvidas ou problemas com o sistema, entre em contato:
- **Email**: mayangabriel654@gmail.com

---

<div align="center">

**💡 Desenvolvido com 💙 e Prolog**