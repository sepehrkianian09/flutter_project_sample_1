class Spend {
  final double amount;
  final DateTime date;
  final String categoryId;

  Spend(this.amount, this.date, this.categoryId);

  @override
  String toString() {
    return "Spend - amount: $amount, date: $date, category: $categoryId";
  }
}
