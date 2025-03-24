import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/features/marketplace/search/widgets/filter_name_container.dart';

class FilterSection extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> items;
  final int columns;
  final List<String> selectedFilters;
  final Function(String) onFilterSelected;

  const FilterSection({
    super.key,
    required this.title,
    required this.items,
    required this.columns,
    required this.selectedFilters,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    final int midPoint =
        (columns == 2) ? (items.length / 2).ceil() : items.length;
    final List<Map<String, dynamic>> firstColumnItems =
        items.sublist(0, midPoint);
    final List<Map<String, dynamic>> secondColumnItems =
        (columns == 2) ? items.sublist(midPoint) : [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.font15lightBlackSemiBold,
        ),
        verticalSpace(10),
        columns == 1
            ? _buildSingleColumn(firstColumnItems)
            : _buildTwoColumns(firstColumnItems, secondColumnItems),
      ],
    );
  }

  Widget _buildSingleColumn(List<Map<String, dynamic>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.asMap().entries.map((entry) {
        final item = entry.value;
        return Column(
          children: [
            FilterNameContainer(
              label: item['label'],
              isSelected: selectedFilters.contains(item['label']),
              onTap: () => onFilterSelected(item['label']),
              width: item['width'] ?? 137.w,
              height: 28.h,
            ),
            if (entry.key < items.length - 1) verticalSpace(8),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildTwoColumns(List<Map<String, dynamic>> firstColumnItems,
      List<Map<String, dynamic>> secondColumnItems) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: firstColumnItems.asMap().entries.map((entry) {
            final item = entry.value;
            return Column(
              children: [
                FilterNameContainer(
                  label: item['label'],
                  isSelected: selectedFilters.contains(item['label']),
                  onTap: () => onFilterSelected(item['label']),
                  width: item['width'] ?? 137.w,
                  height: 28.h,
                ),
                if (entry.key < firstColumnItems.length - 1) verticalSpace(8),
              ],
            );
          }).toList(),
        ),
        horizontalSpace(30),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: secondColumnItems.asMap().entries.map((entry) {
            final item = entry.value;
            return Column(
              children: [
                FilterNameContainer(
                  label: item['label'],
                  isSelected: selectedFilters.contains(item['label']),
                  onTap: () => onFilterSelected(item['label']),
                  width: item['width'] ?? 137.w,
                  height: 28.h,
                ),
                if (entry.key < secondColumnItems.length - 1) verticalSpace(8),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
