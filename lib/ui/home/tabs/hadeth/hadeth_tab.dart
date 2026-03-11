import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/responsive.dart';
import 'widget/hadeth_item.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    final res = Responsive(context);
    return CarouselSlider(
      options: CarouselOptions(height: res.h(618), enlargeCenterPage: true),
      items: List.generate(50, (index) => index + 1).map((index) {
        return HadethItem(index: index);
      }).toList(),
    );
  }
}
