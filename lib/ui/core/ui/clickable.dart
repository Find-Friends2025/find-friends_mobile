import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class DGClickable extends StatefulWidget {
  const DGClickable({
    super.key,
    required this.onPressed,
    this.shapeDecoration,
    required this.child,
    this.isEnabled = true,
  });

  final Widget child;
  final bool isEnabled;
  final GestureTapCallback onPressed;
  final ShapeDecoration? shapeDecoration;

  @override
  State<DGClickable> createState() => _ClickableState();
}

class _ClickableState extends State<DGClickable> {
  double _scale = 1.0;
  bool _isTab = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isEnabled ? widget.onPressed : () {},
      onTapDown: (_) => _onTapDown(), // 누를 때 축소
      onTapCancel: () => _onTapUp(), // 취소 시 복원
      onTapUp: (_) => _onTapUp(), // 뗄 때 복원
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        child: AnimatedContainer(
          decoration:
              widget.shapeDecoration ??
              ShapeDecoration(
                color:
                    _isTab
                        ? DGColors.static.black.withValues(alpha: 0.04)
                        : Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
          duration: const Duration(milliseconds: 100),
          child: widget.child,
        ),
      ),
    );
  }

  void _onTapDown() {
    setState(() {
      if (!widget.isEnabled) {
        return _onTapUp();
      }
      _scale = 0.95;
      _isTab = true;
    });
  }

  void _onTapUp() {
    setState(() {
      _scale = 1;
      _isTab = false;
    });
  }
}
