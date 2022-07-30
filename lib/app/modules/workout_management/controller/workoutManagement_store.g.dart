// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workoutManagement_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WorkoutManagementStore on _WorkoutManagementStoreBase, Store {
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
  void save() {
    final _$actionInfo = _$_WorkoutManagementStoreBaseActionController
        .startAction(name: '_WorkoutManagementStoreBase.save');
    try {
      return super.save();
    } finally {
      _$_WorkoutManagementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
imageFocus: ${imageFocus},
dropDownFocus: ${dropDownFocus},
dropValid: ${dropValid},
dropValue: ${dropValue},
formKey: ${formKey}
    ''';
  }
}
