import 'package:flutter/material.dart';
import 'package:utip/widgets/bill_amount_field.dart';
import 'package:utip/widgets/person_counter.dart';
import 'package:utip/widgets/tip_row.dart';
import 'package:utip/widgets/tip_slider.dart';
import 'package:utip/widgets/total_per_person.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'UTip',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const UTip());
  }
}

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  int _personCount = 1;
  double _tipPercentage = 0.0;
  double _billTotal = 100.0;

  double totalPerson() {
    return ((_billTotal * _tipPercentage) + (_billTotal)) / _personCount;
  }

  double totalTip() {
    return ((_billTotal * _tipPercentage));
  }

  void increment() {
    setState(() {
      _personCount = _personCount + 1;
    });
  }

  void decrement() {
    setState(() {
      if (_personCount > 1) {
        _personCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    double total = totalPerson();
    double totalT = totalTip();

    var style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('UTip'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TotalPerson(style: style, total: total, theme: theme),

          // Form
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: theme.colorScheme.primary, width: 2)),
              child: Column(
                children: [
                  BillAmountField(
                    billAmount: _billTotal.toString(),
                    onChanged: (value) {
                      setState(() {
                        _billTotal = double.parse(value);
                      });
                      // print("Amount: $value");
                    },
                  ),

                  PersonCounter(
                    theme: theme,
                    personCount: _personCount,
                    onDecrement: decrement,
                    onIncrement: increment,
                  ),

                  // === Tip Section ===
                  TipRow(theme: theme, totalT: totalT),

                  // === Slider Text ===
                  Text("${(_tipPercentage * 100).round()} %"),

                  // === Tip Slider ===
                  TipSlider(
                    tipPercentage: _tipPercentage,
                    onChanged: (double value) {
                      setState(
                        () {
                          _tipPercentage = value;
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

