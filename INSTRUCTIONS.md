# Instruções de Execução - Calculadora de Juros Compostos

## Como alternar entre as diferentes versões do app

### Opção 1: Calculadora Simples (Padrão)
O app já está configurado para rodar a calculadora simples por padrão.
```bash
flutter run
```

### Opção 2: Simulador de Comparação
Para testar o simulador de comparação, você tem duas opções:

#### Método 1 - Alterando temporariamente o main.dart:
1. Abra o arquivo `lib/main.dart`
2. Substitua o conteúdo por:
```dart
import 'package:flutter/material.dart';
import 'simulador_comparacao.dart';

void main() => runApp(const SimuladorComparacaoApp());
```
3. Execute: `flutter run`

#### Método 2 - Executando diretamente:
```bash
flutter run lib/main_comparacao.dart
```

### Para voltar à calculadora simples:
1. Restaure o conteúdo original do `lib/main.dart`:
```dart
import 'package:flutter/material.dart';
import 'calculadora_juros.dart';

/// Aplicativo de exemplo: Calculadora de Juros Compostos
void main() => runApp(const CalculadoraJurosApp());
```

## Testando as Funcionalidades

### Calculadora Simples:
1. Insira valores nos campos (ex: Capital: 1000, Aplicação: 100, Período: 12, Taxa: 1)
2. Toque em "Calcular"
3. Visualize os resultados na nova tela

### Simulador de Comparação:
1. Preencha os dados de ambos os investimentos
2. Defina o período compartilhado
3. Toque em "Comparar Investimentos" 
4. Analise a comparação lado a lado

## Dicas para Demonstração

### Dados de Teste Sugeridos:

**Para Calculadora Simples:**
- Capital Inicial: R$ 5.000
- Aplicação Mensal: R$ 300
- Período: 24 meses
- Taxa: 0,8% ao mês

**Para Comparação:**

*Investimento 1 (Conservador):*
- Capital: R$ 10.000
- Aplicação: R$ 500
- Taxa: 0,6% ao mês

*Investimento 2 (Moderado):*
- Capital: R$ 8.000
- Aplicação: R$ 600
- Taxa: 1,2% ao mês

*Período:* 18 meses

## Recursos do App

✅ Validação de campos obrigatórios
✅ Tratamento de erros de entrada
✅ Navegação entre telas
✅ Cálculos precisos de juros compostos
✅ Interface intuitiva
✅ Comparação visual de investimentos
✅ Evolução mensal detalhada

## Próximos Passos para o Desafio

Os alunos devem:
1. Implementar o simulador de comparação
2. Adicionar melhorias visuais (gráficos, cores)
3. Criar validações adicionais
4. Documentar o código
5. Gravar vídeo demonstrativo