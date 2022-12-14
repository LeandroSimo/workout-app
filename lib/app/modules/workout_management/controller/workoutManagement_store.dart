import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:my_workout/app/modules/workout/controller/workout_store.dart';
import 'package:my_workout/app/modules/workout/model/workout.dart';

part 'workoutManagement_store.g.dart';

class WorkoutManagementStore = _WorkoutManagementStoreBase
    with _$WorkoutManagementStore;

abstract class _WorkoutManagementStoreBase with Store {
  final WorkoutStore _workoutStore = Modular.get();

  @observable
  Workout workout = Workout();
  @observable
  var imageFocus = FocusNode();
  @observable
  var dropDownFocus = FocusNode();

  @observable
  bool dropValid = true;
  @observable
  int? dropValue;
  @observable
  bool isInit = true;
  @observable
  bool onCreate = true;
  @observable
  bool onDelete = true;

  @observable
  var formKey = GlobalKey<FormState>();

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

  @action
  void setDropValue(value) => dropValue = value;
  @action
  bool setDropValid(value) => dropValid = value;
  @action
  void setName(String value) => workout.name = value;
  @action
  void setImageUrl(String value) => workout.imageUrl = value;
  @action
  void setWeekDay(int value) => workout.weekDay = value;
  @action
  void setIsInit(value) => isInit = value;

  @computed
  String get getId => workout.id.toString();
  @computed
  String get getName => workout.name.toString();
  @computed
  String get getImgUrl => workout.name.toString();
  @computed
  int get getWeekDay => workout.weekDay!.round();
  @computed
  bool get getIsInit => isInit;

  @action
  void showConfirmationModal(BuildContext context) {
    onDelete = false;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Você tem certeza?'),
        content: const Text('Esta ação não poderá ser desfeita!'),
        actions: [
          TextButton(
            onPressed: () => Modular.to.pop(),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              _workoutStore.delete(workout.id.toString());
              onDelete = true;
            },
            child: const Text('Sim, continuar.'),
          )
        ],
      ),
    );
  }

  @action
  Future<void> save() async {
    onCreate = false;
    dropValue != null && dropValue! > 0
        ? setDropValid(true)
        : setDropValid(false);

    bool? valid = formKey.currentState?.validate();

    if (valid! && dropValid) {
      formKey.currentState?.save();
      setWeekDay(dropValue!);
      if (workout.id != null) {
        await _workoutStore.update(workout);
      } else {
        await _workoutStore.addWorkout(workout);
      }
      onCreate = true;
    }
  }
}
