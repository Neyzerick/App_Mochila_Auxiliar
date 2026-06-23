import 'package:flutter/material.dart';

import '../data/emergency_items.dart';
import '../models/emergency_item.dart';
import '../utils/app_colors.dart';
import '../widgets/category_header.dart';
import '../widgets/emergency_item_card.dart';
import '../widgets/progress_card.dart';
import 'result_screen.dart';

class ChecklistScreen extends StatefulWidget {
  const ChecklistScreen({super.key});

  @override
  State<ChecklistScreen> createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  double get progress {
    final checked = emergencyItems.where((item) => item.isChecked).length;

    return checked / emergencyItems.length;
  }

  List<EmergencyItem> getCategoryItems(String category) {
    return emergencyItems.where((item) => item.category == category).toList();
  }

  Color getCategoryColor(String category) {
    switch (category) {
      case 'Esenciales':
        return AppColors.essential;

      case 'Recomendados':
        return AppColors.recommended;

      default:
        return AppColors.optional;
    }
  }

  Widget buildCategory(String category) {
    final items = getCategoryItems(category);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoryHeader(title: category, color: getCategoryColor(category)),

        ...items.map(
          (item) => EmergencyItemCard(
            item: item,
            onChanged: (value) {
              setState(() {
                item.isChecked = value ?? false;
              });
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final checkedItems = emergencyItems.where((item) => item.isChecked).length;

    return Scaffold(
      appBar: AppBar(title: const Text('Checklist de Emergencia')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ProgressCard(progress: progress),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.inventory_2),

                  const SizedBox(width: 8),

                  Text(
                    '$checkedItems de ${emergencyItems.length} elementos seleccionados',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                children: [
                  buildCategory('Esenciales'),

                  buildCategory('Recomendados'),

                  buildCategory('Opcionales'),
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),

                icon: const Icon(
                  Icons.verified_user,
                  color: Colors.white,
                  size: 24,
                ),

                label: const Text(
                  'Evaluar Preparación',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ResultScreen(
                        selectedItems: checkedItems,
                        totalItems: emergencyItems.length,
                        items: emergencyItems,
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
