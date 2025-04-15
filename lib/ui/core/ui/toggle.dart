import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

typedef OnCheckChanged = void Function(bool value);

class DGToggle extends StatefulWidget {
  const DGToggle({super.key, required this.isChecked, required this.onChanged});

  final bool isChecked;
  final OnCheckChanged onChanged;
  @override
  DGToggleState createState() => DGToggleState();
}

class DGToggleState extends State<DGToggle> {
  final duration = Duration(milliseconds: 100);
  final width = 51.0, height = 31.0;
  final ballSize = 27.0, ballPadding = 2.0;

  // double switchLeft = (51.0 - 25.0) - 2;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedContainer(
        duration: duration,
        width: width,
        height: height,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(99),
          ),
          color: widget.isChecked ? DGColors.primary : DGColors.line.normal,
        ),
        child: renderSwitchBall(),
      ),
      onTap: () {
        widget.onChanged(!widget.isChecked);
        setState(() {});
      },
    );
  }

  renderSwitchBall() {
    final ballRadius = ballSize / 2;

    return Stack(
      children: [
        AnimatedPositioned(
          duration: duration,
          top: 2,
          left:
              widget.isChecked ? (width - ballSize) - ballPadding : ballPadding,
          child: Container(
            width: ballSize,
            height: ballSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(ballRadius)),
              color: DGColors.static.white,
            ),
          ),
        ),
      ],
    );
  }
}
