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

  late final _$addWorkoutAsyncAction =
      AsyncAction('_WorkoutStoreBase.addWorkout', context: context);

  @override
  Future<void> addWorkout(Workout workout) {
    return _$addWorkoutAsyncAction.run(() => super.addWorkout(workout));
  }

  late final _$getWorkoutAsyncAction =
      AsyncAction('_WorkoutStoreBase.getWorkout', context: context);

  @override
  Future<List<Workout>> getWorkout() {
    return _$getWorkoutAsyncAction.run(() => super.getWorkout());
  }

  late final _$updateAsyncAction =
      AsyncAction('_WorkoutStoreBase.update', context: context);

  @override
  Future<void> update(Workout workout) {
    return _$updateAsyncAction.run(() => super.update(workout));
  }

  late final _$_WorkoutStoreBaseActionController =
      ActionController(name: '_WorkoutStoreBase', context: context);

  @override
  Workout getById(String id) {
    final _$actionInfo = _$_WorkoutStoreBaseActionController.startAction(
        name: '_WorkoutStoreBase.getById');
    try {
      return super.getById(id);
    } finally {
      _$_WorkoutStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getWork: ${getWork}
    ''';
  }
}
