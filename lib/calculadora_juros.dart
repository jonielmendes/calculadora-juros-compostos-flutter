import 'package:flutter/material.dart';

class CalculadoraJurosApp extends StatelessWidget {
  const CalculadoraJurosApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CalculadoraJurosPage(),
    );
  }
}

class CalculadoraJurosPage extends StatefulWidget {
  const CalculadoraJurosPage({Key? key}) : super(key: key);

  @override
  State<CalculadoraJurosPage> createState() => _CalculadoraJurosPageState();
}

class _CalculadoraJurosPageState extends State<CalculadoraJurosPage> {
  final TextEditingController _capitalController = TextEditingController();
  final TextEditingController _aplicacaoMensalController = TextEditingController();
  final TextEditingController _mesesController = TextEditingController();
  final TextEditingController _taxaJurosController = TextEditingController();
  void _mostrarAlerta(String mensagem) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Atenção'),
        content: Text(mensagem),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Juros Compostos'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _campoTexto(
              controller: _capitalController,
              label: 'Investimento inicial (R\$)',
            ),
            _campoTexto(
              controller: _aplicacaoMensalController,
              label: 'Aplicação mensal (R\$)',
            ),
            _campoTexto(
              controller: _mesesController,
              label: 'Período (meses)',
              tipoTeclado: TextInputType.number,
            ),
            _campoTexto(
              controller: _taxaJurosController,
              label: 'Taxa de juros mensal (%)',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: _calcularJurosCompostos,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text('Calcular', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _campoTexto({
    required TextEditingController controller,
    required String label,
    TextInputType tipoTeclado = TextInputType.number,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: tipoTeclado,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
  void _calcularJurosCompostos() {
    if (_capitalController.text.isEmpty ||
        _aplicacaoMensalController.text.isEmpty ||
        _mesesController.text.isEmpty ||
        _taxaJurosController.text.isEmpty) {
      _mostrarAlerta('Por favor, preencha todos os campos!');
      return;
    }

    try {
      double capital = double.parse(_capitalController.text);
      double aplicacaoMensal = double.parse(_aplicacaoMensalController.text);
      int meses = int.parse(_mesesController.text);
      double taxaJuros = double.parse(_taxaJurosController.text) / 100;

      if (capital < 0 || aplicacaoMensal < 0 || meses <= 0 || taxaJuros < 0) {
        _mostrarAlerta('Por favor, insira valores positivos válidos!');
        return;
      }

      double montanteFinal = capital;
      List<String> detalhesMeses = [];

      for (int i = 1; i <= meses; i++) {
        double rendimentoMensal = montanteFinal * taxaJuros;
        montanteFinal += rendimentoMensal + aplicacaoMensal;
        
        detalhesMeses.add(
          "Mês $i: R\$ ${montanteFinal.toStringAsFixed(2)} (Rendimento = R\$ ${rendimentoMensal.toStringAsFixed(2)})",
        );
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultadosPage(
            montanteFinal: montanteFinal,
            detalhesMeses: detalhesMeses,
            capitalInicial: capital,
            aplicacaoMensal: aplicacaoMensal,
            taxaJuros: taxaJuros * 100,
            meses: meses,
          ),
        ),
      );
    } catch (e) {
      _mostrarAlerta('Por favor, insira apenas números válidos!');
    }
  }
}
class ResultadosPage extends StatelessWidget {
  final double montanteFinal;
  final List<String> detalhesMeses;
  final double capitalInicial;
  final double aplicacaoMensal;
  final double taxaJuros;
  final int meses;

  const ResultadosPage({
    Key? key,
    required this.montanteFinal,
    required this.detalhesMeses,
    required this.capitalInicial,
    required this.aplicacaoMensal,
    required this.taxaJuros,
    required this.meses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalInvestido = capitalInicial + (aplicacaoMensal * meses);
    double rendimentoTotal = montanteFinal - totalInvestido;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados da Simulação'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Dados da Simulação:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text('Capital inicial: R\$ ${capitalInicial.toStringAsFixed(2)}'),
                    Text('Aplicação mensal: R\$ ${aplicacaoMensal.toStringAsFixed(2)}'),
                    Text('Período: $meses meses'),
                    Text('Taxa de juros: ${taxaJuros.toStringAsFixed(2)}% ao mês'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              color: Colors.green.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Resultados:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Montante final: R\$ ${montanteFinal.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    Text('Total investido: R\$ ${totalInvestido.toStringAsFixed(2)}'),
                    Text(
                      'Rendimento total: R\$ ${rendimentoTotal.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Evolução mensal:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            
            Expanded(
              child: ListView.builder(
                itemCount: detalhesMeses.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(detalhesMeses[index]),
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}