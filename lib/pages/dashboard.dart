import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pharm_books/consts/color_const.dart';
import 'package:pharm_books/widgets/buttons.dart';
import 'package:pharm_books/widgets/text_input.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Container(
      color: ColorConst.white,
      width: 500,
      height: double.infinity,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            PrimaryButton(onPressed: () {}),
            const SizedBox(height: 20),
            SecondaryButton(onPressed: () {}),
            const SizedBox(height: 20),
            TertiaryTextButton(onPressed: () {}),
            const SizedBox(height: 20),
            TertiaryIconButton(onPressed: () {}),
            const SizedBox(height: 40),
            PrimaryButton(),
            const SizedBox(height: 20),
            SecondaryButton(),
            const SizedBox(height: 20),
            TertiaryTextButton(),
            const SizedBox(height: 20),
            TertiaryIconButton(),
            const SizedBox(height: 40),
            StandardTextInput(
              label: "Enabled Input",
              hintText: "Enter your text here",
              isEnabled: true,
              controller: _controller,
              onChanged: (value) {},
            ),
            const SizedBox(height: 40),
            StandardTextInput(
              // label: "Enabled Input",
              validator: (value) {
                // if (value == null || value.isEmpty) {
                //   return "This field cannot be empty";
                // }
                if (value!.length < 5) {
                  return "Minimum 5 characters required";
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              hintText: "Enter your text here",
              isEnabled: true,
              controller: _controller,
              onChanged: (value) {},
            ),
            const SizedBox(height: 40),
            StandardTextInput(
              label: "Text Area Input",
              validator: (value) {
                // if (value == null || value.isEmpty) {
                //   return "This field cannot be empty";
                // }
                if (value!.length < 5) {
                  return "Minimum 5 characters required";
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              hintText: "Enter your text here",
              isEnabled: true,
              controller: _controller,
              minLines: 5,
              onChanged: (value) {},
            ),
            const SizedBox(height: 40),
            IconTextInput(
              label: "Icon Input Currency",
              icon: Icons.money,
              atBeginning: true,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CurrencyFormatter(),
              ],
              validator: (value) {
                if (!value!.isNumericOnly) {
                  return "Must be a number";
                }
                if (value.length < 5) {
                  return "Minimum 5 characters required";
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              hintText: "Enter your text here",
              isEnabled: true,
              controller: _controller,
              onChanged: (value) {},
            ),
            const SizedBox(height: 40),
            IconTextInput(
              label: "Icon Input Date",
              icon: Icons.date_range,
              atBeginning: false,
              inputFormatters: [DateFormatter()],
              validator: (value) {
                // if (value == null || value.isEmpty) {
                //   return "This field cannot be empty";
                // }
                if (value!.length < 5) {
                  return "Minimum 5 characters required";
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              hintText: "Enter your text here",
              isEnabled: true,
              controller: _controller,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
