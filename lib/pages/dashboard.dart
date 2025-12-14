import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pharm_books/consts/color_const.dart';
import 'package:pharm_books/widgets/buttons.dart';
import 'package:pharm_books/widgets/info_cards.dart';
import 'package:pharm_books/widgets/text_input.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome, User!",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Here is your dashboard overview",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(4, (index) {
                            return InfoCard(
                              title: "Card Title $index",
                              value: "Value $index",
                              subtitle: "Subtitle for card $index",
                              subtitleColor: ColorConst.primary,
                            );
                          }),
                        ),
                        const SizedBox(height: 12),
                        chartsBoundingBox(context: context),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        quickActionsCard(context: context),
                        const SizedBox(height: 16),
                        recentActivityBox(context: context),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget chartsBoundingBox({required BuildContext context}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 12, 12, 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.2),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Charts Area", style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height: 12),
          // Placeholder for charts
          Container(
            height: 200,
            color: ColorConst.grey.withValues(alpha: 0.1),
            child: Center(
              child: Text(
                "Charts will be displayed here",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget quickActionsCard({required BuildContext context}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.2),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Quick Actions", style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height: 12),
          SizedBox(
            width: double.maxFinite,
            child: PrimaryButtonWithIcon(
              onPressed: () {},
              icon: Icons.bookmark_add,
              data: "New Prescription",
            ),
          ),
          SizedBox(height: 12),
          SizedBox(
            width: double.maxFinite,
            child: PrimaryButtonWithIcon(
              buttonColor: Color(0xFF46B47F),
              onPressed: () {},
              icon: Icons.store_rounded,
              data: "Add Stock",
            ),
          ),
          SizedBox(height: 12),
          SizedBox(
            width: double.maxFinite,
            child: PrimaryButtonWithIcon(
              onPressed: () {},
              buttonColor: Color(0xFF46B47F),
              icon: Icons.bar_chart,
              data: "View Reports",
            ),
          ),
        ],
      ),
    );
  }

  Widget recentActivityBox({required BuildContext context}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.2),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Activity",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 12),
          // Placeholder for recent activities
          Container(
            height: 200,
            color: ColorConst.grey.withValues(alpha: 0.1),
            child: Center(
              child: Text(
                "Recent activities will be displayed here",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
