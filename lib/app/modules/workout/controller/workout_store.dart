import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:my_workout/app/modules/workout/model/workout.dart';

part 'workout_store.g.dart';

class WorkoutStore = _WorkoutStoreBase with _$WorkoutStore;

abstract class _WorkoutStoreBase with Store, ChangeNotifier {
  ObservableList<Workout> workouts = ObservableList<Workout>();
  // @observable
  // List<Workout> workouts = [];

  @action
  Future<void> addWorkout(Workout workout) async {
    workout.id = Random().nextInt(100).toString();
    workouts.add(workout);
  }

  @action
  Future<List<Workout>> getWorkout() async {
    return await Future.delayed(const Duration(seconds: 1), () => workouts);
  }

  @action
  Workout getById(String id) {
    print('getById');
    return workouts.firstWhere((element) => element.id == id);
  }

  @action
  Future<void> update(Workout workout) async {
    final _workouts = workouts.map((e) {
      try {
        if (e.id == workout.id) {
          e.imageUrl = workout.imageUrl;
          e.name = workout.name;
          e.weekDay = workout.weekDay;
        }
        return e;
      } catch (ex) {
        print(ex.toString());
      }
    }).toList();
  }

  @action
  Future<void> delete(String id) async {
    workouts.removeWhere((element) => element.id == id);
  }
}
