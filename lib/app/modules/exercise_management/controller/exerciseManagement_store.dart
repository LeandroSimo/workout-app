import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:my_workout/app/modules/exercise/controller/exercise_store.dart';
import 'package:my_workout/app/modules/exercise/model/exercise.dart';

part 'exerciseManagement_store.g.dart';

class ExerciseManagementStore = _ExerciseManagementStoreBase
    with _$ExerciseManagementStore;

abstract class _ExerciseManagementStoreBase with Store {
  final Exercise exercise = Exercise();
  final _exerciseStore = Modular.get<ExerciseStore>();

  @observable
  var imageFocus = FocusNode();
  @observable
  var descriptionFocus = FocusNode();
  @observable
  var formKey = GlobalKey<FormState>();
  @observable
  bool isInit = true;
  @observable
  bool onSaved = true;

  @action
  void setName(String value) => exercise.name = value;
  @action
  void setImgUrl(String value) => exercise.imageUrl = value;
  @action
  void setDescription(String value) => exercise.description = value;

  @computed
  String get getName => exercise.name.toString();
  @computed
  String get getImgUrl => exercise.imageUrl.toString();
  @computed
  String get getDescription => exercise.description.toString();

  @action
  Future<void> save() async {
    onSaved = false;
    bool? valid = formKey.currentState?.validate();
    if (valid!) {
      formKey.currentState?.save();
      await _exerciseStore.add(exercise);
      onSaved = true;
    }
  }

  @action
  Future<void> delete(BuildContext context, String id) async {
    await _exerciseStore.delete(id);
  }
}
