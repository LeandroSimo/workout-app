import 'package:mobx/mobx.dart';

part 'workoutManagement_store.g.dart';

class WorkoutManagementStore = _WorkoutManagementStoreBase
    with _$WorkoutManagementStore;

abstract class _WorkoutManagementStoreBase with Store {
  final arguments = ObservableMap<String, Object>.of({'title': 'Novo Treino'});
}
