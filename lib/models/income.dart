class Income {
  final double amount;
  final DateTime date;

  Income(this.amount, this.date);

  @override
  String toString() {
    return "Income: $amount, $date";
  }
}
