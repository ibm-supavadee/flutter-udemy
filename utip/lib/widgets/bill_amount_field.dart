import 'package:flutter/material.dart';

class BillAmountField extends StatelessWidget {
  const BillAmountField({
    super.key,
    required this.billAmount,
    required this.onChanged,
  });

  final String billAmount;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        labelText: "Bill Amount",
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.attach_money),
      ),
      // keyboardType: TextInputType.number,
        onChanged: (String value) {
          onChanged(value);
        },
    );
  }
}
