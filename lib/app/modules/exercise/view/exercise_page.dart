import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_workout/app/modules/exercise/controller/exercise_store.dart';
import 'package:my_workout/app/modules/exercise/view_models/exercise_card.dart';
import 'package:my_workout/app/modules/exercise_management/view/exerciseManagement_page.dart';

class ExercisePage extends StatelessWidget {
  static const String route = '/exercise';
  final _exerciseStore = Modular.get<ExerciseStore>();
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
              arguments: 'Cadastrar Novo Exercício',
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
          FutureBuilder(
            future: _exerciseStore.getExercise(_arguments['workoutId']),
            builder: (_, snapshot) {
              return snapshot.connectionState == ConnectionState.done
                  ? ListView.builder(
                      itemCount: _exerciseStore.exercises.length,
                      itemBuilder: (_, index) {
                        var _exercise = _exerciseStore.exercises[index];
                        return ExerciseCard(
                          _exercise.name.toString(),
                          _exercise.description.toString(),
                          _exercise.imageUrl.toString(),
                        );
                      },
                    )
                  : const CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
