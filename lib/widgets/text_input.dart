import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pharm_books/consts/color_const.dart';
import 'package:pharm_books/consts/texts_consts.dart';

class StandardTextInput extends StatelessWidget {
  final String? label;
  final String? hintText;
  final bool? isEnabled;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? initialValue;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  const StandardTextInput({
    super.key,
    this.label,
    this.hintText,
    this.isEnabled,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.keyboardType,
    this.obscureText,
    this.validator,
    this.initialValue,
    this.autovalidateMode,
    this.onSubmitted,
    this.inputFormatters,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        label == null
            ? SizedBox.shrink()
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(label ?? "Label"),
                  ),
                  const SizedBox(height: 6),
                ],
              ),
        TextFormField(
          onFieldSubmitted: onSubmitted,
          inputFormatters: inputFormatters,
          autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
          initialValue: initialValue,
          validator: validator,
          maxLength: maxLength,
          maxLines: maxLines ?? minLines ?? 1,
          minLines: minLines ?? 1,
          keyboardType: keyboardType,
          obscureText: obscureText ?? false,
          controller: controller,
          onChanged: onChanged,
          enabled: isEnabled ?? true,
          decoration: InputDecoration(
            filled: true,
            fillColor: isEnabled == true ? ColorConst.white : ColorConst.grey,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorConst.darkGrey, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorConst.primary, width: 1.6),
              borderRadius: BorderRadius.circular(12),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade400, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorConst.grey, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: hintText ?? "Enter text here",
            hintStyle: TextsConsts.bodyLight,
            errorStyle: TextsConsts.captionsLight.copyWith(
              color: Colors.red.shade400,
            ),
            contentPadding: EdgeInsets.all(16),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: ColorConst.grey, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}

class IconTextInput extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final bool? atBeginning;
  final String? hintText;
  final bool? isEnabled;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? initialValue;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  const IconTextInput({
    super.key,
    this.label,
    this.hintText,
    this.isEnabled,
    this.maxLength,
    this.atBeginning,
    this.maxLines,
    this.minLines,
    this.icon,
    this.keyboardType,
    this.inputFormatters,
    this.obscureText,
    this.validator,
    this.initialValue,
    this.autovalidateMode,
    this.onSubmitted,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        label == null
            ? SizedBox.shrink()
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(label ?? "Label"),
                  ),
                  const SizedBox(height: 6),
                ],
              ),
        TextFormField(
          onFieldSubmitted: onSubmitted,
          autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
          initialValue: initialValue,
          validator: validator,
          maxLength: maxLength,
          maxLines: maxLines ?? minLines ?? 1,
          inputFormatters: inputFormatters,
          minLines: minLines ?? 1,
          keyboardType: keyboardType,
          obscureText: obscureText ?? false,
          controller: controller,
          onChanged: onChanged,
          enabled: isEnabled ?? true,
          decoration: InputDecoration(
            prefixIcon: atBeginning == true && icon != null
                ? Icon(icon, color: ColorConst.darkGrey.withValues(alpha: 0.7))
                : null,
            suffixIcon: atBeginning == true || icon == null
                ? null
                : Icon(icon, color: ColorConst.darkGrey.withValues(alpha: 0.7)),
            filled: true,
            fillColor: isEnabled == true ? ColorConst.white : ColorConst.grey,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorConst.darkGrey, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorConst.primary, width: 1.6),
              borderRadius: BorderRadius.circular(12),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade400, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorConst.grey, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: hintText ?? "Enter text here",
            hintStyle: TextsConsts.bodyLight,
            errorStyle: TextsConsts.captionsLight.copyWith(
              color: Colors.red.shade400,
            ),
            contentPadding: EdgeInsets.all(16),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: ColorConst.grey, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}

class CurrencyFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (newText.isEmpty) {
      return newValue.copyWith(text: '');
    }

    double value = double.parse(newText) / 100;
    final formatter = NumberFormat.currency(
      locale: 'en_US',
      symbol: 'NGN',
      decimalDigits: 2,
    );
    String newFormattedText = formatter.format(value);

    return TextEditingValue(
      text: newFormattedText,
      selection: TextSelection.collapsed(offset: newFormattedText.length),
    );
  }
}

class DateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    String formattedText = '';

    for (int i = 0; i < newText.length && i < 8; i++) {
      if (i == 2 || i == 4) {
        formattedText += '/';
      }
      formattedText += newText[i];
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
