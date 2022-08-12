import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_workout/app/modules/exercise/controller/exercise_store.dart';
// import 'package:my_workout/app/modules/exercise_management/controller/exerciseManagement_store.dart';

class ExerciseCard extends StatelessWidget {
  final String id;
  final String name;
  final String description;
  final String imageUrl;

  final ExerciseStore _exerciseStore = ExerciseStore();

  ExerciseCard(this.id, this.name, this.description, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Observer(
        builder: (_) => ListTile(
          title: Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            description,
            style: TextStyle(
              color: Theme.of(context).textTheme.subtitle2?.color,
            ),
          ),
          leading: Image.network(
            imageUrl,
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
          trailing: IconButton(
            onPressed: () => _exerciseStore.delete(context, id),
            icon: const Icon(Icons.delete),
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
