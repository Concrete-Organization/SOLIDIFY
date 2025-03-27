import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:solidify/core/helpers/extensions.dart';
import 'package:solidify/core/routes/routes_name.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/features/marketplace/order/ui/widgets/shipping_address_bloc_consumer.dart';



class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({super.key});

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _cityController.dispose();
    _streetController.dispose();
    _postalCodeController.dispose();
    _phoneController.dispose();
    super.dispose();
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
        formKey: _formKey,
        cityController: _cityController,
        streetController: _streetController,
        postalCodeController: _postalCodeController,
        phoneController: _phoneController,
      ),
    );
  }
}
