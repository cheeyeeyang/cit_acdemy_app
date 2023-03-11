import 'package:cit_academy_app/customs/app_color.dart';
import 'package:cit_academy_app/widgets/custom_widget.dart';
import 'package:cit_academy_app/widgets/responsive.dart';
import 'package:flutter/material.dart';

class DropDownWidget<T> extends StatelessWidget {
  const DropDownWidget({
    Key? key,
    required this.fixSize,
    required this.appColor,
    required this.value,
    required this.hint,
    required this.listMenuItems,
    required this.onChange,
    this.margin,
  }) : super(key: key);

  final double fixSize;
  final Color appColor;
  final dynamic value;
  final String hint;
  final Function(dynamic) onChange;
  final List<DropdownMenuItem> listMenuItems;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveWidget.isSmallScreen(context) ? 40 : 50,
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(width: 1.5, color: AppColor().thirdColor),
        color: Colors.white,
      ),
      child: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
              isDense: true,
              value: value,
              isExpanded: true,
              icon: const Icon(Icons.arrow_drop_down,
                  color: Colors.grey, size: 25),
              items: listMenuItems,
              onChanged: onChange,
              hint: CustomWidget(text: hint, fontSize: 14)),
        ),
      ),
    );
  }
}
