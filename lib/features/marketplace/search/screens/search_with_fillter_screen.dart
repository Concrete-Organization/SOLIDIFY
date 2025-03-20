import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/marketplace/search/widgets/fillter_top_bar.dart';
import 'package:solidify/features/marketplace/search/widgets/fillters_text_row.dart';
import 'package:solidify/features/marketplace/search/widgets/search_with_fillter_bar.dart';
import 'package:solidify/features/marketplace/search/widgets/fillters_types_containers.dart';

class SearchWithFillterScreen extends StatefulWidget {
  const SearchWithFillterScreen({super.key});

  @override
  State<SearchWithFillterScreen> createState() =>
      _SearchWithFillterScreenState();
}

class _SearchWithFillterScreenState extends State<SearchWithFillterScreen> {
  List<String> selectedFilters = ['Cement'];

  void addFilter(String filter) {
    setState(() {
      if (!selectedFilters.contains(filter)) {
        selectedFilters.add(filter);
      }
    });
  }

  void removeFilter(String filter) {
    setState(() {
      selectedFilters.remove(filter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FillterTopBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HorizontalDivider(),
              verticalSpace(15),
              const SearchWithFillterBar(),
              verticalSpace(8),
              FilltersTextRow(
                selectedFilters: selectedFilters,
                onRemove: removeFilter,
              ),
              verticalSpace(10),
              HorizontalDivider(
                color: ColorsManager.mainBlueWith50Opacity,
              ),
              verticalSpace(25),
              FilltersTypesContainers(
                onFilterSelected: addFilter,
                selectedFilters: selectedFilters,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
