import 'package:flutter/material.dart';

class ExercisePage extends StatelessWidget {
  static const String route = '/exercise';
  const ExercisePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercicios cadastrados'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/bg4.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
