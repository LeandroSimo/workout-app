import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:my_workout/app/utils/dias_semana.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final _list = ObservableList<TextButton>();

  @action
  List<TextButton> getButtonBar(Function function) {
    for (int i = 1; i < 8; i++) {
      final dia = DiasSemana.getWeekdayName(i).toString();
      _list.add(
        TextButton(
          onPressed: () {},
          child: Text(dia.substring(0, 3).toUpperCase()),
        ),
      );
    }
    return _list;
  }
}
