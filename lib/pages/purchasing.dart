import 'package:flutter/material.dart';

class PurchasingPage extends StatelessWidget {
  const PurchasingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Icon(Icons.shopping_cart, size: 40),
            const SizedBox(height: 20),
            Text(
              "Purchasing Page",
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
