// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exerciseManagement_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ExerciseManagementStore on _ExerciseManagementStoreBase, Store {
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

  late final _$_ExerciseManagementStoreBaseActionController =
      ActionController(name: '_ExerciseManagementStoreBase', context: context);

  @override
  void save() {
    final _$actionInfo = _$_ExerciseManagementStoreBaseActionController
        .startAction(name: '_ExerciseManagementStoreBase.save');
    try {
      return super.save();
    } finally {
      _$_ExerciseManagementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
imageFocus: ${imageFocus},
descriptionFocus: ${descriptionFocus},
formKey: ${formKey}
    ''';
  }
}
