import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:find_friends/ui/core/themes/icons.dart';

class DGTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final DGIcons? icon;
  final Color? iconColor;
  final TextInputType fieldType;
  void Function(String)? onChanged;

  DGTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.icon,
    this.iconColor,
    this.fieldType = TextInputType.text,
    this.onChanged
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(focusNode);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: MediaQuery.of(context).size.width * 0.9,
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: iconColor, width: 0.5),
        ),
        child: Row(
          children: [
            if (widget.icon != null) ...[
              widget.icon!.toImage(color: iconColor, width: 24, height: 24),
              const SizedBox(width: 15),
            ],
            Expanded(
              child: TextField(
                onChanged: widget.onChanged,
                keyboardType: widget.fieldType,
                controller: widget.controller,
                focusNode: focusNode,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
