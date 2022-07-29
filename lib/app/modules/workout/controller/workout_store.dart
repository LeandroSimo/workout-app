import 'package:mobx/mobx.dart';

part 'workout_store.g.dart';

class WorkoutStore = _WorkoutStoreBase with _$WorkoutStore;
abstract class _WorkoutStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}