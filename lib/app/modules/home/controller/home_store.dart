import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  int weekDay = DateTime.now().weekday;

  @action
  void setWeekDay(int value) => weekDay = value;

  @computed
  int get weewDayNow => weekDay;
}
