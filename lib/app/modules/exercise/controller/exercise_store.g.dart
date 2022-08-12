// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ExerciseStore on _ExerciseStoreBase, Store {
  late final _$getExerciseAsyncAction =
      AsyncAction('_ExerciseStoreBase.getExercise', context: context);

  @override
  Future<List<Exercise>> getExercise(String workoutId) {
    return _$getExerciseAsyncAction.run(() => super.getExercise(workoutId));
  }

  late final _$addAsyncAction =
      AsyncAction('_ExerciseStoreBase.add', context: context);

  @override
  Future<void> add(Exercise exercise) {
    return _$addAsyncAction.run(() => super.add(exercise));
  }

  late final _$deleteAsyncAction =
      AsyncAction('_ExerciseStoreBase.delete', context: context);

  @override
  Future<void> delete(BuildContext context, String id) {
    return _$deleteAsyncAction.run(() => super.delete(context, id));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
