import 'package:flutter/material.dart';

import '../../../../../core/resources/assets/app_images.dart';
import '../../../../../core/resources/styles/app_colors.dart';
import '../../../../../core/resources/values/app_strings.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../model/quran_resources.dart';

class SuraItemWidget extends StatelessWidget {
  final int index;

  const SuraItemWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final bodyLarge = Theme.of(
      context,
    ).textTheme.bodyLarge?.copyWith(fontSize: 20);
    final bodyMedium = Theme.of(context).textTheme.bodyMedium;
    return ListTile(
      leading: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(AppImages.imgSuraNum),
          Text('${index + 1}', style: bodyMedium),
        ],
      ),
      title: Text(QuranResources.englishQuranSurahList[index]),
      subtitle: Text('${QuranResources.ayaNumbers[index]} ${AppStrings.verses}'),
      trailing: Text(
        QuranResources.arabicQuranSurahList[index],
        style: bodyLarge,
      ),
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(AppRoutes.quranDetailsRouteName, arguments: index);
      },
      tileColor: AppColors.black60,
    );
  }
}
