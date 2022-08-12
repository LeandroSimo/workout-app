// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exerciseManagement_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ExerciseManagementStore on _ExerciseManagementStoreBase, Store {
  Computed<String>? _$getNameComputed;

  @override
  String get getName =>
      (_$getNameComputed ??= Computed<String>(() => super.getName,
              name: '_ExerciseManagementStoreBase.getName'))
          .value;
  Computed<String>? _$getImgUrlComputed;

  @override
  String get getImgUrl =>
      (_$getImgUrlComputed ??= Computed<String>(() => super.getImgUrl,
              name: '_ExerciseManagementStoreBase.getImgUrl'))
          .value;
  Computed<String>? _$getDescriptionComputed;

  @override
  String get getDescription =>
      (_$getDescriptionComputed ??= Computed<String>(() => super.getDescription,
              name: '_ExerciseManagementStoreBase.getDescription'))
          .value;

  late final _$imageFocusAtom =
      Atom(name: '_ExerciseManagementStoreBase.imageFocus', context: context);

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

  late final _$descriptionFocusAtom = Atom(
      name: '_ExerciseManagementStoreBase.descriptionFocus', context: context);

  @override
  FocusNode get descriptionFocus {
    _$descriptionFocusAtom.reportRead();
    return super.descriptionFocus;
  }

  @override
  set descriptionFocus(FocusNode value) {
    _$descriptionFocusAtom.reportWrite(value, super.descriptionFocus, () {
      super.descriptionFocus = value;
    });
  }

  late final _$formKeyAtom =
      Atom(name: '_ExerciseManagementStoreBase.formKey', context: context);

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

  late final _$isInitAtom =
      Atom(name: '_ExerciseManagementStoreBase.isInit', context: context);

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

  late final _$onSavedAtom =
      Atom(name: '_ExerciseManagementStoreBase.onSaved', context: context);

  @override
  bool get onSaved {
    _$onSavedAtom.reportRead();
    return super.onSaved;
  }

  @override
  set onSaved(bool value) {
    _$onSavedAtom.reportWrite(value, super.onSaved, () {
      super.onSaved = value;
    });
  }

  late final _$saveAsyncAction =
      AsyncAction('_ExerciseManagementStoreBase.save', context: context);

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$_ExerciseManagementStoreBaseActionController =
      ActionController(name: '_ExerciseManagementStoreBase', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$_ExerciseManagementStoreBaseActionController
        .startAction(name: '_ExerciseManagementStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_ExerciseManagementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setImgUrl(String value) {
    final _$actionInfo = _$_ExerciseManagementStoreBaseActionController
        .startAction(name: '_ExerciseManagementStoreBase.setImgUrl');
    try {
      return super.setImgUrl(value);
    } finally {
      _$_ExerciseManagementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_ExerciseManagementStoreBaseActionController
        .startAction(name: '_ExerciseManagementStoreBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_ExerciseManagementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
imageFocus: ${imageFocus},
descriptionFocus: ${descriptionFocus},
formKey: ${formKey},
isInit: ${isInit},
onSaved: ${onSaved},
getName: ${getName},
getImgUrl: ${getImgUrl},
getDescription: ${getDescription}
    ''';
  }
}
