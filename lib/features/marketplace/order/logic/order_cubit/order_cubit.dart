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
    emit(const OrderState.createLoading());

    final addressId = shippingAddressId.toString().isNotEmpty
        ? shippingAddressId
        : int.tryParse(await SharedPrefHelper.getCachedShippingAddressId()) ??
            0;

    final response = await _orderRepo.createOrder(
      OrderPostRequest(shippingAddressId: addressId),
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.accessToken),
    );

    response.when(
      success: (response) async {
        if (response.isSucceeded) {
          final orderId = _extractOrderId(response.message);
          if (orderId != null) {
            await SharedPrefHelper.setData('currentOrderId', orderId);
            final currentIds = await SharedPrefHelper.getCachedOrderIds();
            if (!currentIds.contains(orderId)) {
              currentIds.add(orderId);
              await SharedPrefHelper.cacheOrderIds(currentIds);
            }
          }
          emit(OrderState.createSuccess(response: response));
        } else {
          emit(OrderState.createError(
            error: ApiErrorModel(message: response.message),
          ));
        }
      },
      failure: (error) {
        emit(OrderState.createError(error: error));
      },
    );
  }

  Future<void> getOrders({int page = 1}) async {
    emit(const OrderState.getOrdersLoading());

    final token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.accessToken);
    if (token.isEmpty) {
      emit(OrderState.getOrdersError(
        error: ApiErrorModel(message: 'No authentication token found'),
      ));
      return;
    }

    final response = await _orderRepo.getOrders(page, token);

    response.when(
      success: (response) async {
        if (response.isSucceeded) {
          final orderIds = response.model.items.map((item) => item.id).toList();
          await SharedPrefHelper.cacheOrderIds(orderIds);
          emit(OrderState.getOrdersSuccess(response: response));
        } else {
          emit(OrderState.getOrdersError(
              error: ApiErrorModel(message: response.message)));
        }
      },
      failure: (error) {
        emit(OrderState.getOrdersError(error: error));
      },
    );
  }

  Future<List<String>> getCachedOrderIds() async {
    return await SharedPrefHelper.getCachedOrderIds();
  }

  String? _extractOrderId(String message) {
    try {
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
