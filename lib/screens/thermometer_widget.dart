import 'package:flutter/material.dart';

class ThermometerWidget extends StatelessWidget {
  final double value;
  final double maxValue;
  final double height;
  final double width;

  const ThermometerWidget({
    super.key,
    required this.value,
    this.maxValue = 100.0,
    this.height = 200.0,
    this.width = 30.0,
  });

  @override
  Widget build(BuildContext context) {
    final double fillPercentage = (value / maxValue).clamp(0.0, 1.0);

    return SizedBox(
      height: height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Labels de temperatura
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildLabel('100°', value),
              _buildLabel('75°', value),
              _buildLabel('50°', value),
              _buildLabel('25°', value),
              _buildLabel('0°', value),
            ],
          ),
          const SizedBox(width: 8),

          // Corpo do termômetro
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(width / 2),
            ),
            // Usamos ClipRRect para garantir que o preenchimento também tenha bordas arredondadas
            child: ClipRRect(
              borderRadius: BorderRadius.circular(width / 2),
              child: Stack(
                children: [
                  // O preenchimento vermelho que sobe de baixo para cima
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: FractionallySizedBox(
                      heightFactor: fillPercentage,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFFE57373), Color(0xFFC62828)],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
  Widget _buildLabel(String text, double currentValue) {
  // Converte o texto do label (ex: '75°') para um número (75.0)
  final double labelValue = double.parse(text.replaceAll('°', ''));

  // Decide a cor com base no valor atual do termômetro
  final Color labelColor = (labelValue <= currentValue) ? Colors.red.shade700 : Colors.grey;

  return Text(
    text,
    style: TextStyle(
      color: labelColor, // A cor agora é dinâmica!
      fontWeight: FontWeight.bold,
    ),
  );
}