extension DateTimeUtils on DateTime {
  static Map<int, String> _monthName = {
    1: "January",
    2: "February",
    3: "March",
    4: "April",
    5: "May",
    6: "June",
    7: "July",
    8: "August",
    9: "September",
    10: "October",
    11: "November",
    12: "December"
  };

  String getMonthName() {
    return _monthName[this.month];
  }

  String toDateString(bool shorthand) {
    String month = shorthand ? this.getMonthName().substring(0, 3) : this.getMonthName();
    return "$month ${this.day}, ${this.year}";
  }

  String toDateStringCurrentYearCheck(bool shorthand) {
    String month = shorthand ? this.getMonthName().substring(0, 3) : this.getMonthName();
    if (this.year == DateTime.now().year) {
      return "$month ${this.day}";
    }
    return "$month ${this.day}, ${this.year}";
  }
}