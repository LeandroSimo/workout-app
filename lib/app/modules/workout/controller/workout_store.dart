import 'package:mobx/mobx.dart';
import 'package:my_workout/app/modules/workout/model/workout.dart';

part 'workout_store.g.dart';

class WorkoutStore = _WorkoutStoreBase with _$WorkoutStore;

abstract class _WorkoutStoreBase with Store {
  final workouts = ObservableList<Workout>();

  @override
  void didChangeDependencies() {
    autorun((_) => getWorkout);
  }

  @action
  Future<List<Workout>> getWorkout() {
    return Future.delayed(const Duration(seconds: 3), () => [...workouts]);
  }

  @action
  void addWorkout(Workout workout) {
    workouts.add(workout);
  }
}
