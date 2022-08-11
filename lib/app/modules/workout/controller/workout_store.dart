import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:my_workout/app/modules/workout/model/workout.dart';

part 'workout_store.g.dart';

class WorkoutStore = _WorkoutStoreBase with _$WorkoutStore;

abstract class _WorkoutStoreBase with Store, ChangeNotifier {
  @observable
  List<Workout> workouts = [
    Workout(
      1.toString(),
      'Corrida',
      'https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzV8fHdvcmtvdXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      5,
    ),
    Workout(
      2.toString(),
      'Cárdio',
      'https://images.unsplash.com/photo-1536922246289-88c42f957773?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDV8fHdvcmtvdXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      2,
    )
  ];

  @computed
  List<Workout> get getWork => [...workouts];

  @action
  Future<void> addWorkout(Workout workout) async {
    workout.id = Random().toString();
    workouts.add(workout);
    notifyListeners();
  }

  @action
  Future<List<Workout>> getWorkout() {
    return Future.delayed(const Duration(seconds: 1), () => workouts);
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
    notifyListeners();
  }
}
