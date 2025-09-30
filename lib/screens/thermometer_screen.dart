import 'package:flutter/material.dart';
import 'thermometer_widget.dart';

class ThermometerScreen extends StatefulWidget {
  const ThermometerScreen({super.key});

  @override
  State<ThermometerScreen> createState() => _ThermometerScreenState();
}

class _ThermometerScreenState extends State<ThermometerScreen> {
  int _selectedIndex = 4;
  // Agora você pode mudar este valor e a UI se adaptará automaticamente
  double _emotionalTemperature = 69.0;

  // Mapa com os dados para cada estado emocional
  Map<String, dynamic> get _emotionalState {
    if (_emotionalTemperature >= 75) {
      return {
        'emoji': '🔥',
        'title': 'Muito Quente',
        'description': 'Energia altíssima!',
        'fontSize': 80.0,
      };
    } else if (_emotionalTemperature >= 50) {
      return {
        'emoji': '😊',
        'title': 'Morno',
        'description': 'Se sentindo bem!',
        'fontSize': 70.0,
      };
    } else if (_emotionalTemperature >= 25) {
      return {
        'emoji': '😐',
        'title': 'Frio',
        'description': 'Um pouco pra baixo...',
        'fontSize': 70.0,
      };
    } else {
      return {
        'emoji': '❄️',
        'title': 'Congelando',
        'description': 'Precisando de um abraço.',
        'fontSize': 70.0,
      };
    }
  }

  // Estilos de texto organizados para evitar repetição
  static const TextStyle _titleStyle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const TextStyle _subtitleStyle = TextStyle(
    fontSize: 16,
    color: Color.fromRGBO(255, 255, 255, 0.9),
  );
  static const TextStyle _tempValueStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Color(0xFF333333),
  );
  static const TextStyle _tempTitleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Color(0xFF555555),
  );
  static const TextStyle _tempDescStyle = TextStyle(
    fontSize: 14,
    color: Colors.grey,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF70CFFF), Color(0xFFC48DEF), Color(0xFFDD88E7)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text('Termômetro Emocional', style: _titleStyle),
                const SizedBox(height: 8),
                const Text('Medindo seu bem-estar', style: _subtitleStyle),
                const SizedBox(height: 30),
                _buildMainCard(),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMainCard() {
    return Container(
      height: 500.0,
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center, // Centraliza os filhos da Stack por padrão
        children: [
          // Item 1: O Termômetro
          Positioned(
            top: 20,
            left: 30,
            child: ThermometerWidget(
              value: _emotionalTemperature,
              height: 400,
              width: 45,
            ),
          ),

          // Item 2: A Coluna com as informações dinâmicas
          Positioned(
            top: 60,
            right: 40,
            child: Column(
              children: [
                Text(
                  _emotionalState['emoji'],
                  style: TextStyle(fontSize: _emotionalState['fontSize']),
                ),
                const SizedBox(height: 20),
                Text(
                  '${_emotionalTemperature.toInt()}°',
                  style: _tempValueStyle,
                ),
                const SizedBox(height: 20),
                Text(_emotionalState['title'], style: _tempTitleStyle),
                const SizedBox(height: 4),
                Text(_emotionalState['description'], style: _tempDescStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*Widget _buildDiagnosticCard() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9), // Verde claro
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          const Icon(Icons.description_outlined, color: Color(0xFF388E3C)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Diagnóstico Emocional',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF388E3C),
                  ),
                ),
                const SizedBox(height: 4),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(color: Color(0xFF555555), fontSize: 14),
                    children: <TextSpan>[
                      TextSpan(text: 'Sua temperatura emocional está '),
                      TextSpan(
                        text: 'altíssima! ',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                      TextSpan(text: 'Continue cultivando essa energia positiva! 🚀'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }*/

// Não se esqueça de importar o pacote no topo do arquiv
