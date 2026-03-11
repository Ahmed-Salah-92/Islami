import 'package:flutter/material.dart';

import '../../../core/resources/values/app_strings.dart';
import '../../../core/utils/responsive.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final int index;
  final String title;

   const AppBarWidget.hadethDetails({super.key, required this.index,this.title = AppStrings.hadith});


  @override
  Widget build(BuildContext context) {
    final res = Responsive(context);
    return AppBar(
      toolbarHeight: res.h(80),
      title: Text('$title $index'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
