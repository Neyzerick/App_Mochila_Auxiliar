import 'package:flutter/material.dart';

import 'checklist_screen.dart';
import '../utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Mochila de',
                    style: TextStyle(
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                      height: 0.9,
                    ),
                  ),

                  const Text(
                    'Emergencia',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 240, 144, 0),
                      height: 0.9,
                    ),
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    """
Prepárate para cualquier 
situación de riesgo.""",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),

                  Center(
                    child: Image.asset('assets/img/Mochila.jpg', width: 500),
                  ),

                  const SizedBox(height: 10),
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(0),
                            child: const Icon(
                              Icons.verified_user,
                              color: Colors.green,
                              size: 80,
                            ),
                          ),

                          const SizedBox(width: 15),

                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Estar preparado ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  'hace la diferencia',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    height: 0.9,
                                  ),
                                ),

                                SizedBox(height: 10),

                                Text(
                                  'Verifica que tu mochila tenga todo lo esencial para protegerte a ti y a tu familia.',
                                  style: TextStyle(fontSize: 16, height: 1.2),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.play_arrow, color: Colors.white),
                      label: const Text(
                        'Comenzar Revisión',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ChecklistScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
