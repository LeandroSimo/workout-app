import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:my_workout/app/modules/exercise/model/exercise.dart';

part 'exercise_store.g.dart';

class ExerciseStore = _ExerciseStoreBase with _$ExerciseStore;

abstract class _ExerciseStoreBase with Store, ChangeNotifier {
  ObservableList<Exercise> exercises = ObservableList<Exercise>();
  @action
  Future<List<Exercise>> getExercise(String workoutId) async {
    List<Exercise> filtered = [];
    exercises.forEach(
      (element) {
        if (element.id == workoutId) {
          filtered.add(element);
        }
      },
    );
    return filtered;
  }

  @action
  Future<void> add(Exercise exercise) async {
    exercise.id = Random().nextInt(100).toString();
    exercises.add(exercise);
    notifyListeners();
  }

  @action
  Future<void> delete(String id) async {
    exercises.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
