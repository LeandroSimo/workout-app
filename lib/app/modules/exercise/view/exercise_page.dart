import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_workout/app/modules/exercise/view_models/exercise_list.dart';
import 'package:my_workout/app/modules/exercise_management/view/exerciseManagement_page.dart';

class ExercisePage extends StatelessWidget {
  static const String route = '/exercise';
  @override
  Widget build(BuildContext context) {
    final _arguments = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercicios Cadastrados'),
        actions: [
          IconButton(
            onPressed: () => Modular.to.pushNamed(
              ExerciseManagementPage.route,
              arguments: {
                'title': 'Cadastrar Novo Exercício',
                'workoutId': _arguments['workoutId']
              },
            ),
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
          ),
          ExerciseList(_arguments['workoutId'])
        ],
      ),
    );
  }
}
