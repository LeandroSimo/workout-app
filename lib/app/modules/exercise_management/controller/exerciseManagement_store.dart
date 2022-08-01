import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'exerciseManagement_store.g.dart';

class ExerciseManagementStore = _ExerciseManagementStoreBase
    with _$ExerciseManagementStore;

abstract class _ExerciseManagementStoreBase with Store {
  @observable
  var imageFocus = FocusNode();
  @observable
  var descriptionFocus = FocusNode();
  @observable
  var formKey = GlobalKey<FormState>();

  @action
  void save() {
    bool? valid = formKey.currentState?.validate();
    valid! ? print('formulário válido') : print('formulário inválido');
  }
}
