import 'package:flutter/material.dart';

class SimuladorComparacaoApp extends StatelessWidget {
  const SimuladorComparacaoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simulador de Investimentos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ComparacaoInvestimentosPage(),
    );
  }
}

class ComparacaoInvestimentosPage extends StatefulWidget {
  const ComparacaoInvestimentosPage({Key? key}) : super(key: key);

  @override
  State<ComparacaoInvestimentosPage> createState() => _ComparacaoInvestimentosPageState();
}

class _ComparacaoInvestimentosPageState extends State<ComparacaoInvestimentosPage> {
  final TextEditingController _capital1Controller = TextEditingController();
  final TextEditingController _aplicacao1Controller = TextEditingController();
  final TextEditingController _taxa1Controller = TextEditingController();
  final TextEditingController _capital2Controller = TextEditingController();
  final TextEditingController _aplicacao2Controller = TextEditingController();
  final TextEditingController _taxa2Controller = TextEditingController();
  final TextEditingController _mesesController = TextEditingController();
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
        title: const Text('Simulador de Comparação de Investimentos'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Compare dois investimentos diferentes:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildInvestimentoCard(
              titulo: 'Investimento 1',
              cor: Colors.blue,
              capitalController: _capital1Controller,
              aplicacaoController: _aplicacao1Controller,
              taxaController: _taxa1Controller,
            ),
            const SizedBox(height: 16),
            _buildInvestimentoCard(
              titulo: 'Investimento 2',
              cor: Colors.green,
              capitalController: _capital2Controller,
              aplicacaoController: _aplicacao2Controller,
              taxaController: _taxa2Controller,
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Período da Simulação',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _mesesController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Período (meses)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _compararInvestimentos,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text('Comparar Investimentos', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildInvestimentoCard({
    required String titulo,
    required Color cor,
    required TextEditingController capitalController,
    required TextEditingController aplicacaoController,
    required TextEditingController taxaController,
  }) {
    return Card(
      color: cor.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: cor,
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: capitalController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Capital inicial (R\$)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: aplicacaoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Aplicação mensal (R\$)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: taxaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Taxa de juros mensal (%)',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _compararInvestimentos() {
    if (_capital1Controller.text.isEmpty ||
        _aplicacao1Controller.text.isEmpty ||
        _taxa1Controller.text.isEmpty ||
        _capital2Controller.text.isEmpty ||
        _aplicacao2Controller.text.isEmpty ||
        _taxa2Controller.text.isEmpty ||
        _mesesController.text.isEmpty) {
      _mostrarAlerta('Por favor, preencha todos os campos!');
      return;
    }

    try {
      double capital1 = double.parse(_capital1Controller.text);
      double aplicacao1 = double.parse(_aplicacao1Controller.text);
      double taxa1 = double.parse(_taxa1Controller.text) / 100;
      double capital2 = double.parse(_capital2Controller.text);
      double aplicacao2 = double.parse(_aplicacao2Controller.text);
      double taxa2 = double.parse(_taxa2Controller.text) / 100;
      int meses = int.parse(_mesesController.text);

      if (capital1 < 0 || aplicacao1 < 0 || taxa1 < 0 ||
          capital2 < 0 || aplicacao2 < 0 || taxa2 < 0 || meses <= 0) {
        _mostrarAlerta('Por favor, insira valores positivos válidos!');
        return;
      }
      final resultados1 = _calcularRendimento(capital1, aplicacao1, taxa1, meses);
      final resultados2 = _calcularRendimento(capital2, aplicacao2, taxa2, meses);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultadosComparacaoPage(
            investimento1: DadosInvestimento(
              nome: 'Investimento 1',
              capitalInicial: capital1,
              aplicacaoMensal: aplicacao1,
              taxaJuros: taxa1 * 100,
              meses: meses,
              montanteFinal: resultados1['montante']!,
              detalhesMensais: resultados1['detalhes']!,
            ),
            investimento2: DadosInvestimento(
              nome: 'Investimento 2',
              capitalInicial: capital2,
              aplicacaoMensal: aplicacao2,
              taxaJuros: taxa2 * 100,
              meses: meses,
              montanteFinal: resultados2['montante']!,
              detalhesMensais: resultados2['detalhes']!,
            ),
          ),
        ),
      );
    } catch (e) {
      _mostrarAlerta('Por favor, insira apenas números válidos!');
    }
  }
  Map<String, dynamic> _calcularRendimento(double capital, double aplicacaoMensal, double taxaJuros, int meses) {
    double montante = capital;
    List<Map<String, double>> detalhes = [];

    for (int i = 1; i <= meses; i++) {
      double rendimentoMensal = montante * taxaJuros;
      montante += rendimentoMensal + aplicacaoMensal;
      
      detalhes.add({
        'mes': i.toDouble(),
        'montante': montante,
        'rendimento': rendimentoMensal,
      });
    }

    return {
      'montante': montante,
      'detalhes': detalhes,
    };
  }
}
class DadosInvestimento {
  final String nome;
  final double capitalInicial;
  final double aplicacaoMensal;
  final double taxaJuros;
  final int meses;
  final double montanteFinal;
  final List<Map<String, double>> detalhesMensais;

  DadosInvestimento({
    required this.nome,
    required this.capitalInicial,
    required this.aplicacaoMensal,
    required this.taxaJuros,
    required this.meses,
    required this.montanteFinal,
    required this.detalhesMensais,
  });

  double get totalInvestido => capitalInicial + (aplicacaoMensal * meses);
  double get rendimentoTotal => montanteFinal - totalInvestido;
}
class ResultadosComparacaoPage extends StatelessWidget {
  final DadosInvestimento investimento1;
  final DadosInvestimento investimento2;

  const ResultadosComparacaoPage({
    Key? key,
    required this.investimento1,
    required this.investimento2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final melhorInvestimento = investimento1.montanteFinal > investimento2.montanteFinal 
        ? investimento1 
        : investimento2;
    final diferenca = (investimento1.montanteFinal - investimento2.montanteFinal).abs();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comparação de Resultados'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.orange.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Resultado da Comparação',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '🏆 Melhor investimento: ${melhorInvestimento.nome}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                    Text('Diferença: R\$ ${diferenca.toStringAsFixed(2)}'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildCardInvestimento(investimento1, Colors.blue),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildCardInvestimento(investimento2, Colors.green),
                ),
              ],
            ),

            const SizedBox(height: 16),
            const Text(
              'Evolução Comparativa Mensal:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: const Row(
                        children: [
                          Expanded(child: Text('Mês', style: TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(child: Text('Investimento 1 (R\$)', style: TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(child: Text('Investimento 2 (R\$)', style: TextStyle(fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ),
                    ...List.generate(
                      investimento1.meses,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            Expanded(child: Text('${index + 1}')),
                            Expanded(child: Text(investimento1.detalhesMensais[index]['montante']!.toStringAsFixed(2))),
                            Expanded(child: Text(investimento2.detalhesMensais[index]['montante']!.toStringAsFixed(2))),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildCardInvestimento(DadosInvestimento investimento, Color cor) {
    return Card(
      color: cor.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              investimento.nome,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: cor,
              ),
            ),
            const SizedBox(height: 8),
            Text('Capital: R\$ ${investimento.capitalInicial.toStringAsFixed(2)}'),
            Text('Aplicação mensal: R\$ ${investimento.aplicacaoMensal.toStringAsFixed(2)}'),
            Text('Taxa: ${investimento.taxaJuros.toStringAsFixed(2)}%'),
            const Divider(),
            Text(
              'Montante final: R\$ ${investimento.montanteFinal.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Total investido: R\$ ${investimento.totalInvestido.toStringAsFixed(2)}'),
            Text(
              'Rendimento: R\$ ${investimento.rendimentoTotal.toStringAsFixed(2)}',
              style: TextStyle(color: cor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}