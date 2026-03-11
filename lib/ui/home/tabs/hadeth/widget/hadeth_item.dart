import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/resources/assets/app_files.dart';
import '../../../../../core/resources/assets/app_images.dart';
import '../../../../../core/resources/styles/app_colors.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/responsive.dart';
import '../../../../../model/hadeth_details_model.dart';
import '../../../../../model/hadeth_model.dart';

class HadethItem extends StatefulWidget {
  final int index;

  const HadethItem({super.key, required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  late HadethModel? hadethModel;
  late Responsive res;
  late final TextStyle? headlineSmall;
  late final TextStyle? bodyLarge;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    res = Responsive(context);
    headlineSmall = Theme.of(context).textTheme.headlineSmall;
    bodyLarge = Theme.of(
      context,
    ).textTheme.bodyLarge?.copyWith(color: AppColors.black);
  }

  @override
  void initState() {
    super.initState();
    hadethModel = null;
    loadHadethFile(number: widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.hadithDetailsRouteName,
          arguments: HadethDetailsModel(index: widget.index, hadethModel: hadethModel),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.gold,
          borderRadius: BorderRadius.circular(res.h(20)),
          image: const DecorationImage(
            image: AssetImage(AppImages.hadethCardBg),
          ),
        ),
        child: Column(
          spacing: res.h(10),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: res.h(12),
                horizontal: res.w(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  hadethTopCornerImg(AppImages.imgLeftCorner),
                  Expanded(
                    child: hadethText(
                      hadethModel?.title ?? '',
                      style: headlineSmall,
                    ),
                  ),
                  hadethTopCornerImg(AppImages.imgRightCorner),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: res.w(22)),
                child: hadethModel == null
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.black,
                        ),
                      )
                    : hadethText(
                        hadethModel?.content ?? 'No Content',
                        style: bodyLarge,
                      ),
              ),
            ),
            Image.asset(
              AppImages.imgBottomDecoration,
              alignment: Alignment.bottomCenter,
              width: .infinity,
              height: res.h(112),
              fit: .fill,
              color: AppColors.black,
              colorBlendMode: .srcIn,
            ),
          ],
        ),
      ),
    );
  }

  Widget hadethTopCornerImg(String impPath) {
    return Image.asset(
      impPath,
      color: AppColors.black,
      width: res.w(93.1),
      height: res.h(100.63),
    );
  }

  Widget hadethText(String textData, {TextStyle? style = const TextStyle()}) {
    return Text(
      textData,
      style: style,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
  }

  Future<void> loadHadethFile({required int number}) async {
    final String filePath = '${AppFiles.hadethFiles}h$number.txt';
    final String hadethContent = await rootBundle.loadString(filePath);
    final int hadethContentIndex = hadethContent.indexOf('\n');
    final String title = hadethContent.substring(0, hadethContentIndex);
    final String content = hadethContent.substring(hadethContentIndex + 1);
    hadethModel = HadethModel(title: title, content: content);
    Future.delayed(const Duration(seconds: 1), () => setState(() {}));
  }
}
