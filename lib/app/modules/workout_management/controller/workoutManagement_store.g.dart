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

  @override
  String toString() {
    return '''
imageFocus: ${imageFocus},
dropDownFocus: ${dropDownFocus}
    ''';
  }
}
