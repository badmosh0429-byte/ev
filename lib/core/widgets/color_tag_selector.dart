import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';

/// Color tag selector widget
class ColorTagSelector extends StatelessWidget {
  final String? selectedTag;
  final Function(String) onTagSelected;
  
  const ColorTagSelector({
    super.key,
    required this.selectedTag,
    required this.onTagSelected,
  });
  
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: AppConstants.colorTags.map((tag) {
        final isSelected = selectedTag == tag;
        final color = AppColors.getColorForTag(tag);
        
        return GestureDetector(
          onTap: () => onTagSelected(tag),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? color : color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: color,
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Text(
              tag,
              style: TextStyle(
                color: isSelected ? Colors.white : color,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
