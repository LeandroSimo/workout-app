import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'workoutManagement_store.g.dart';

class WorkoutManagementStore = _WorkoutManagementStoreBase
    with _$WorkoutManagementStore;

abstract class _WorkoutManagementStoreBase with Store {
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
  void save() {
    dropValue != null && dropValue! > 0
        ? setDropValid(true)
        : setDropValid(false);

    bool? valid = formKey.currentState?.validate();
    valid! && dropValid
        ? print('Fomulário Válido')
        : print('Formulario Inválido');
  }
}
