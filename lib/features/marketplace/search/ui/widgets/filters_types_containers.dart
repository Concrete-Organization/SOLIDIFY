import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/marketplace/search/ui/widgets/filter_section.dart';

class FiltersTypesContainers extends StatefulWidget {
  final Function(String) onCategorySelected;
  final Function(String) onBrandSelected;
  final Function(String) onPriceSelected;
  final List<String> selectedCategories;
  final List<String> selectedBrands;
  final String? selectedPriceRange;

  const FiltersTypesContainers({
    super.key,
    required this.onCategorySelected,
    required this.onBrandSelected,
    required this.onPriceSelected,
    required this.selectedCategories,
    required this.selectedBrands,
    required this.selectedPriceRange,
  });

  @override
  State<FiltersTypesContainers> createState() => _FiltersTypesContainersState();
}

class _FiltersTypesContainersState extends State<FiltersTypesContainers> {
  bool _isCategoriesOpen = false;
  bool _isBrandsOpen = false;
  bool _isPricesOpen = false;

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
            selectedFilters: widget.selectedCategories,
            onFilterSelected: widget.onCategorySelected,
            isOpen: _isCategoriesOpen,
            onToggle: () {
              setState(() {
                _isCategoriesOpen = !_isCategoriesOpen;
              });
            },
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
            selectedFilters: widget.selectedBrands,
            onFilterSelected: widget.onBrandSelected,
            isOpen: _isBrandsOpen,
            onToggle: () {
              setState(() {
                _isBrandsOpen = !_isBrandsOpen;
              });
            },
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
            selectedFilters: widget.selectedPriceRange != null
                ? [widget.selectedPriceRange!]
                : [],
            onFilterSelected: widget.onPriceSelected,
            isOpen: _isPricesOpen,
            onToggle: () {
              setState(() {
                _isPricesOpen = !_isPricesOpen;
              });
            },
          ),
        ],
      ),
    );
  }
}