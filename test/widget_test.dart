import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_2/calculadora_juros.dart';

void main() {
  testWidgets('Calculadora Juros App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const CalculadoraJurosApp());
    expect(find.text('Calculadora de Juros Compostos'), findsOneWidget);
    expect(find.text('Investimento inicial (R\$)'), findsOneWidget);
    expect(find.text('Aplicação mensal (R\$)'), findsOneWidget);
    expect(find.text('Período (meses)'), findsOneWidget);
    expect(find.text('Taxa de juros mensal (%)'), findsOneWidget);
    expect(find.text('Calcular'), findsOneWidget);
  });
}
