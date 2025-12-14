import 'package:flutter/material.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Icon(Icons.bar_chart, size: 40),
            const SizedBox(height: 20),
            Text(
              "Reports Page",
              style: Theme.of(
                context,
              ).textTheme.headlineMedium!.copyWith(fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}
