import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:project_1/controllers/wallet.dart';

class AddIncomeWidget extends StatelessWidget {
  final _controller = Get.find<WalletController>();
  void _addIncome(BuildContext context) {
    if (_addIncomeFormKey.currentState!.saveAndValidate()) {
      _controller.addIncome(
        amount: _addIncomeFormKey.currentState!.value['amount'],
        date: _addIncomeFormKey.currentState!.value['date'],
      );
      _addIncomeFormKey.currentState!.reset();
      Navigator.of(context).pop();
      Get.offNamed(Get.currentRoute, arguments: Get.arguments);
    }
  }

  final _addIncomeFormKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add Income"),
      content: FormBuilder(
        key: _addIncomeFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5.0,
          children: [
            FormBuilderTextField(
              name: "amount",
              decoration: InputDecoration(
                labelText: 'Amount',
                hintText: 'Enter a double number',
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: 'Amount is required'),
                FormBuilderValidators.numeric(
                  errorText: 'Enter a valid number',
                ),
              ]),
              valueTransformer: (val) => double.tryParse(val ?? ''),
            ),
            FormBuilderDateTimePicker(
              name: 'date',
              inputType: InputType.both, // options: date, time, both
              decoration: InputDecoration(
                labelText: 'Select Date & Time',
                border: OutlineInputBorder(),
              ),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            ),
            ElevatedButton(
              onPressed: () => _addIncome(context),
              child: Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
