import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyTextField extends StatelessWidget {
  final TextEditingController controller;
  final int length;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onCompleted;

  const VerifyTextField({
    super.key,
    required this.controller,
    this.length = 6,
    required this.onChanged,
    required this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      controller: controller,
      length: length,
      obscureText: false,
      animationType: AnimationType.none,
      autoFocus: true,
      keyboardType: TextInputType.number,

      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8),
        fieldHeight: 50,
        fieldWidth: 50,
        inactiveBorderWidth: 1,
        activeBorderWidth: 1,
        selectedBorderWidth: 1,
        activeFillColor: Colors.transparent,
        inactiveFillColor: Colors.transparent,
        selectedFillColor: Colors.transparent,
        inactiveColor: DGColors.line.normal,
        activeColor: DGColors.primary,
        selectedColor: DGColors.primary,
      ),
      textStyle: DGTypography.headline1Medium,
      animationDuration: const Duration(milliseconds: 0),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      onChanged: onChanged,
      onCompleted: onCompleted,
    );
  }
}
