class DiasSemana {
  static String? getWeekdayName(int day) {
    Map<int, String> weekDay = {
      1: 'DOM',
      2: 'SEG',
      3: 'TER',
      4: 'QUA',
      5: 'QUI',
      6: 'SEX',
      7: 'SAB',
    };
    return weekDay[day];
  }
}
