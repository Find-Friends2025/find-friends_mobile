import 'package:flutter/material.dart';
import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/typography.dart';

class DGChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final bool expand;

  const DGChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.expand = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? DGColors.primary : DGColors.fill.alternative,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? DGColors.primary : DGColors.line.neutral,
            width: 1.5,
          ),
        ),
        width: expand ? double.infinity : null,
        child: Text(
          label,
          style: DGTypography.bodyBold.copyWith(
            color: selected ? DGColors.static.white : DGColors.label.strong,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
} 