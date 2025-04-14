import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/icons.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:flutter/material.dart';

enum ButtonSize { larger, large, medium, small }

class DGButton extends StatefulWidget {
  const DGButton({
    super.key,
    required this.text,
    required this.buttonSize,
    required this.onPressed,
    this.isEnabled = true,
    this.rounded = false,
    this.leadingIcon,
    this.trailingIcon,
  });

  final String text;
  final ButtonSize buttonSize;
  final VoidCallback onPressed;
  final bool isEnabled;
  final bool rounded;
  final DGIcons? leadingIcon;
  final DGIcons? trailingIcon;

  @override
  State<DGButton> createState() => _DGButtonState();
}

class _DGButtonState extends State<DGButton> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isEnabled ? widget.onPressed : () {},
      onTapDown: (_) => _updateScale(0.95),
      onTapCancel: () => _updateScale(1.0),
      onTapUp: (_) => _updateScale(1.0),
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        child: SizedBox(
          height: _getHeight(),
          child: Container(
            alignment: Alignment.center,
            padding: _getPadding(),
            decoration: BoxDecoration(
              color:
                  widget.isEnabled
                      ? DGColors.primary
                      : DGColors.primary.withValues(alpha: 0.4),
              borderRadius: _getRadius(),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                if (widget.leadingIcon != null)
                  widget.leadingIcon!.toImage(
                    width: _getIconSize(),
                    height: _getIconSize(),
                    color: DGColors.static.white,
                  ),
                if (widget.trailingIcon != null)
                  SizedBox(width: _getIconSize()),
                Text(
                  widget.text,
                  style: _getTextStyle().copyWith(color: DGColors.static.white),
                ),
                if (widget.leadingIcon != null) SizedBox(width: _getIconSize()),
                if (widget.trailingIcon != null)
                  widget.trailingIcon!.toImage(
                    width: _getIconSize(),
                    height: _getIconSize(),
                    color: DGColors.static.white,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _updateScale(double scale) {
    setState(() {
      _scale = widget.isEnabled ? scale : 1;
    });
  }

  BorderRadius _getRadius() => switch (widget.buttonSize) {
    ButtonSize.larger => BorderRadius.circular(16),
    ButtonSize.large => BorderRadius.circular(14),
    ButtonSize.medium => BorderRadius.circular(12),
    ButtonSize.small => BorderRadius.circular(10),
  };

  double _getHeight() => switch (widget.buttonSize) {
    ButtonSize.larger => 56.0,
    ButtonSize.large => 48.0,
    ButtonSize.medium => 38.0,
    ButtonSize.small => 32.0,
  };

  EdgeInsets? _getPadding() => switch (widget.buttonSize) {
    ButtonSize.larger => const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 16.5,
    ),
    ButtonSize.large => const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 13.5,
    ),
    ButtonSize.medium => const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 10,
    ),
    ButtonSize.small => const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  };

  TextStyle _getTextStyle() => switch (widget.buttonSize) {
    ButtonSize.larger => DGTypography.headline2Bold,
    ButtonSize.large => DGTypography.bodyBold,
    ButtonSize.medium => DGTypography.labelBold,
    ButtonSize.small => DGTypography.captionBold,
  };

  double _getIconSize() => switch (widget.buttonSize) {
    ButtonSize.larger => 22.0,
    ButtonSize.large => 20.0,
    ButtonSize.medium => 18.0,
    ButtonSize.small => 16.0,
  };
}
