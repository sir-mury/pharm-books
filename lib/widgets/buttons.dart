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
        // textStyle: TextsConsts.bodyLight,
      ),
      child: Text(
        data ?? "Primary Button",
        style: TextsConsts.bodyLight.copyWith(
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
    );
  }
}

class PrimaryButtonWithIcon extends StatelessWidget {
  final String? data;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? buttonColor;
  const PrimaryButtonWithIcon({
    super.key,
    this.onPressed,
    this.data,
    this.buttonColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Padding(
        padding: const EdgeInsets.only(right: 4),
        child: Icon(
          icon ?? Icons.check,
          size: 24,
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
      label: Text(
        data ?? "Primary Button",
        style: TextsConsts.bodyLight.copyWith(
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: buttonColor ?? ColorConst.primary,
        shadowColor: ColorConst.grey,
        disabledBackgroundColor: (buttonColor ?? ColorConst.primary).withValues(
          alpha: 0.5,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        // textStyle: TextsConsts.bodyLight,
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
  final Color? backgroundColor;
  final String? tooltip;
  const TertiaryIconButton({
    super.key,
    this.onPressed,
    this.data,
    this.icon,
    this.backgroundColor,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon ?? Icons.star, color: ColorConst.black),
      onPressed: onPressed,
      tooltip: tooltip,
      style: IconButton.styleFrom(
        overlayColor: ColorConst.darkGrey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: backgroundColor ?? ColorConst.grey,
        shadowColor: ColorConst.grey,
        disabledBackgroundColor: ColorConst.grey.withValues(alpha: 0.65),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }
}
