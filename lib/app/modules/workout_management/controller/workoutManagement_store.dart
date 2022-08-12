import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:my_workout/app/modules/workout/controller/workout_store.dart';
import 'package:my_workout/app/modules/workout/model/workout.dart';

part 'workoutManagement_store.g.dart';

class WorkoutManagementStore = _WorkoutManagementStoreBase
    with _$WorkoutManagementStore;

abstract class _WorkoutManagementStoreBase with Store {
  final _workoutStore = Modular.get<WorkoutStore>();

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
  bool isCreate = true;
  @observable
  bool isInit = true;
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

  final arguments = ObservableMap<String, Object>.of(
    {'title': 'Novo Treino'},
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
  Future<void> save() async {
    isCreate = false;
    dropValue != null && dropValue! > 0
        ? setDropValid(true)
        : setDropValid(false);

    bool? valid = formKey.currentState?.validate();

    if (valid! && dropValid) {
      formKey.currentState?.save();
      setWeekDay(dropValue!);
      await _workoutStore.addWorkout(workout);
      isCreate = true;
      print(_workoutStore.workouts.length);
      print(isCreate);
      // Modular.to.pop();
    }
  }
}
