import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FiltersTextRow extends StatelessWidget {
  final List<String> selectedFilters;
  final Function(String) onRemove;

  const FiltersTextRow({
    super.key,
    required this.selectedFilters,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w,
      children: selectedFilters.map((filter) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              filter,
              style: TextStyles.font10lightBlackRegular,
            ),
            horizontalSpace(3),
            GestureDetector(
              onTap: () => onRemove(filter),
              child: SvgPicture.asset('assets/svgs/fillter_exit.svg'),
            ),
          ],
        );
      }).toList(),
    );
  }
}