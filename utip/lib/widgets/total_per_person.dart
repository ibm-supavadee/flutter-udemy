import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TotalPerson extends StatelessWidget {
  const TotalPerson({
    super.key,
    required this.style,
    required this.total,
    required this.theme,
  });

  final TextStyle style;
  final double total;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text('Total per person', style: style),
            Text(
              total.toStringAsFixed(2),
              style: style.copyWith(
                  color: theme.colorScheme.onPrimary,
                  fontSize: theme.textTheme.displaySmall?.fontSize),
            ),
          ],
        ),
      ),
    );
  }
}
