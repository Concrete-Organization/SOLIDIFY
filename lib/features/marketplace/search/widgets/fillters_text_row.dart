import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';

class FilltersTextRow extends StatelessWidget {
  const FilltersTextRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Cement',
          style: TextStyles.font10lightBlackRegular,
        ),
        horizontalSpace(3),
        SvgPicture.asset('assets/svgs/fillter_exit.svg')
      ],
    );
  }
}
