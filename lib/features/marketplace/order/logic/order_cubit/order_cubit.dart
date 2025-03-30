import 'order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/features/marketplace/order/data/repos/order_repo.dart';
import 'package:solidify/features/marketplace/order/data/models/order_post_request.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepo _orderRepo;
  final TextEditingController notesController = TextEditingController();
  final GlobalKey<FormState> orderFormKey = GlobalKey<FormState>();

  OrderCubit(this._orderRepo) : super(const OrderState.initial());

  Future<void> createOrder({
    required int shippingAddressId,
    String? notes,
  }) async {
    emit(const OrderState.loading());

    // Get the cached address ID if not provided
    final addressId = shippingAddressId.toString().isNotEmpty
        ? shippingAddressId
        : int.tryParse(await SharedPrefHelper.getCachedShippingAddressId()) ??
            0;

    final response = await _orderRepo.createOrder(
      OrderPostRequest(
        shippingAddressId: addressId,
      ),
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.accessToken),
    );

    response.when(
      success: (response) async {
        if (response.isSucceeded) {
          await SharedPrefHelper.setData(
            'currentOrderId',
            _extractOrderId(response.message) ?? '',
          );

          emit(OrderState.success(response: response));
        } else {
          emit(OrderState.error(
            error: ApiErrorModel(message: response.message),
          ));
        }
      },
      failure: (error) {
        emit(OrderState.error(error: error));
      },
    );
  }

  // Helper to extract order ID from message if needed
  String? _extractOrderId(String message) {
    try {
      // Example: "Order #[325a3858-7a35-49f9-a672-df8fc1e3b727] Created successfully"
      final regex = RegExp(r'#\[([^\]]+)\]');
      final match = regex.firstMatch(message);
      return match?.group(1);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> close() {
    notesController.dispose();
    return super.close();
  }
}
