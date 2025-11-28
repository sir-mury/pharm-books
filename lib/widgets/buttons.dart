import 'package:flutter/material.dart';
import 'package:pharm_books/consts/color_const.dart';
import 'package:pharm_books/consts/texts_consts.dart';

class PrimaryButton extends StatelessWidget {
  final String? data;
  final VoidCallback? onPressed;
  const PrimaryButton({super.key, this.onPressed, this.data});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: ColorConst.primary,
        shadowColor: ColorConst.grey,
        disabledBackgroundColor: ColorConst.primary.withValues(alpha: 0.5),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        textStyle: TextsConsts.bodyLight,
      ),
      child: Text(
        data ?? "Primary Button",
        style: TextsConsts.bodyLight.copyWith(color: ColorConst.darkGrey),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String? data;
  final VoidCallback? onPressed;
  const SecondaryButton({super.key, this.onPressed, this.data});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        overlayColor: ColorConst.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: ColorConst.secondary,
        shadowColor: ColorConst.grey,
        disabledBackgroundColor: ColorConst.secondary.withValues(alpha: 0.5),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        textStyle: TextsConsts.bodyDark,
      ),
      child: Text(data ?? "Secondary Button", style: TextsConsts.bodyDark),
    );
  }
}

class TertiaryTextButton extends StatelessWidget {
  final String? data;
  final VoidCallback? onPressed;
  const TertiaryTextButton({super.key, this.onPressed, this.data});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        overlayColor: ColorConst.darkGrey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: ColorConst.white,
        shadowColor: ColorConst.grey,
        disabledBackgroundColor: ColorConst.grey.withValues(alpha: 0.5),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        foregroundColor: ColorConst.black,
      ),
      child: Text(data ?? "Tertiary Button"),
    );
  }
}

class TertiaryIconButton extends StatelessWidget {
  final String? data;
  final VoidCallback? onPressed;
  final IconData? icon;
  const TertiaryIconButton({super.key, this.onPressed, this.data, this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon ?? Icons.star, color: ColorConst.black),
      onPressed: onPressed,
      style: IconButton.styleFrom(
        overlayColor: ColorConst.darkGrey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: ColorConst.grey,
        shadowColor: ColorConst.grey,
        disabledBackgroundColor: ColorConst.grey.withValues(alpha: 0.65),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }
}
