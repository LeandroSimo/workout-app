import 'package:mobx/mobx.dart';

part 'exercise_store.g.dart';

class ExerciseStore = _ExerciseStoreBase with _$ExerciseStore;
abstract class _ExerciseStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}