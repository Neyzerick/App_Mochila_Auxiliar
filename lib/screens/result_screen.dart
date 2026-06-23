import 'package:flutter/material.dart';

import '../models/emergency_item.dart';
import '../services/evaluation_service.dart';
import '../utils/app_colors.dart';

class ResultScreen extends StatelessWidget {
  final int selectedItems;
  final int totalItems;
  final List<EmergencyItem> items;

  const ResultScreen({
    super.key,
    required this.selectedItems,
    required this.totalItems,
    required this.items,
  });

  Color getResultColor(double percentage) {
    if (percentage <= 40) {
      return AppColors.danger;
    }

    if (percentage <= 80) {
      return AppColors.warning;
    }

    return AppColors.success;
  }

  @override
  Widget build(BuildContext context) {
    final percentage = (selectedItems / totalItems) * 100;

    final level = EvaluationService.getLevel(percentage);

    final recommendation = EvaluationService.getRecommendation(percentage);

    final missingItems = EvaluationService.getMissingItems(items);

    return Scaffold(
      appBar: AppBar(title: const Text('Resultado')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundColor: getResultColor(
                        percentage,
                      ).withValues(alpha: 0.15),

                      child: Icon(
                        Icons.verified_user,
                        size: 150,
                        color: getResultColor(percentage),
                      ),
                    ),

                    Text(
                      '${percentage.toInt()}%',
                      style: TextStyle(
                        fontSize: 52,
                        fontWeight: FontWeight.bold,
                        color: getResultColor(percentage),
                      ),
                    ),

                    Text(
                      percentage >= 80
                          ? 'Tu mochila está lista para afrontar una emergencia.'
                          : percentage >= 50
                          ? 'Vas por buen camino, pero aún puedes mejorar.'
                          : 'Necesitas añadir más elementos esenciales.',
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 10),

                    Text(
                      level,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          '$selectedItems',
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text('Seleccionados'),
                      ],
                    ),

                    Column(
                      children: [
                        Text(
                          '$totalItems',
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text('Totales'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.verified,
                          size: 30,
                          color: AppColors.optional,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Recomendación',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Text(recommendation),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 5),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.warning_amber,
                          size: 30,
                          color: AppColors.danger,
                        ),
                        SizedBox(width: 8),

                        Text(
                          'Elementos faltantes',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    if (missingItems.isEmpty)
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.check_circle, color: Colors.green),

                            SizedBox(width: 10),

                            Expanded(
                              child: Text(
                                'Excelente trabajo. Tu mochila contiene todos los elementos registrados.',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ...missingItems.map(
                      (item) => Card(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          leading: const Icon(Icons.cancel, color: Colors.red),

                          title: Text(item),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 60,

              child: ElevatedButton.icon(
                icon: const Icon(Icons.home, color: Colors.white),

                label: const Text(
                  'Volver al Inicio',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),

                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
