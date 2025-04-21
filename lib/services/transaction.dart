import 'package:get/get.dart';
import 'package:project_1/dataStorage/interface.dart';
import 'package:project_1/models/income.dart';
import 'package:project_1/models/spend.dart';

import 'parser.dart';

class SpendParser extends ObjectParser<Spend> {
  @override
  Spend fromJson(Map<String, dynamic> aTJSon) {
    return Spend(
      amount: double.parse(aTJSon['amount']),
      date: DateTime.parse(aTJSon['date']),
      categoryId: aTJSon['categoryId'],
    );
  }

  @override
  Map<String, dynamic> toJson(Spend aT) {
    return {
      'amount': aT.amount.toString(),
      'date': aT.date.toString(),
      'categoryId': aT.categoryId,
    };
  }
}

class IncomeParser extends ObjectParser<Income> {
  @override
  Income fromJson(Map<String, dynamic> aTJSon) {
    return Income(
      amount: double.parse(aTJSon['amount']),
      date: DateTime.parse(aTJSon['date']),
    );
  }

  @override
  Map<String, dynamic> toJson(Income aT) {
    return {'amount': aT.amount.toString(), 'date': aT.date.toString()};
  }
}

class TransactionService {
  final _storage = Get.find<DataStorage>();

  final _incomeSerializer = ListSerializer<Income>(IncomeParser());
  List<Income>? _incomes;
  List<Income> getIncomes() {
    if (_incomes == null) {
      if (_storage.containsKey('incomes')) {
        _incomes = _incomeSerializer.parse(_storage.get('incomes'));
      } else {
        _incomes = [];
      }
    }
    return _incomes!;
  }

  addIncome(Income anIncome) {
    getIncomes().add(anIncome);
    _storage.add('incomes', _incomeSerializer.stringify(getIncomes()));
  }

  final _spendSerializer = ListSerializer<Spend>(SpendParser());
  List<Spend>? _spends;
  List<Spend> getSpends() {
    if (_incomes == null) {
      if (_storage.containsKey('spends')) {
        _spends = _spendSerializer.parse(_storage.get('spends'));
      } else {
        _spends = [];
      }
    }
    return _spends!;
  }

  addSpend(Spend aSpend) {
    getSpends().add(aSpend);
    _storage.add('spends', _spendSerializer.stringify(getSpends()));
  }
}
