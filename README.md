# Calculadora de Juros Compostos - Flutter

Este projeto implementa uma calculadora de juros compostos em Flutter, com duas funcionalidades principais:

## 📱 Funcionalidades

### 1. Calculadora Simples de Juros Compostos
- **Arquivo principal:** `lib/main.dart` e `lib/calculadora_juros.dart`
- Calcula rendimentos de um único investimento
- Exibe evolução mensal detalhada
- Interface limpa e intuitiva

### 2. Simulador de Comparação de Investimentos (Desafio)
- **Arquivo principal:** `lib/main_comparacao.dart` e `lib/simulador_comparacao.dart`
- Compara dois investimentos lado a lado
- Mostra qual investimento é mais rentável
- Tabela comparativa mensal

## 🚀 Como Executar

### Executar a Calculadora Simples:
```bash
flutter run lib/main.dart
```

### Executar o Simulador de Comparação:
```bash
flutter run lib/main_comparacao.dart
```

## 📋 Campos de Entrada

Para ambas as aplicações, você precisará inserir:

- **Capital Inicial (R$):** Valor inicial do investimento
- **Aplicação Mensal (R$):** Valor depositado mensalmente
- **Período (meses):** Duração do investimento em meses
- **Taxa de Juros Mensal (%):** Taxa de rentabilidade por mês

## 🔢 Exemplo de Cálculo

### Dados de Entrada:
- **Investimento 1:** Capital: R$ 10.000, Aplicação: R$ 500, Taxa: 1,0% a.m.
- **Investimento 2:** Capital: R$ 12.000, Aplicação: R$ 400, Taxa: 1,2% a.m.
- **Período:** 24 meses

### Exemplo de Tela de Resultados:

| Mês | Investimento 1 (R$) | Investimento 2 (R$) |
|-----|---------------------|---------------------|
| 1   | 10.600,00          | 12.544,00          |
| 2   | 11.206,00          | 13.103,28          |
| ... | ...                | ...                |

## 🎯 Desafio para Alunos

### Objetivo
Criar um simulador que permite comparar dois investimentos diferentes, mostrando:
- Montante final de cada investimento
- Rendimento total acumulado
- Evolução mensal comparativa
- Indicação do melhor investimento

### Critérios de Avaliação
- **Funcionalidade (40%):** Cálculos corretos e comparação completa
- **Interface (30%):** Design intuitivo e navegação fluida
- **Qualidade do Código (20%):** Organização e boas práticas
- **Apresentação (10%):** README claro e vídeo explicativo

## 🛠️ Tecnologias Utilizadas

- **Flutter:** Framework de desenvolvimento
- **Dart:** Linguagem de programação
- **Material Design:** Interface de usuário

## 📚 Conceitos Aplicados

- **Juros Compostos:** J = C × [(1 + i)^n - 1]
- **Montante:** M = C × (1 + i)^n
- **Aplicações Periódicas:** Considerando aportes mensais constantes

## 🔧 Estrutura do Projeto

```
lib/
├── main.dart                    # App principal (calculadora simples)
├── main_comparacao.dart         # App do simulador de comparação
├── calculadora_juros.dart       # Lógica da calculadora simples
└── simulador_comparacao.dart    # Lógica do simulador de comparação

test/
└── widget_test.dart            # Testes básicos
```

## 💡 Melhorias Futuras

- [ ] Gráficos de evolução dos investimentos
- [ ] Exportação de relatórios em PDF
- [ ] Histórico de simulações
- [ ] Calculadora de diferentes tipos de juros
- [ ] Comparação com inflação
- [ ] Simulação de cenários otimista/pessimista

## 📖 Referências

- [Calculadora de Juros Compostos - iDinheiro](https://www.idinheiro.com.br/calculadoras/calculadora-juros-compostos/)
- [Calculadora de Juros Compostos - Suno](https://www.suno.com.br/ferramentas/calculadora-juros-compostos/)
- [Flutter Documentation](https://flutter.dev/docs)

## 👥 Contribuição

Este projeto foi desenvolvido para fins educacionais. Sinta-se à vontade para:
- Fazer fork do projeto
- Criar melhorias
- Sugerir novas funcionalidades
- Reportar bugs

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

---

**Desenvolvido para a disciplina de Programação para Dispositivos Móveis**
