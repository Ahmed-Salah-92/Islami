import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/resources/assets/app_icons.dart';
import '../../core/resources/assets/app_images.dart';
import '../../core/resources/styles/app_colors.dart';
import '../../core/resources/values/app_strings.dart';
import '../../core/utils/responsive.dart';
import 'tabs/hadeth/hadeth_tab.dart';
import 'tabs/quran/quran_tab.dart';
import 'tabs/radio/radio_tab.dart';
import 'tabs/sebiha/sebiha_tab.dart';
import 'tabs/time/time_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Responsive res;
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    res = Responsive(context);
  }

  List<String> bgImages = [
    AppImages.quranBg,
    AppImages.hadithBg,
    AppImages.sebihaBg,
    AppImages.radioBg,
    AppImages.timeBg,
  ];

  List<Widget> tabs = [
    const QuranTab(),
    const HadethTab(),
    const SebihaTab(),
    const RadioTab(),
    const TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          bgImages[selectedIndex],
          width: .infinity,
          height: .infinity,
          fit: .cover,
          color: AppColors.black70,
          colorBlendMode: .darken,
        ),
        Scaffold(
          backgroundColor: AppColors.transparent,
          appBar: AppBar(toolbarHeight: res.h(30)),
          body: Column(
            spacing: res.h(21),
            children: [
              Image.asset(
                AppImages.imgHeader,
                width: res.w(299),
                height: res.h(141),
              ),
              Expanded(child: tabs[selectedIndex]),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: [
              buildBottomNavBarItem(
                index: 0,
                iconName: AppIcons.icQuran,
                label: AppStrings.quran,
              ),
              buildBottomNavBarItem(
                index: 1,
                iconName: AppIcons.icHadith,
                label: AppStrings.hadith,
              ),
              buildBottomNavBarItem(
                index: 2,
                iconName: AppIcons.icSebiha,
                label: AppStrings.sebiha,
              ),
              buildBottomNavBarItem(
                index: 3,
                iconName: AppIcons.icRadio,
                label: AppStrings.radio,
              ),
              buildBottomNavBarItem(
                index: 4,
                iconName: AppIcons.icTime,
                label: AppStrings.time,
              ),
            ],
          ),
        ),
      ],
    );
  }

  BottomNavigationBarItem buildBottomNavBarItem({
    required int index,
    required String iconName,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: bottomNavBarIcon(index: index, iconName: iconName),
      label: label,
    );
  }

  Widget bottomNavBarIcon({required int index, required String iconName}) {
    return selectedIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(
              horizontal: res.w(20),
              vertical: res.h(6),
            ),
            decoration: BoxDecoration(
              color: AppColors.black60,
              borderRadius: BorderRadius.circular(res.w(66)),
            ),
            child: SvgPicture.asset(
              iconName,
              width: res.w(25),
              height: res.h(25),
              colorFilter: const ColorFilter.mode(
                AppColors.white,
                BlendMode.srcIn,
              ),
            ),
          )
        : SvgPicture.asset(iconName);
  }
}
