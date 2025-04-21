class Income {
  final double amount;
  final DateTime date;

  Income({required this.amount, required this.date});

  @override
  String toString() {
    return "Income: $amount, $date";
  }
}
