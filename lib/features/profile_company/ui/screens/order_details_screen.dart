import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/horizontal_divider.dart';
import 'package:solidify/features/profile_company/ui/widgets/cancel_order_button.dart';
import 'package:solidify/features/marketplace/order/logic/order_cubit/order_cubit.dart';
import 'package:solidify/features/profile_company/ui/widgets/order_number_container.dart';
import 'package:solidify/features/profile_company/ui/widgets/order_details_container.dart';
import 'package:solidify/features/profile_company/logic/order_details_cubit/order_details_cubit.dart';
import 'package:solidify/features/profile_company/logic/order_details_cubit/order_details_state.dart';

class OrderDetailsScreen extends StatefulWidget {
  final String orderId;

  const OrderDetailsScreen({super.key, required this.orderId});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  String? validatedOrderId;

  @override
  void initState() {
    super.initState();
    _validateAndFetchOrder();
  }

  Future<void> _validateAndFetchOrder() async {
    final cachedOrderIds = await context.read<OrderCubit>().getCachedOrderIds();
    if (cachedOrderIds.isEmpty) {
      await context.read<OrderCubit>().getOrders();
      final updatedCachedOrderIds =
          await context.read<OrderCubit>().getCachedOrderIds();
      _setValidatedOrderId(updatedCachedOrderIds);
    } else {
      _setValidatedOrderId(cachedOrderIds);
    }
  }

  void _setValidatedOrderId(List<String> cachedOrderIds) {
    if (cachedOrderIds.contains(widget.orderId)) {
      validatedOrderId = widget.orderId;
    } else if (cachedOrderIds.isNotEmpty) {
      validatedOrderId = cachedOrderIds.first;
    } else {
      validatedOrderId = null;
    }

    if (validatedOrderId != null) {
      context.read<OrderDetailsCubit>().getOrderById(validatedOrderId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order details',
          style: TextStyles.font18MainSemiBold,
        ),
      ),
      body: BlocConsumer<OrderDetailsCubit, OrderDetailsState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${error.message}')),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (response) => SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    verticalSpace(30),
                    OrderNumberContainer(
                      orderId: response.model.id,
                      orderDate: response.model.orderDate,
                      shippingAddress:
                          '${response.model.shippingAddress.street}, ${response.model.shippingAddress.city}, ${response.model.shippingAddress.postalCode}',
                    ),
                    verticalSpace(15),
                    const HorizontalDivider(),
                    verticalSpace(15),
                    OrderDetailsContainer(
                      orderItems: response.model.orderItems,
                      totalPrice: response.model.totalPrice,
                      orderStatus: response.model.orderStatus,
                    ),
                    verticalSpace(40),
                    const CancelOrderButton(),
                  ],
                ),
              ),
            ),
            error: (error) => Center(child: Text('Error: ${error.message}')),
            orElse: () => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
