import 'package:flutter/material.dart';

class TodayWorkout extends StatelessWidget {
  final String name;
  final String imageUrl;

  TodayWorkout(this.name, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final _query = MediaQuery.of(context);
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          SizedBox(
            width: _query.size.width * 0.6,
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                          top: 30,
                          bottom: 20,
                        ),
                        child: Text(
                          'Treino do Dia',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 30, right: 30, bottom: 30),
                        child: Text(
                          name,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image(
                image: NetworkImage(
                  imageUrl,
                ),
                width: 130,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
