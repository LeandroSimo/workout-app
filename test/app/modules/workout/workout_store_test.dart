import 'package:flutter_test/flutter_test.dart';
import 'package:my_workout/app/modules/workout/controller/workout_store.dart';

void main() {
  late WorkoutStore store;

  setUpAll(() {
    store = WorkoutStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}
