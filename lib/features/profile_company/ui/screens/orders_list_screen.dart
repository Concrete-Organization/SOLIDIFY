import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/features/marketplace/order/logic/order_cubit/order_cubit.dart';
import 'package:solidify/features/marketplace/order/logic/order_cubit/order_state.dart';
import 'package:solidify/features/profile_company/ui/widgets/order_list_view_item.dart';

class OrdersListScreen extends StatefulWidget {
  const OrdersListScreen({super.key});

  @override
  State<OrdersListScreen> createState() => _OrdersListScreenState();
}

class _OrdersListScreenState extends State<OrdersListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<OrderCubit>().getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Orders',
          style: TextStyles.font18MainSemiBold,
        ),
      ),
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 18.h),
            child: state.maybeWhen(
              getOrdersLoading: () =>
                  const Center(child: CircularProgressIndicator()),
              getOrdersSuccess: (response) => ListView.separated(
                itemCount: response.model.items.length,
                separatorBuilder: (context, index) => verticalSpace(20),
                itemBuilder: (context, index) =>
                    OrderListViewItem(order: response.model.items[index]),
              ),
              orElse: () => const Center(child: Text('No orders available')),
            ),
          );
        },
      ),
    );
  }
}
