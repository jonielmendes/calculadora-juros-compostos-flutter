# Calculadora de Juros Compostos - Flutter

Este projeto implementa uma calculadora de juros compostos em Flutter, com duas funcionalidades principais:


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
