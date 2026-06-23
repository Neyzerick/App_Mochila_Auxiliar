import 'package:app_mochila_emergencia/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../models/emergency_item.dart';

class EmergencyItemCard extends StatelessWidget {
  final EmergencyItem item;
  final Function(bool?) onChanged;

  const EmergencyItemCard({
    super.key,
    required this.item,
    required this.onChanged,
  });

  void _showInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.backgroundCard,
          title: Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text(item.description),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  Color getCategoryColor() {
    switch (item.category) {
      case 'Esenciales':
        return Colors.red;
      case 'Recomendados':
        return Colors.orange;
      default:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Card(
        color: item.isChecked ? Colors.green.shade50 : Colors.white,

        margin: const EdgeInsets.symmetric(vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: getCategoryColor().withValues(alpha: 0.15),
            child: Icon(item.icon, color: getCategoryColor()),
          ),

          title: Text(
            item.name,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              decoration: item.isChecked ? TextDecoration.lineThrough : null,
            ),
          ),

          subtitle: Text(item.category),

          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: () {
                  _showInfo(context);
                },
              ),

              Checkbox(
                value: item.isChecked,
                onChanged: onChanged,

                activeColor: Colors.green,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
