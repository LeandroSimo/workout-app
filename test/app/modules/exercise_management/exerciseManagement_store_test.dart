import 'package:flutter_test/flutter_test.dart';
import 'package:my_workout/app/modules/exercise_management/exerciseManagement_store.dart';
 
void main() {
  late ExerciseManagementStore store;

  setUpAll(() {
    store = ExerciseManagementStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}