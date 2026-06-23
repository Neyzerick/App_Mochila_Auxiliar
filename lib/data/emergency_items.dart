import 'package:flutter/material.dart';
import '../models/emergency_item.dart';

List<EmergencyItem> emergencyItems = [
  EmergencyItem(
    name: 'Agua potable',
    description:
        'Permite mantenerse hidratado durante una situación de emergencia.',
    category: 'Esenciales',
    icon: Icons.water_drop,
  ),
  EmergencyItem(
    name: 'Alimentos no perecederos',
    description:
        'Proporcionan alimento cuando no es posible cocinar o comprar comida.',
    category: 'Esenciales',
    icon: Icons.fastfood,
  ),
  EmergencyItem(
    name: 'Botiquín',
    description:
        'Contiene materiales básicos para atender heridas y emergencias menores.',
    category: 'Esenciales',
    icon: Icons.medical_services,
  ),
  EmergencyItem(
    name: 'Linterna',
    description:
        'Permite iluminar espacios en caso de cortes de energía.',
    category: 'Esenciales',
    icon: Icons.flashlight_on,
  ),
  EmergencyItem(
    name: 'Radio portátil',
    description:
        'Ayuda a recibir información oficial durante una emergencia.',
    category: 'Recomendados',
    icon: Icons.radio,
  ),
  EmergencyItem(
    name: 'Baterías',
    description:
        'Sirven como respaldo para dispositivos esenciales.',
    category: 'Recomendados',
    icon: Icons.battery_full,
  ),
  EmergencyItem(
    name: 'Documentos importantes',
    description:
        'Copias de documentos personales importantes.',
    category: 'Opcionales',
    icon: Icons.description,
  ),
  EmergencyItem(
    name: 'Cargador portátil',
    description:
        'Permite mantener cargado el teléfono móvil.',
    category: 'Opcionales',
    icon: Icons.power,
  ),
  EmergencyItem(
    name: 'Manta',
    description:
        'Ayuda a conservar el calor corporal.',
    category: 'Recomendados',
    icon: Icons.bed,
  ),
  EmergencyItem(
    name: 'Silbato',
    description:
        'Puede utilizarse para pedir ayuda o llamar la atención.',
    category: 'Recomendados',
    icon: Icons.campaign,
  ),
];