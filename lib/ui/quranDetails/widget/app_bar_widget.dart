import 'package:flutter/material.dart';

import '../../../core/utils/responsive.dart';
import '../../../model/quran_resources.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final int index;
  final void Function()? onPressed;

  const AppBarWidget({super.key, required this.index, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final res = Responsive(context);
    return AppBar(
      toolbarHeight: res.h(80),
      title: Text(QuranResources.englishQuranSurahList[index]),
      actions: [
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.table_rows_outlined),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
