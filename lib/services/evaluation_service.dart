import '../models/emergency_item.dart';

class EvaluationService {
  static String getLevel(double percentage) {
    if (percentage <= 20) {
      return 'Muy Deficiente';
    } else if (percentage <= 40) {
      return 'Deficiente';
    } else if (percentage <= 60) {
      return 'Preparación Básica';
    } else if (percentage <= 80) {
      return 'Buena Preparación';
    } else {
      return 'Excelente Preparación';
    }
  }

  static String getRecommendation(double percentage) {
    if (percentage <= 20) {
      return 'Necesitas incluir muchos más elementos esenciales.';
    } else if (percentage <= 40) {
      return 'Tu mochila aún no está preparada para una emergencia.';
    } else if (percentage <= 60) {
      return 'Vas por buen camino, pero faltan elementos importantes.';
    } else if (percentage <= 80) {
      return 'Tu preparación es buena, aunque todavía puede mejorar.';
    } else {
      return 'Excelente trabajo. Tu mochila está muy bien preparada.';
    }
  }

  static List<String> getMissingItems(
    List<EmergencyItem> items,
  ) {
    return items
        .where((item) => !item.isChecked)
        .map((item) => item.name)
        .toList();
  }
}