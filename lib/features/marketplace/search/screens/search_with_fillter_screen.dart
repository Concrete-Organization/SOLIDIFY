import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/marketplace/search/widgets/fillter_top_bar.dart';
import 'package:solidify/features/marketplace/search/widgets/fillters_text_row.dart';
import 'package:solidify/features/marketplace/search/widgets/search_with_fillter_bar.dart';
import 'package:solidify/features/marketplace/search/widgets/fillters_types_containers.dart';

class SearchWithFillterScreen extends StatelessWidget {
  const SearchWithFillterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FillterTopBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HorizontalDivider(),
            verticalSpace(15),
            SearchWithFillterBar(),
            verticalSpace(8),
            FilltersTextRow(),
            verticalSpace(10),
            HorizontalDivider(
              color: ColorsManager.mainBlueWith50Opacity,
            ),
            verticalSpace(25),
            FilltersTypesContainers()
          ],
        ),
      ),
    );
  }
}
