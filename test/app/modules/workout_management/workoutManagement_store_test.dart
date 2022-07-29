import 'package:flutter_test/flutter_test.dart';
import 'package:my_workout/app/modules/workout_management/controller/workoutManagement_store.dart';

void main() {
  late WorkoutManagementStore store;

  setUpAll(() {
    store = WorkoutManagementStore();
  });

  // test('increment count', () async {
  //   expect(store.value, equals(0));
  //   store.increment();
  //   expect(store.value, equals(1));
  // });
}
