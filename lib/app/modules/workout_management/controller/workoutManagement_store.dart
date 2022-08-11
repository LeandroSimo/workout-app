import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:my_workout/app/modules/workout/controller/workout_store.dart';
import 'package:my_workout/app/modules/workout/model/workout.dart';

part 'workoutManagement_store.g.dart';

class WorkoutManagementStore = _WorkoutManagementStoreBase
    with _$WorkoutManagementStore;

abstract class _WorkoutManagementStoreBase with Store {
  final _workoutStore = WorkoutStore();
  @observable
  var workout = Workout();
  @observable
  var imageFocus = FocusNode();
  @observable
  var dropDownFocus = FocusNode();
  @observable
  bool dropValid = true;
  @observable
  int? dropValue;
  @observable
  var formKey = GlobalKey<FormState>();

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
  @computed
  String get getName => workout.name.toString();
  @computed
  String get getImgUrl => workout.name.toString();
  @computed
  int get getWeekDay => workout.weekDay!.round();

  @action
  void save() {
    dropValue != null && dropValue! > 0
        ? setDropValid(true)
        : setDropValid(false);

    bool? valid = formKey.currentState?.validate();

    if (valid! && dropValid) {
      setWeekDay(dropValue!);
      _workoutStore.addWorkout(workout);
      formKey.currentState?.save();
      // print(_workoutStore.workouts.toList().toString());
      // Modular.to.pop();
    }
  }
}
