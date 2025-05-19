import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/icons.dart';
import 'package:find_friends/ui/core/ui/checkbox.dart';
import 'package:flutter/material.dart';

class DGTopBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget? leading;
  final double? leadingWidth;
  final List<Widget>? actions;
  final Widget? title;
  final Color? backgroundColor;

  const DGTopBar({
    super.key,
    this.backgroundColor = const Color(0xffFFFFFF),
    this.title,
    this.leading,
    this.leadingWidth,
    this.actions,
  });

  @override
  Size get preferredSize => Size.fromHeight(48);

  @override
  State<DGTopBar> createState() => _DGTopBarState();
}

class _DGTopBarState extends State<DGTopBar> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      scrolledUnderElevation: 0.0,
      centerTitle: true,
      toolbarHeight: 48,
      backgroundColor: widget.backgroundColor,
      title: widget.title,
      actions: widget.actions,
      leading:
          widget.leading != null
              ? widget.leading!
              : GestureDetector(
                onTap: () {
                  // 뒤로
                },
                onTapDown: (_) => _updateScale(0.95),
                onTapCancel: () => _updateScale(1.0),
                onTapUp: (_) => _updateScale(1.0),
                child: AnimatedScale(
                  scale: _scale,
                  duration: const Duration(milliseconds: 100),
                  child: DGIcons.arrowLeft.toImage(
                    width: 24,
                    height: 24,
                    color: DGColors.static.black,
                  ),
                ),
              ),
      leadingWidth: widget.leadingWidth,
    );
  }

  void _updateScale(double scale) {
    setState(() {
      _scale = scale;
    });
  }
}
