import 'package:flutter/material.dart';

import '../../../core/resources/styles/app_colors.dart';
import '../../../core/utils/responsive.dart';

class SuraContentWidget extends StatefulWidget {
  final String content;
  final int lineNum;

  const SuraContentWidget({
    super.key,
    required this.content,
    required this.lineNum,
  });

  @override
  State<SuraContentWidget> createState() => _SuraContentWidgetState();
}

class _SuraContentWidgetState extends State<SuraContentWidget> {
  late Responsive res;
  bool isSelected = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    res = Responsive(context);
  }


  @override
  Widget build(BuildContext context) {
    final titleLarge = Theme.of(context).textTheme.titleLarge;
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: res.h(10)),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.gold : AppColors.transparent,
          borderRadius: BorderRadius.circular(res.w(15)),
          border: Border.all(
            color: !isSelected ? AppColors.gold : AppColors.transparent,
            width: 2,
          ),
        ),
        child: Text(
          '${widget.content.trim()} {${widget.lineNum + 1}}',
          style: isSelected
              ? titleLarge?.copyWith(color: AppColors.black, height: 2)
              : titleLarge?.copyWith(height: 2),
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}
