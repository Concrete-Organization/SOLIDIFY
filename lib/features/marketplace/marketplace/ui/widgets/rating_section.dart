import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';

class RatingSection extends StatefulWidget {
  final Function(int) onRatingChanged;

  const RatingSection({super.key, required this.onRatingChanged});

  @override
  State<RatingSection> createState() => _RatingSectionState();
}

class _RatingSectionState extends State<RatingSection> {
  int _rating = 0;
  final double _starSize = 40.0;

  void _updateRating(Offset localPosition) {
    int newRating = (localPosition.dx / _starSize).ceil();
    newRating = newRating.clamp(0, 5);
    setState(() {
      _rating = newRating;
      widget.onRatingChanged(_rating);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rate this product',
          style: TextStyles.font14lightBlackMedium,
        ),
        verticalSpace(15),
        GestureDetector(
          onHorizontalDragUpdate: (details) {
            final localPosition = (context.findRenderObject() as RenderBox)
                .globalToLocal(details.globalPosition);
            _updateRating(localPosition);
          },
          onTapDown: (details) {
            final localPosition = (context.findRenderObject() as RenderBox)
                .globalToLocal(details.globalPosition);
            _updateRating(localPosition);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: SvgPicture.asset(
                  'assets/svgs/empty_star_icon.svg',
                  colorFilter: ColorFilter.mode(
                    index < _rating
                        ? ColorsManager.secondaryGold
                        : ColorsManager.mainBlue,
                    BlendMode.srcIn,
                  ),
                  width: _starSize,
                  height: _starSize,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
