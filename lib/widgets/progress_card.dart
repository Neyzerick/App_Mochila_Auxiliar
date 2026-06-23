import 'package:app_mochila_emergencia/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  final double progress;

  const ProgressCard({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    final percentage = (progress * 100).toInt();

    return Card(
      elevation: 5,
      color: AppColors.backgroundCard,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 90,
                  height: 90,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 10,
                  ),
                ),

                Text(
                  '$percentage%',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(width: 20),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Preparación General',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    progress >= 0.7
                        ? 'Excelente preparación'
                        : progress >= 0.4
                        ? 'Vas por buen camino'
                        : 'Necesitas más elementos',

                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
