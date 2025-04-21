class Spend {
  final double amount;
  final DateTime date;
  final String categoryId;

  Spend({required this.amount, required this.date, required this.categoryId});

  @override
  String toString() {
    return "Spend - amount: $amount, date: $date, category: $categoryId";
  }
}
