import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/features/marketplace/cart/logic/cart_cubit.dart';
import 'package:solidify/features/marketplace/cart/ui/widgets/quantity_selector.dart';
import 'package:solidify/features/marketplace/cart/data/models/get_cart_response_model.dart';

class CartListViewItem extends StatefulWidget {
  final CartItemModel item;
  final Function(double) onPriceUpdated;
  final Function(String) onItemDeleted;

  const CartListViewItem({
    super.key,
    required this.item,
    required this.onPriceUpdated,
    required this.onItemDeleted,
  });

  @override
  State<CartListViewItem> createState() => _CartListViewItemState();
}

class _CartListViewItemState extends State<CartListViewItem> {
  int quantity = 1;
  double itemTotalPrice = 0;
  bool _isDeleting = false;

  @override
  void initState() {
    super.initState();
    quantity = widget.item.quantity;
    itemTotalPrice = widget.item.price * quantity;
  }

  void _increment() async {
    final previousQuantity = quantity;

    setState(() {
      quantity++;
      itemTotalPrice = widget.item.price * quantity;
      widget.onPriceUpdated(widget.item.price);
    });

    final success = await context
        .read<CartCubit>()
        .incrementCartItem(widget.item.id, quantity);

    if (!success && mounted) {
      setState(() {
        quantity = previousQuantity;
        itemTotalPrice = widget.item.price * quantity;
        widget.onPriceUpdated(-widget.item.price);
      });
      await context.read<CartCubit>().getCartItems();
    }
  }

  void _decrement() async {
    if (quantity <= 1) return;

    final previousQuantity = quantity;

    setState(() {
      quantity--;
      itemTotalPrice = widget.item.price * quantity;
      widget.onPriceUpdated(-widget.item.price);
    });

    final success = await context
        .read<CartCubit>()
        .decrementCartItem(widget.item.id, quantity);

    if (!success && mounted) {
      setState(() {
        quantity = previousQuantity;
        itemTotalPrice = widget.item.price * quantity;
        widget.onPriceUpdated(widget.item.price);
      });
      await context.read<CartCubit>().getCartItems();
    }
  }

  void _deleteItem() async {
    setState(() {
      _isDeleting = true;
    });
    widget.onPriceUpdated(-itemTotalPrice);
    widget.onItemDeleted(widget.item.id);

    await context.read<CartCubit>().deleteCartItem(
          widget.item.id,
          widget.item.name,
        );

    setState(() {
      _isDeleting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 30.w),
          child: Row(
            children: [
              Container(
                width: 113.w,
                height: 92.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorsManager.mainBlue,
                    width: 1.2.w,
                  ),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: widget.item.imageUri,
                    width: 67.w,
                    height: 84.h,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
              horizontalSpace(25),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.name,
                      style: TextStyles.font15lightBlackMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    verticalSpace(15),
                    Text(
                      '${itemTotalPrice.toStringAsFixed(2)} EGP',
                      style: TextStyles.font15MainBlueSemiBold,
                    ),
                    verticalSpace(15),
                    QuantitySelector(
                      quantity: quantity,
                      onIncrement: _increment,
                      onDecrement: _decrement,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: _isDeleting
              ? const CircularProgressIndicator()
              : GestureDetector(
                  onTap: _deleteItem,
                  child: SvgPicture.asset('assets/svgs/delete_icon.svg'),
                ),
        ),
      ],
    );
  }
}
