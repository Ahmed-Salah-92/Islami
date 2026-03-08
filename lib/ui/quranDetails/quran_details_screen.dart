import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/resources/assets/app_files.dart';
import '../../core/resources/assets/app_images.dart';
import '../../core/resources/styles/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../model/quran_resources.dart';
import 'widget/app_bar_widget.dart';
import 'widget/sura_content_widget.dart';

class QuranDetailsScreen extends StatefulWidget {
  const QuranDetailsScreen({super.key});

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  late Responsive res;
  late List<String> verses;
  late String verses2;
  late int args;
  late bool showSuraContentFormated;

  // bool isLoading = true;

  @override
  void initState() {
    super.initState();
    verses = [];
    verses2 = '';
    showSuraContentFormated = false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    res = Responsive(context);
    args = ModalRoute.of(context)?.settings.arguments as int;
    // if (verses.isEmpty && isLoading) {
    //   final args = ModalRoute.of(context)?.settings.arguments as int;
    //   loadQuranFile(args);
    // }
  }

  // Future<void> loadQuranFile(int suraNumber) async {
  //   try {
  //     final loadedVerses = await LoadFilesHelper.loadQuranFile(suraNumber: suraNumber);
  //     if (mounted) {
  //       setState(() {
  //         verses = loadedVerses;
  //         isLoading = false;
  //       });
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       log('Error loading Quran file: $e', name: 'QuranDetailsScreen');
  //     }
  //     if (mounted) {
  //       setState(() {
  //         isLoading = false;
  //       });
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)?.settings.arguments as int;
    final headlineSmall = Theme.of(
      context,
    ).textTheme.headlineSmall?.copyWith(color: AppColors.gold);
    final titleLarge = Theme.of(context).textTheme.titleLarge;
    if (verses.isEmpty) {
      // LoadFilesHelper.loadQuranFile(suraNumber: args, verses: verses);
      loadQuranFile(suraNumber: args);
    }
    if (verses2.isEmpty) {
      loadQuranFile2(suraNumber: args);
    }
    return Scaffold(
      appBar: AppBarWidget(
        index: args,
        onPressed: () {
          showSuraContentFormated = !showSuraContentFormated;
          setState(() {});
        },
      ),
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
                  QuranResources.arabicQuranSurahList[args],
                  style: headlineSmall,
                ),
                const Spacer(),
                Image.asset(AppImages.imgRightCorner),
              ],
            ),
          ),
          showSuraContentFormated
              ? Expanded(
                  child: verses2.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : SingleChildScrollView(
                          padding: EdgeInsets.symmetric(horizontal: res.w(20)),
                          physics: const BouncingScrollPhysics(),
                          child: Text(
                            verses2,
                            style: titleLarge?.copyWith(height: 2),
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                )
              : Expanded(
                  child: verses.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: res.w(20)),
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return SuraContentWidget(
                              content: verses[index],
                              lineNum: index,
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(height: res.h(8)),
                          itemCount: verses.length,
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

  Future<void> loadQuranFile({required int suraNumber}) async {
    final String filePath = '${AppFiles.quranFiles}${suraNumber + 1}.txt';
    final String content = await rootBundle.loadString(filePath);
    final List<String> lines = content.split('\n');
    for (int i = 0; i < lines.length; i++) {
      if (kDebugMode) {
        log(lines[i], name: 'Quran File');
      }
    }
    verses = lines;
    Future.delayed(const Duration(seconds: 1), () => setState(() {}));
  }

  Future<void> loadQuranFile2({required int suraNumber}) async {
    final String filePath = '${AppFiles.quranFiles}${suraNumber + 1}.txt';
    final String content = await rootBundle.loadString(filePath);
    final List<String> lines = content.split('\n');
    for (int i = 0; i < lines.length; i++) {
      lines[i] += '[${i + 1}]';
    }

    verses2 = lines.join(' ');
    print(verses2);
    Future.delayed(const Duration(seconds: 1), () => setState(() {}));
  }
}
