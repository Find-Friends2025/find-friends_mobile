import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/icons.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:flutter/material.dart';

enum LineButtonSize { larger, large, medium, small }

class DGLineButton extends StatefulWidget {
  const DGLineButton({
    super.key,
    required this.text,
    required this.buttonSize,
    required this.onPressed,
    this.isEnabled = true,
    this.rounded = false,
    this.expand = false,
    this.leadingIcon,
    this.trailingIcon,
  });

  final String text;
  final LineButtonSize buttonSize;
  final VoidCallback onPressed;
  final bool isEnabled;
  final bool rounded;
  final bool expand;
  final DGIcons? leadingIcon;
  final DGIcons? trailingIcon;

  @override
  State<DGLineButton> createState() => _DGLineButtonState();
}

class _DGLineButtonState extends State<DGLineButton> {
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
        child:
            widget.expand
                ? Container(
                  width: double.infinity,
                  height: _getHeight(),
                  alignment: Alignment.center,
                  padding: _getPadding(),
                  decoration: _getDecoration(),
                  child: _buildContent(),
                )
                : Align(
                  // wrap할 때
                  alignment: Alignment.center,
                  child: IntrinsicWidth(
                    child: Container(
                      height: _getHeight(),
                      alignment: Alignment.center,
                      padding: _getPadding(),
                      decoration: _getDecoration(),
                      child: _buildContent(),
                    ),
                  ),
                ),
      ),
    );
  }

  Widget _buildContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize:
          (widget.expand &&
                  (widget.trailingIcon != null || widget.leadingIcon != null))
              ? MainAxisSize.max
              : MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (widget.leadingIcon != null)
          widget.leadingIcon!.toImage(
            width: _getIconSize(),
            height: _getIconSize(),
            color: DGColors.static.black,
          ),
        if (widget.trailingIcon != null) SizedBox(width: _getIconSize()),
        Text(
          widget.text,
          style: _getTextStyle().copyWith(color: DGColors.static.black),
          textAlign: TextAlign.center,
        ),
        if (widget.leadingIcon != null) SizedBox(width: _getIconSize()),
        if (widget.trailingIcon != null)
          widget.trailingIcon!.toImage(
            width: _getIconSize(),
            height: _getIconSize(),
            color: DGColors.static.black,
          ),
      ],
    );
  }

  BoxDecoration _getDecoration() {
    return BoxDecoration(
      color: DGColors.static.white,
      borderRadius: _getRadius(),
      border: Border.all(
        color:
            widget.isEnabled
                ? DGColors.primary
                : DGColors.primary.withValues(alpha: 0.4),
        width: _getStrokeWidth(),
      ),
    );
  }

  void _updateScale(double scale) {
    setState(() {
      _scale = widget.isEnabled ? scale : 1;
    });
  }

  BorderRadius _getRadius() => switch (widget.buttonSize) {
    LineButtonSize.larger => BorderRadius.circular(16),
    LineButtonSize.large => BorderRadius.circular(14),
    LineButtonSize.medium => BorderRadius.circular(12),
    LineButtonSize.small => BorderRadius.circular(10),
  };

  double _getHeight() => switch (widget.buttonSize) {
    LineButtonSize.larger => 56.0,
    LineButtonSize.large => 48.0,
    LineButtonSize.medium => 38.0,
    LineButtonSize.small => 32.0,
  };

  EdgeInsets? _getPadding() => switch (widget.buttonSize) {
    LineButtonSize.larger => const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 16.5,
    ),
    LineButtonSize.large => const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 13.5,
    ),
    LineButtonSize.medium => const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 10,
    ),
    LineButtonSize.small => const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 8,
    ),
  };

  TextStyle _getTextStyle() => switch (widget.buttonSize) {
    LineButtonSize.larger => DGTypography.headline2Bold,
    LineButtonSize.large => DGTypography.bodyBold,
    LineButtonSize.medium => DGTypography.labelBold,
    LineButtonSize.small => DGTypography.captionBold,
  };

  double _getIconSize() => switch (widget.buttonSize) {
    LineButtonSize.larger => 22.0,
    LineButtonSize.large => 20.0,
    LineButtonSize.medium => 18.0,
    LineButtonSize.small => 16.0,
  };

  double _getStrokeWidth() => switch (widget.buttonSize) {
    LineButtonSize.larger => 2.0,
    LineButtonSize.large => 1.5,
    LineButtonSize.medium => 1.3,
    LineButtonSize.small => 1.0,
  };
}
