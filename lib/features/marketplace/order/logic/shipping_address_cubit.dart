import 'package:flutter/material.dart';
import 'shipping_address_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solidify/core/helpers/shared_pref_helper.dart';
import 'package:solidify/features/marketplace/order/data/repos/shipping_address_repo.dart';
import 'package:solidify/features/marketplace/order/data/models/shipping_address_request_model.dart';

class ShippingAddressCubit extends Cubit<ShippingAddressState> {
  final ShippingAddressRepo _shippingAddressRepo;

  ShippingAddressCubit(this._shippingAddressRepo)
      : super(const ShippingAddressState.initial());

  TextEditingController cityController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  Future<void> createShippingAddress({
    required String city,
    required String street,
    required String postalCode,
  }) async {
    emit(const ShippingAddressState.loading());

    final response = await _shippingAddressRepo.createShippingAddress(
      ShippingAddressRequestModel(
        city: cityController.text,
        street: streetController.text,
        postalCode: postalCodeController.text,
        phoneNumber: phoneController.text
      ),
    );

    response.when(
      success: (response) async {
        await SharedPrefHelper.setData(
          'selectedShippingAddressId',
          response.model.id.toString(),
        );

        emit(ShippingAddressState.success(response: response));
      },
      failure: (error) {
        emit(ShippingAddressState.error(error: error));
      },
    );
  }

  @override
  Future<void> close() {
    cityController.dispose();
    streetController.dispose();
    postalCodeController.dispose();
    phoneController.dispose();
    return super.close();
  }
}
