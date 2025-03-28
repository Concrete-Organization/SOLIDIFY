import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/custom_snack_bar.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/core/widgets/loading_circle_indicator.dart';
import 'package:solidify/features/marketplace/search/logic/search_cubit.dart';
import 'package:solidify/features/marketplace/search/logic/search_state.dart';
import 'package:solidify/features/marketplace/search/widgets/filter_top_bar.dart';
import 'package:solidify/features/marketplace/search/widgets/filters_text_row.dart';
import 'package:solidify/features/marketplace/search/widgets/search_with_filter_bar.dart';
import 'package:solidify/features/marketplace/search/widgets/filters_types_containers.dart';
import 'package:solidify/features/marketplace/marketplace/ui/widgets/product_grid_view.dart';

class SearchWithFilterScreen extends StatefulWidget {
  const SearchWithFilterScreen({super.key});

  @override
  State<SearchWithFilterScreen> createState() => _SearchWithFilterScreenState();
}

class _SearchWithFilterScreenState extends State<SearchWithFilterScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FilterTopBar(),
      body: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          state.whenOrNull(
            empty: () {
              CustomSnackBar.showInfo(
                context,
                'No products found matching your filters',
              );
            },
            error: (error) {
              CustomSnackBar.showError(
                context,
                'Search error: ${error.message}',
              );
            },
          );
        },
        builder: (context, state) {
          final cubit = context.read<SearchCubit>();

          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HorizontalDivider(),
                      verticalSpace(15),
                      SearchWithFilterBar(
                        controller: _searchController,
                        onChanged: (query) => cubit.updateSearchQuery(query),
                        onSubmitted: () => cubit.submitSearch(),
                      ),
                      verticalSpace(8),
                      FiltersTextRow(
                        selectedFilters: cubit.activeFilters,
                        onRemove: (filter) {
                          if (cubit.selectedCategories.contains(filter)) {
                            cubit.updateCategoryFilter(filter);
                          } else if (cubit.selectedBrands.contains(filter)) {
                            cubit.updateBrandFilter(filter);
                          } else if (filter == cubit.selectedPriceRange) {
                            cubit.updatePriceFilter('All prices');
                          }
                        },
                      ),
                      verticalSpace(10),
                      HorizontalDivider(
                        color: ColorsManager.mainBlueWith50Opacity,
                      ),
                      verticalSpace(25),
                      FiltersTypesContainers(
                        onCategorySelected: cubit.updateCategoryFilter,
                        onBrandSelected: cubit.updateBrandFilter,
                        onPriceSelected: cubit.updatePriceFilter,
                        selectedCategories: cubit.selectedCategories,
                        selectedBrands: cubit.selectedBrands,
                        selectedPriceRange: cubit.selectedPriceRange,
                      ),
                      verticalSpace(20),
                      const HorizontalDivider(),
                    ],
                  ),
                ),
              ),
              state.when(
                initial: () => SliverPadding(
                  padding: EdgeInsets.all(20.w),
                  sliver: SliverToBoxAdapter(
                    child: Center(child: Text('Apply filters to see products')),
                  ),
                ),
                loading: () => const SliverToBoxAdapter(
                  child: LoadingCircleIndicator(),
                ),
                success: (response) => SliverPadding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  sliver: ProductGridView(
                    products: response.model.items,
                  ),
                ),
                empty: () => SliverPadding(
                  padding: EdgeInsets.all(20.w),
                  sliver: SliverToBoxAdapter(
                    child: Center(child: Text('No products found')),
                  ),
                ),
                error: (error) => SliverPadding(
                  padding: EdgeInsets.all(20.w),
                  sliver: SliverToBoxAdapter(
                    child: Center(child: Text('Error: ${error.message}')),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
