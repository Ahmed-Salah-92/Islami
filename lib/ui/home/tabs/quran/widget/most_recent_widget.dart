import 'package:flutter/material.dart';

import '../../../../../core/resources/assets/app_images.dart';
import '../../../../../core/resources/styles/app_colors.dart';
import '../../../../../core/resources/values/app_strings.dart';
import '../../../../../core/utils/responsive.dart';

class MostRecentWidget extends StatelessWidget {
  const MostRecentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final res = Responsive(context);
    final bodyLarge = Theme.of(
      context,
    ).textTheme.bodyLarge?.copyWith(color: AppColors.offWhite);
    final bodyMedium = Theme.of(
      context,
    ).textTheme.bodyMedium?.copyWith(color: AppColors.black);
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;

    return Column(
      crossAxisAlignment: .start,
      spacing: res.h(20),
      children: [
        Text(AppStrings.mostRecently, style: bodyLarge),
        SizedBox(
          height: res.h(150),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.only(
                  left: res.w(17),
                  top: res.h(7),
                  bottom: res.h(7),
                ),
                decoration: BoxDecoration(
                  color: AppColors.gold,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: .start,
                      mainAxisAlignment: .spaceEvenly,
                      children: [
                        Text('Al-Anbiya', style: headlineSmall),
                        Text('الأنبياء', style: headlineSmall),
                        Text('112 ${AppStrings.verses}', style: bodyMedium),
                      ],
                    ),
                    Image.asset(AppImages.imgMostRecent, fit: .fill),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: res.w(10));
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
