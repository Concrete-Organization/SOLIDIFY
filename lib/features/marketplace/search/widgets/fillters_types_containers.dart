import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/marketplace/search/widgets/filter_section.dart';

class FilltersTypesContainers extends StatelessWidget {
  final Function(String) onFilterSelected;
  final List<String> selectedFilters;

  const FilltersTypesContainers({
    super.key,
    required this.onFilterSelected,
    required this.selectedFilters,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categoryItems = [
      {'label': 'All categories'},
      {'label': 'Cement'},
      {'label': 'Superplasticizer'},
      {'label': 'Blast'},
      {'label': 'Sand'},
      {'label': 'Fly Ash'},
      {'label': 'coarse aggregate', 'width': 169.w},
    ];

    final List<Map<String, dynamic>> brandItems = [
      {'label': 'All brands'},
      {'label': 'Cement Australia'},
      {'label': 'Royal Cement'},
      {'label': 'Laxmi blocks'},
    ];

    final List<Map<String, dynamic>> priceItems = [
      {'label': 'All prices'},
      {'label': '200EGP - 500EGP'},
      {'label': '500EGP - 1000EGP'},
      {'label': '1000EGP - 1500EGP'},
      {'label': '1500EGP - 2000EGP'},
      {'label': '2000EGP - 2500EGP'},
      {'label': '2500EGP - 3000EGP'},
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FilterSection(
            title: 'Categories',
            items: categoryItems,
            columns: 2,
            selectedFilters: selectedFilters,
            onFilterSelected: onFilterSelected,
          ),
          verticalSpace(20),
          HorizontalDivider(
            color: ColorsManager.mainBlueWith50Opacity,
          ),
          verticalSpace(20),
          FilterSection(
            title: 'Brand name',
            items: brandItems,
            columns: 1,
            selectedFilters: selectedFilters,
            onFilterSelected: onFilterSelected,
          ),
          verticalSpace(20),
          HorizontalDivider(
            color: ColorsManager.mainBlueWith50Opacity,
          ),
          verticalSpace(20),
          FilterSection(
            title: 'Prices',
            items: priceItems,
            columns: 2,
            selectedFilters: selectedFilters,
            onFilterSelected: onFilterSelected,
          ),
        ],
      ),
    );
  }
}
