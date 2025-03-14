import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/features/marketplace/marketplace/ui/widgets/product_category_bloc_builder.dart';
import 'package:solidify/features/marketplace/marketplace/logic/product_category_cubit.dart/prodcut_category_cubit.dart';

class ProductCategoryScreen extends StatefulWidget {
  const ProductCategoryScreen({super.key});

  @override
  State<ProductCategoryScreen> createState() => _ProductCategoryScreenState();
}

class _ProductCategoryScreenState extends State<ProductCategoryScreen> {
  int? categoryId;
  String? categoryLabel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is Map<String, dynamic>) {
      categoryLabel = args['label'] ?? 'Material';
      categoryId = args['id'];
      if (categoryId != null) {
        context.read<ProductCategoryCubit>().fetchProductCategory(categoryId!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            child: SvgPicture.asset('assets/svgs/cart_icon.svg'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: GestureDetector(
              child: SvgPicture.asset('assets/svgs/list_icon.svg'),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ProductCategoryBlocBuilder(
          categoryLabel: categoryLabel ?? 'Material',
        ),
      ),
    );
  }
}
