import 'package:flutter/material.dart';
 
void main() {
  runApp(const MeuApp());
}
 
class MeuApp extends StatelessWidget {
  const MeuApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard Responsivo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const DashboardPage(),
    );
  }
}
 
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
 
  @override
  Widget build(BuildContext context) {
    final double larguraTela = MediaQuery.of(context).size.width;
 
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard de Informações'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _construirLayout(larguraTela),
      ),
    );
  }
 
  Widget _construirLayout(double largura) {
    final List<Map<String, dynamic>> dadosCards = [
      {'titulo': 'Vendas', 'valor': 'R\$ 15.430', 'icone': Icons.shopping_cart, 'cor': Colors.blue},
      {'titulo': 'Usuários', 'valor': '1.245', 'icone': Icons.people, 'cor': Colors.green},
      {'titulo': 'Sessões', 'valor': '8.912', 'icone': Icons.timeline, 'cor': Colors.orange},
      {'titulo': 'Taxa de Rejeição', 'valor': '34%', 'icone': Icons.pie_chart, 'cor': Colors.red},
    ];
 
    if (largura > 900) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: dadosCards.map((dados) => Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InfoCard(dados: dados),
          ),
        )).toList(),
      );
    }
    else if (largura >= 600) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(child: Padding(padding: const EdgeInsets.all(8.0), child: InfoCard(dados: dadosCards[0]))),
              Expanded(child: Padding(padding: const EdgeInsets.all(8.0), child: InfoCard(dados: dadosCards[1]))),
            ],
          ),
          Row(
            children: [
              Expanded(child: Padding(padding: const EdgeInsets.all(8.0), child: InfoCard(dados: dadosCards[2]))),
              Expanded(child: Padding(padding: const EdgeInsets.all(8.0), child: InfoCard(dados: dadosCards[3]))),
            ],
          ),
        ],
      );
    }
    else {
      return SingleChildScrollView(
        child: Column(
          children: dadosCards.map((dados) => Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: InfoCard(dados: dados),
          )).toList(),
        ),
      );
    }
  }
}
 
class InfoCard extends StatelessWidget {
  final Map<String, dynamic> dados;
 
  const InfoCard({super.key, required this.dados});
 
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dados['titulo'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
                Icon(
                  dados['icone'],
                  color: dados['cor'],
                  size: 28,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              dados['valor'],
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}