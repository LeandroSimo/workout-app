import 'package:mobx/mobx.dart';
import 'package:my_workout/app/modules/workout/model/workout.dart';
import 'package:my_workout/app/modules/workout_management/controller/workoutManagement_store.dart';

part 'workout_store.g.dart';

class WorkoutStore = _WorkoutStoreBase with _$WorkoutStore;

abstract class _WorkoutStoreBase with Store {
  @observable
  List<Workout> workouts = [
    Workout(
      null,
      'Corrida',
      'https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzV8fHdvcmtvdXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      5,
    ),
    Workout(
      null,
      'Cárdio',
      'https://images.unsplash.com/photo-1536922246289-88c42f957773?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDV8fHdvcmtvdXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      2,
    )
  ];

  @computed
  List<Workout> get getWork => [...workouts];

  @action
  Future<List<Workout>> getWorkout() {
    return Future.delayed(const Duration(seconds: 3), () => getWork);
  }

  @action
  void addWorkout(Workout workout) {
    workouts.add(workout);
  }
}
