import 'package:flutter/material.dart';

import '../../core/resources/assets/app_images.dart';
import '../../core/resources/styles/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../model/hadeth_details_model.dart';
import 'widget/app_bar_widget.dart';

class HadethDetailsScreen extends StatelessWidget {
  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final res = Responsive(context);
    final headlineSmall = Theme.of(
      context,
    ).textTheme.headlineSmall?.copyWith(color: AppColors.gold);
    final titleLarge = Theme.of(context).textTheme.titleLarge;
    final arg =
        ModalRoute.of(context)?.settings.arguments as HadethDetailsModel;
    return Scaffold(
      appBar: AppBarWidget.hadethDetails(index: arg.index),
      backgroundColor: AppColors.black,
      body: Column(
        crossAxisAlignment: .stretch,
        spacing: res.h(10),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: res.w(20),
              vertical: res.h(10),
            ),
            child: Row(
              children: [
                Image.asset(AppImages.imgLeftCorner),
                const Spacer(),
                Text(
                  arg.hadethModel?.title ?? 'No Title',
                  style: headlineSmall,
                ),
                const Spacer(),
                Image.asset(AppImages.imgRightCorner),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: res.w(20)),
              physics: const BouncingScrollPhysics(),
              child: Text(
                arg.hadethModel?.content ?? 'No Content',
                style: titleLarge?.copyWith(height: 2),
                textAlign: TextAlign.justify,
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
          Image.asset(
            AppImages.imgBottomDecoration,
            width: .infinity,
            height: res.h(112),
            fit: .fill,
            color: AppColors.gold60,
            colorBlendMode: .srcIn,
          ),
        ],
      ),
    );
  }
}
