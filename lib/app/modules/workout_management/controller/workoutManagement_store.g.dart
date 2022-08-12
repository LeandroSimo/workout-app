// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workoutManagement_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WorkoutManagementStore on _WorkoutManagementStoreBase, Store {
  Computed<String>? _$getNameComputed;

  @override
  String get getName =>
      (_$getNameComputed ??= Computed<String>(() => super.getName,
              name: '_WorkoutManagementStoreBase.getName'))
          .value;
  Computed<String>? _$getImgUrlComputed;

  @override
  String get getImgUrl =>
      (_$getImgUrlComputed ??= Computed<String>(() => super.getImgUrl,
              name: '_WorkoutManagementStoreBase.getImgUrl'))
          .value;
  Computed<int>? _$getWeekDayComputed;

  @override
  int get getWeekDay =>
      (_$getWeekDayComputed ??= Computed<int>(() => super.getWeekDay,
              name: '_WorkoutManagementStoreBase.getWeekDay'))
          .value;

  late final _$workoutAtom =
      Atom(name: '_WorkoutManagementStoreBase.workout', context: context);

  @override
  Workout get workout {
    _$workoutAtom.reportRead();
    return super.workout;
  }

  @override
  set workout(Workout value) {
    _$workoutAtom.reportWrite(value, super.workout, () {
      super.workout = value;
    });
  }

  late final _$imageFocusAtom =
      Atom(name: '_WorkoutManagementStoreBase.imageFocus', context: context);

  @override
  FocusNode get imageFocus {
    _$imageFocusAtom.reportRead();
    return super.imageFocus;
  }

  @override
  set imageFocus(FocusNode value) {
    _$imageFocusAtom.reportWrite(value, super.imageFocus, () {
      super.imageFocus = value;
    });
  }

  late final _$dropDownFocusAtom =
      Atom(name: '_WorkoutManagementStoreBase.dropDownFocus', context: context);

  @override
  FocusNode get dropDownFocus {
    _$dropDownFocusAtom.reportRead();
    return super.dropDownFocus;
  }

  @override
  set dropDownFocus(FocusNode value) {
    _$dropDownFocusAtom.reportWrite(value, super.dropDownFocus, () {
      super.dropDownFocus = value;
    });
  }

  late final _$dropValidAtom =
      Atom(name: '_WorkoutManagementStoreBase.dropValid', context: context);

  @override
  bool get dropValid {
    _$dropValidAtom.reportRead();
    return super.dropValid;
  }

  @override
  set dropValid(bool value) {
    _$dropValidAtom.reportWrite(value, super.dropValid, () {
      super.dropValid = value;
    });
  }

  late final _$dropValueAtom =
      Atom(name: '_WorkoutManagementStoreBase.dropValue', context: context);

  @override
  int? get dropValue {
    _$dropValueAtom.reportRead();
    return super.dropValue;
  }

  @override
  set dropValue(int? value) {
    _$dropValueAtom.reportWrite(value, super.dropValue, () {
      super.dropValue = value;
    });
  }

  late final _$isInitAtom =
      Atom(name: '_WorkoutManagementStoreBase.isInit', context: context);

  @override
  bool get isInit {
    _$isInitAtom.reportRead();
    return super.isInit;
  }

  @override
  set isInit(bool value) {
    _$isInitAtom.reportWrite(value, super.isInit, () {
      super.isInit = value;
    });
  }

  late final _$onDeleteAtom =
      Atom(name: '_WorkoutManagementStoreBase.onDelete', context: context);

  @override
  bool get onDelete {
    _$onDeleteAtom.reportRead();
    return super.onDelete;
  }

  @override
  set onDelete(bool value) {
    _$onDeleteAtom.reportWrite(value, super.onDelete, () {
      super.onDelete = value;
    });
  }

  late final _$formKeyAtom =
      Atom(name: '_WorkoutManagementStoreBase.formKey', context: context);

  @override
  GlobalKey<FormState> get formKey {
    _$formKeyAtom.reportRead();
    return super.formKey;
  }

  @override
  set formKey(GlobalKey<FormState> value) {
    _$formKeyAtom.reportWrite(value, super.formKey, () {
      super.formKey = value;
    });
  }

  late final _$saveAsyncAction =
      AsyncAction('_WorkoutManagementStoreBase.save', context: context);

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$_WorkoutManagementStoreBaseActionController =
      ActionController(name: '_WorkoutManagementStoreBase', context: context);

  @override
  void setDropValue(dynamic value) {
    final _$actionInfo = _$_WorkoutManagementStoreBaseActionController
        .startAction(name: '_WorkoutManagementStoreBase.setDropValue');
    try {
      return super.setDropValue(value);
    } finally {
      _$_WorkoutManagementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool setDropValid(dynamic value) {
    final _$actionInfo = _$_WorkoutManagementStoreBaseActionController
        .startAction(name: '_WorkoutManagementStoreBase.setDropValid');
    try {
      return super.setDropValid(value);
    } finally {
      _$_WorkoutManagementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$_WorkoutManagementStoreBaseActionController
        .startAction(name: '_WorkoutManagementStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_WorkoutManagementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setImageUrl(String value) {
    final _$actionInfo = _$_WorkoutManagementStoreBaseActionController
        .startAction(name: '_WorkoutManagementStoreBase.setImageUrl');
    try {
      return super.setImageUrl(value);
    } finally {
      _$_WorkoutManagementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setWeekDay(int value) {
    final _$actionInfo = _$_WorkoutManagementStoreBaseActionController
        .startAction(name: '_WorkoutManagementStoreBase.setWeekDay');
    try {
      return super.setWeekDay(value);
    } finally {
      _$_WorkoutManagementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showConfirmationModal(BuildContext context) {
    final _$actionInfo = _$_WorkoutManagementStoreBaseActionController
        .startAction(name: '_WorkoutManagementStoreBase.showConfirmationModal');
    try {
      return super.showConfirmationModal(context);
    } finally {
      _$_WorkoutManagementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
workout: ${workout},
imageFocus: ${imageFocus},
dropDownFocus: ${dropDownFocus},
dropValid: ${dropValid},
dropValue: ${dropValue},
isInit: ${isInit},
onDelete: ${onDelete},
formKey: ${formKey},
getName: ${getName},
getImgUrl: ${getImgUrl},
getWeekDay: ${getWeekDay}
    ''';
  }
}
