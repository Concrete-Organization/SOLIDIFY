import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidify/core/helpers/spacing.dart';
import 'package:solidify/core/theming/text_styles.dart';
import 'package:solidify/core/theming/color_manger.dart';

class RatingSection extends StatefulWidget {
  const RatingSection({super.key});

  @override
  _RatingSectionState createState() => _RatingSectionState();
}

class _RatingSectionState extends State<RatingSection> {
  int _rating = 0;
  final double _starSize = 40.0;

  void _updateRating(Offset localPosition) {
    // Calculate new rating based on position relative to star width.
    int newRating = (localPosition.dx / _starSize).ceil();
    // Clamp the rating between 0 and 5
    newRating = newRating.clamp(0, 5);
    setState(() {
      _rating = newRating;
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
          // When user slides horizontally
          onHorizontalDragUpdate: (details) {
            // Convert global position to local coordinates relative to this widget
            final localPosition = (context.findRenderObject() as RenderBox)
                .globalToLocal(details.globalPosition);
            _updateRating(localPosition);
          },
          // Also respond to direct taps
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
                  // If the star's index is less than the current rating, color it secondaryGold.
                  color: index < _rating ? ColorsManager.secondaryGold : null,
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
