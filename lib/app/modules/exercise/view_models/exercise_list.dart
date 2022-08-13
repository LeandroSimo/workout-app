import 'package:flutter/material.dart';
import 'package:my_workout/app/modules/exercise/controller/exercise_store.dart';
import 'package:my_workout/app/modules/exercise/model/exercise.dart';
import 'package:my_workout/app/modules/exercise/view_models/exercise_card.dart';

class ExerciseList extends StatelessWidget {
  final String workoutId;
  final ExerciseStore _exerciseStore = ExerciseStore();
  ExerciseList(this.workoutId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Exercise>>(
      future: _exerciseStore.getExercise(workoutId),
      builder: (BuildContext context, AsyncSnapshot<List<Exercise>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: _exerciseStore.exercises.length,
                itemBuilder: (_, index) {
                  var _exercise = _exerciseStore.exercises[index];
                  return ExerciseCard(
                    _exercise.id.toString(),
                    _exercise.name.toString(),
                    _exercise.description.toString(),
                    _exercise.imageUrl.toString(),
                  );
                },
              );
            } else {
              return const Center(
                child: Text('Error de Conexão'),
              );
            }
          default:
            return SizedBox();
        }
      },
    );
  }
}
