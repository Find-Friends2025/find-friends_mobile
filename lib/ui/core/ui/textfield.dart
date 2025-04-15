import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class DGTextField extends StatefulWidget {
  final String hintText;
  final Widget Function(Color color) iconBuilder;

  const DGTextField({
    super.key,
    required this.hintText,
    required this.iconBuilder,
  });

  @override
  State<DGTextField> createState() => _DGTextFieldState();
}

class _DGTextFieldState extends State<DGTextField> {
  final FocusNode focusNode = FocusNode();
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final iconColor = isFocused ? DGColors.primary : DGColors.line.normal;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: 370,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: iconColor, width: 0.5),
      ),
      child: Row(
        children: [
          TweenAnimationBuilder<Color?>(
            tween: ColorTween(begin: iconColor, end: iconColor),
            duration: const Duration(milliseconds: 200),
            builder: (context, color, child) {
              return widget.iconBuilder(color ?? iconColor);
            },
          ),
          const SizedBox(width: 15),
          Expanded(
            child: TextField(
              focusNode: focusNode,
              decoration: InputDecoration(
                hintText: widget.hintText,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
