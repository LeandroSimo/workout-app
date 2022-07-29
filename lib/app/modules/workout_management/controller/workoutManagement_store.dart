import 'package:mobx/mobx.dart';

part 'workoutManagement_store.g.dart';

class WorkoutManagementStore = _WorkoutManagementStoreBase
    with _$WorkoutManagementStore;

abstract class _WorkoutManagementStoreBase with Store {
  final arguments = ObservableMap<String, Object>.of({'title': 'Novo Treino'});
  final dropDownOptions = ObservableList<Map<String, Object>>.of(
    [
      {'id': 1, 'name': 'Domingo'},
      {'id': 2, 'name': 'Segunda-feira'},
      {'id': 3, 'name': 'Terça-feira'},
      {'id': 4, 'name': 'Quarta-feira'},
      {'id': 5, 'name': 'Quinta-feira'},
      {'id': 6, 'name': 'Sexta-feira'},
      {'id': 7, 'name': 'Sábado'},
    ],
  );
}
