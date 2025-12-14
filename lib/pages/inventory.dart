import 'package:flutter/material.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Icon(Icons.inventory, size: 40),
            const SizedBox(height: 20),
            Text(
              "Inventory Page",
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
