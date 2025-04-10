import 'order_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/network/api_error_model.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/features/profile_company/data/repos/order_details_repo.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  final OrderDetailsRepo _orderDetailsRepo;
  List<String> productIds = [];

  OrderDetailsCubit(this._orderDetailsRepo)
      : super(const OrderDetailsState.initial());

  Future<void> getOrderById(String orderId) async {
    emit(const OrderDetailsState.loading());

    final token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.accessToken);
    if (token.isEmpty) {
      emit(OrderDetailsState.error(
        error: ApiErrorModel(message: 'No authentication token found'),
      ));
      return;
    }

    final response = await _orderDetailsRepo.getOrderById(orderId, token);

    response.when(
      success: (response) {
        if (response.isSucceeded) {
          productIds =
              response.model.orderItems.map((item) => item.productId).toList();
          emit(OrderDetailsState.success(response: response));
        } else {
          emit(OrderDetailsState.error(
            error: ApiErrorModel(message: response.message),
          ));
        }
      },
      failure: (error) {
        emit(OrderDetailsState.error(error: error));
      },
    );
  }

  String? getProductId(int index) {
    return index < productIds.length ? productIds[index] : null;
  }
}
