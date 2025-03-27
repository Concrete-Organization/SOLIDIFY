import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/features/marketplace/order/logic/shipping_address_cubit.dart';
import 'package:solidify/features/marketplace/order/ui/widgets/shipping_address_bloc_consumer.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({super.key});

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {

  late ShippingAddressCubit cubit;


  @override
  void initState() {
    super.initState();
    cubit = context.read<ShippingAddressCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset('assets/svgs/back_arrow.svg'),
        ),
        title: Text(
          'Address details',
          style: TextStyles.font18MainSemiBold,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: GestureDetector(
              onTap: () => context.pushNamed(Routes.cartScreen),
              child: SvgPicture.asset('assets/svgs/filled_cart.svg'),
            ),
          ),
        ],
      ),
      body: ShippingAddressBlocConsumer(
        formKey: cubit.addressFormKey,
        cityController: cubit.cityController,
        streetController: cubit.streetController,
        postalCodeController: cubit.postalCodeController,
        phoneController: cubit.phoneController,
      ),
    );
  }
}
