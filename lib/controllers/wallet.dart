import 'package:get/get.dart';
import 'package:project_1/controllers/category.dart';
import 'package:project_1/models/income.dart';
import 'package:project_1/models/spend.dart';
import 'package:project_1/services/transaction.dart';

class WalletController {
  final _categoryController = Get.find<CategoryController>();
  final _transactionService = Get.find<TransactionService>();

  spendMoney({
    required double amount,
    DateTime? date,
    required String categoryId,
  }) {
    if (amount <= 0) {
      throw "Amount Invalid";
    }
    if (amount > getBalance()) {
      throw "Inadequate balance";
    }
    if (!_categoryController.containsCategory(categoryId)) {
      throw "Category Not Found";
    }

    final theDate = date ?? DateTime.now();
    final theSpend = Spend(
      amount: amount,
      date: theDate,
      categoryId: categoryId,
    );
    _transactionService.addSpend(theSpend);
    spends.add(theSpend);
  }

  addIncome({required double amount, DateTime? date}) {
    if (amount <= 0) {
      throw "Amount Invalid";
    }

    final theDate = date ?? DateTime.now();
    final theIncome = Income(amount: amount, date: theDate);
    _transactionService.addIncome(theIncome);
    incomes.add(theIncome);
  }

  static double _sum(Iterable<double> aList) {
    if (aList.isEmpty) {
      return 0;
    }
    if (aList.length == 1) {
      return aList.first;
    }
    return aList.reduce((a, b) => a + b);
  }

  double getBalance({DateTime? date}) {
    final incomeAmount = _sum(incomes.map((income) => income.amount));
    final spendAmount = _sum(spends.map((spend) => spend.amount));

    return incomeAmount - spendAmount;
  }

  RxList<Income> incomes;
  RxList<Spend> spends;
  WalletController() : incomes = <Income>[].obs, spends = <Spend>[].obs {
    incomes.value = _transactionService.getIncomes();
    spends.value = _transactionService.getSpends();
  }
}
