// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WorkoutStore on _WorkoutStoreBase, Store {
  Computed<List<Workout>>? _$getWorkComputed;

  @override
  List<Workout> get getWork =>
      (_$getWorkComputed ??= Computed<List<Workout>>(() => super.getWork,
              name: '_WorkoutStoreBase.getWork'))
          .value;

  late final _$workoutsAtom =
      Atom(name: '_WorkoutStoreBase.workouts', context: context);

  @override
  List<Workout> get workouts {
    _$workoutsAtom.reportRead();
    return super.workouts;
  }

  @override
  set workouts(List<Workout> value) {
    _$workoutsAtom.reportWrite(value, super.workouts, () {
      super.workouts = value;
    });
  }

  late final _$_WorkoutStoreBaseActionController =
      ActionController(name: '_WorkoutStoreBase', context: context);

  @override
  Future<List<Workout>> getWorkout() {
    final _$actionInfo = _$_WorkoutStoreBaseActionController.startAction(
        name: '_WorkoutStoreBase.getWorkout');
    try {
      return super.getWorkout();
    } finally {
      _$_WorkoutStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addWorkout(Workout workout) {
    final _$actionInfo = _$_WorkoutStoreBaseActionController.startAction(
        name: '_WorkoutStoreBase.addWorkout');
    try {
      return super.addWorkout(workout);
    } finally {
      _$_WorkoutStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
workouts: ${workouts},
getWork: ${getWork}
    ''';
  }
}
