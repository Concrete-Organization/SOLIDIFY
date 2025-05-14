import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/features/marketplace/search/logic/search_state.dart';
import 'package:solidify/features/marketplace/search/data/repos/search_repo.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _searchRepo;
  String? _currentSearchQuery;
  final List<String> _selectedCategories = [];
  final List<String> _selectedBrands = [];
  String? _selectedPriceRange;

  SearchCubit(this._searchRepo) : super(const SearchState.initial());

  List<String> get selectedCategories => _selectedCategories;
  List<String> get selectedBrands => _selectedBrands;
  String? get selectedPriceRange => _selectedPriceRange;

  void updateSearchQuery(String query) {
    _currentSearchQuery = query.isNotEmpty ? query : null;
  }

  void updateCategoryFilter(String category) {
    if (category == 'All categories') {
      _selectedCategories.clear();
    } else if (_selectedCategories.contains(category)) {
      _selectedCategories.remove(category);
    } else {
      _selectedCategories.add(category);
    }
    _performSearch();
  }

  void updateBrandFilter(String brand) {
    if (brand == 'All brands') {
      _selectedBrands.clear();
    } else if (_selectedBrands.contains(brand)) {
      _selectedBrands.remove(brand);
    } else {
      _selectedBrands.add(brand);
    }
    _performSearch();
  }

  void updatePriceFilter(String price) {
    if (price == 'All prices') {
      _selectedPriceRange = null;
    } else if (_selectedPriceRange == price) {
      _selectedPriceRange = null;
    } else {
      _selectedPriceRange = price;
    }
    _performSearch();
  }

  Future<void> submitSearch() async {
    await _performSearch();
  }

  Future<void> _performSearch() async {
    emit(const SearchState.loading());

    double? minPrice;
    double? maxPrice;

    if (_selectedPriceRange != null) {
      final priceParts = _selectedPriceRange!.split(' - ');
      minPrice = double.tryParse(priceParts[0].replaceAll('EGP', '').trim());
      maxPrice = double.tryParse(priceParts[1].replaceAll('EGP', '').trim());
    }

    final result = await _searchRepo.searchProducts(
      searchedPhrase: _currentSearchQuery,
      categoryName:
          _selectedCategories.isNotEmpty ? _selectedCategories.join(',') : null,
      brandName: _selectedBrands.isNotEmpty ? _selectedBrands.join(',') : null,
      minPrice: minPrice,
      maxPrice: maxPrice,
    );

    result.when(
      success: (response) {
        if (response.model.items.isEmpty) {
          emit(const SearchState.empty());
        } else {
          emit(SearchState.success(response));
        }
      },
      failure: (error) => emit(SearchState.error(error)),
    );
  }

  List<String> get activeFilters {
    return [
      ..._selectedCategories,
      ..._selectedBrands,
      if (_selectedPriceRange != null) _selectedPriceRange!,
    ];
  }

  void resetFilters() {
    _selectedCategories.clear();
    _selectedBrands.clear();
    _selectedPriceRange = null;
    _currentSearchQuery = null;
    emit(const SearchState.initial());
  }
}
