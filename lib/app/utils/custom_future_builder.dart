import 'package:flutter/material.dart';

class CustomFutureBuilder<T> extends StatelessWidget {
  const CustomFutureBuilder({
    Key? key,
    this.initialData,
    required this.future,
    required this.onError,
    required this.onLoading,
    required this.onComplete,
    required this.onEmpty,
  }) : super(key: key);

  final T? initialData;
  final Future<T> future;
  final Function(BuildContext context, dynamic error) onError;
  final Function(BuildContext context) onLoading;
  final Function(BuildContext context) onComplete;
  final Function(BuildContext context) onEmpty;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
        future: future,
        initialData: initialData,
        builder: (context, snapshot) {
          final status = snapshot.connectionState;

          if (snapshot.hasError) {
            if (onError != null) {
              return onError(context, snapshot.error);
            }
          }

          if (status == ConnectionState.waiting) {
            if (onLoading != null) {
              return onLoading(context);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }

          if (status == ConnectionState.done) {
            if (snapshot.hasData) {
              return onComplete(context);
            } else {
              if (onEmpty != null) {
                return onEmpty(context);
              }
            }
          }

          return Container();
        });
  }
}
