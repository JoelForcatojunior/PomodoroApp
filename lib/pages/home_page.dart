import 'package:flutter/material.dart';
import 'package:pomodoro/pages/Pomodoro.dart';
import 'package:pomodoro/models/auth.dart';
import 'package:provider/provider.dart';

import '../utils/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);


    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 255, 95, 95),
        title: const Text(
          'Página inicial',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<Auth>(
                context,
                listen: false,
              ).logout();

              Navigator.of(context).pushReplacementNamed(
                AppRoutes.authOrHome,
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Pomodoro()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: theme.colorScheme.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Iniciar Pomodoro',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Por que o método Pomodoro é importante?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'O método Pomodoro é uma técnica de gerenciamento de tempo que '
              'envolve a divisão do trabalho em intervalos focados e curtos, '
              'chamados de "pomodoros". Cada pomodoro tem uma duração de 25 minutos, '
              'seguido por um curto intervalo de descanso de 5 minutos. '
              'Após completar um número determinado de pomodoros, um intervalo de '
              'descanso mais longo é realizado. Essa técnica ajuda a melhorar a '
              'produtividade, a concentração e a eficiência no trabalho, '
              'permitindo que você se concentre intensamente em uma tarefa por '
              'um curto período e faça pausas regulares para descanso. '
              'Experimente o método Pomodoro e veja como pode ajudar você '
              'a aumentar sua produtividade e reduzir a fadiga mental!',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}