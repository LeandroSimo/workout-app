import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_workout/app/modules/exercise/controller/exercise_store.dart';
import 'package:my_workout/app/modules/exercise/model/exercise.dart';
import 'package:my_workout/app/modules/exercise/view_models/exercise_card.dart';
import 'package:my_workout/app/utils/custom_future_builder.dart';

class ExerciseList extends StatelessWidget {
  final String workoutId;
  final ExerciseStore _exerciseStore = Modular.get();
  ExerciseList(this.workoutId);

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder<List<Exercise>>(
      future: _exerciseStore.getExercise(workoutId),
      onEmpty: (context) => const Center(
        child: Text('Não há exercícios cadastrados!'),
      ),
      onLoading: (context) => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
      onComplete: (context) => Observer(
        builder: (_) => ListView.builder(
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
        ),
      ),
      onError: (context, error) => Center(
        child: Text(
          error.message,
        ),
      ),
    );
  }
}
