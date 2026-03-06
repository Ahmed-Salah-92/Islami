import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets/app_icons.dart';
import '../../../../core/resources/styles/app_colors.dart';
import '../../../../core/resources/values/app_strings.dart';
import '../../../../core/utils/responsive.dart';
import 'widget/most_recent_widget.dart';
import 'widget/sura_item_widget.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    final res = Responsive(context);
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: res.w(20)),
      child: Column(
        crossAxisAlignment: .start,
        spacing: res.h(20),
        children: [
          // ------------------- Search Bar -------------------
          TextField(
            style: const TextStyle(color: AppColors.white),
            cursorColor: AppColors.gold,
            decoration: InputDecoration(
              enabledBorder: buildODecorationBorder(res.w(10)),
              focusedBorder: buildODecorationBorder(res.w(10)),
              hintText: AppStrings.suraName,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(14.0),
                child: SvgPicture.asset(
                  AppIcons.icQuran,
                  width: 28,
                  height: 28,
                  colorFilter: const ColorFilter.mode(
                    AppColors.gold,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          // --------------- Most Recently ------------------
          const MostRecentWidget(),
          // ----------- Surah List -------------------
          Text(
            AppStrings.suraList,
            style: bodyLarge?.copyWith(color: AppColors.offWhite),
          ),
          Expanded(
            child: ListView.separated(
              padding: .zero,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SuraItemWidget(index: index);
              },
              separatorBuilder: (context, index) {
                final spaceWidth = res.w(64);
                return Divider(indent: spaceWidth, endIndent: spaceWidth);
              },
              itemCount: 114,
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder buildODecorationBorder(double radius) {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.gold),
      borderRadius: BorderRadius.circular(radius),
    );
  }
}
