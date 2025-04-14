import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DGCheckbox extends StatefulWidget {
  DGCheckBoxSize size;
  bool isEnabled;
  bool toggle;

  DGCheckbox({
    super.key,
    this.toggle = false,
    this.size = DGCheckBoxSize.medium,
    this.isEnabled = true,
  });

  @override
  State<DGCheckbox> createState() => _DGCheckboxState();
}

class _DGCheckboxState extends State<DGCheckbox> {

  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.toggle = !widget.toggle;
      },
      onTapDown: (_) => _updateScale(0.95),
      onTapCancel: () => _updateScale(1.0),
      onTapUp: (_) => _updateScale(1.0),
      child: AnimatedScale(
          scale: _scale,
        duration: const Duration(milliseconds: 100),
        child: Container(
            width: widget.size.getSize.width,
            height: widget.size.getSize.height,
            decoration: widget.toggle ? BoxDecoration(
                color: DGColors.primary,
              borderRadius: BorderRadius.circular(widget.size.getRadius),
            ) : BoxDecoration(
              borderRadius: BorderRadius.circular(widget.size.getRadius),
              border: Border.all(color: DGColors.label.assistive, width: 2),
            ),
            child: (widget.toggle) ? Padding(
                padding: EdgeInsets.all(3),
              child: DGIcons.check.toImage(
                  color: DGColors.static.white
              )
            ) : null
        )
      ),
    );
  }


  void _updateScale(double scale) {
    setState(() {
      _scale = scale;
    });
  }
}

enum DGCheckBoxSize { small, medium, large }

extension DGCheckboxGetSize on DGCheckBoxSize {
  Size get getSize => switch (this) {
    DGCheckBoxSize.small => Size(16, 16),
    DGCheckBoxSize.medium => Size(32, 32),
    DGCheckBoxSize.large => Size(64, 64),
  };

  double get getRadius => switch (this) {
    DGCheckBoxSize.small => 2,
    DGCheckBoxSize.medium => 3,
    DGCheckBoxSize.large => 4,
  };
}
