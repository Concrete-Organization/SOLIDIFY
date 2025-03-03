import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/theming/color_manger.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theming/text_styles.dart';

class AvailableNowContainers extends StatefulWidget {
  const AvailableNowContainers({super.key});

  @override
  State<AvailableNowContainers> createState() => _AvailableNowContainersState();
}

class _AvailableNowContainersState extends State<AvailableNowContainers> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  final List<String> _imagePaths = [
    'assets/images/first_container.png',
    'assets/images/second_container.png',
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Available now',
          style: TextStyles.font15lightBlackSemiBold,
        ),
        verticalSpace(15),
        Container(
          width: double.infinity,
          height: 86.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: ColorsManager.mainBlue,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CarouselSlider.builder(
                carouselController: _carouselController,
                itemCount: _imagePaths.length,
                itemBuilder: (context, index, realIndex) {
                  return ClipRRect(
                    child: Image.asset(
                      _imagePaths[index],
                    ),
                  );
                },
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() => _currentIndex = index);
                  },
                ),
              ),
              Positioned(
                bottom: 8.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _imagePaths.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _carouselController.animateToPage(entry.key),
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 5),
                        width: _currentIndex == entry.key ? 6.w : 4.w,
                        height: _currentIndex == entry.key ? 6.h : 4.h,
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == entry.key
                              ? ColorsManager.mainBlue
                              : ColorsManager.mainBlueWith50Opacity,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        verticalSpace(20),
      ],
    );
  }
}
