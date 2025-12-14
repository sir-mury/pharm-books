import 'package:flutter/material.dart';

class PatientsPage extends StatelessWidget {
  const PatientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Icon(Icons.person, size: 40),
            const SizedBox(height: 20),
            Text(
              "Patients Page",
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
