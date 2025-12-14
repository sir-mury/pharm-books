import 'package:flutter/material.dart';

class POSPage extends StatelessWidget {
  const POSPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Icon(Icons.point_of_sale, size: 40),
            const SizedBox(height: 20),
            Text(
              "POS Page",
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
