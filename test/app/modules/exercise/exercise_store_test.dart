import 'package:flutter_test/flutter_test.dart';
import 'package:my_workout/app/modules/exercise/controller/exercise_store.dart';

void main() {
  late ExerciseStore store;

  setUpAll(() {
    store = ExerciseStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}
