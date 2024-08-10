import 'package:carnagef_alpha/config/theme/app_themes.dart';
import 'package:flutter/material.dart';

class BorderedButton extends StatelessWidget {

  final String? text;
  final IconData? icon;
  final Function() callback;
  final Color borderColor;
  final Color textColor;
  final Color? backgroundColor;

  const BorderedButton({
    super.key,
    this.text = "button",
    required this.icon,
    required this.callback,
    this.borderColor = AppThemes.cE2E2B6,
    this.textColor = AppThemes.cE2E2B6,
    this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: backgroundColor,
        side: BorderSide(color: borderColor),
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 4, right: 4),
      ),
      //  .copyWith(
      //   side: WidgetStateProperty.resolveWith<BorderSide?>((Set<WidgetState> states){
      //     if(states.contains(WidgetState.pressed)){
      //       return const BorderSide(
      //         color: AppThemes.c6EACDA,
      //         width: 1
      //       );
      //     }
      //
      //   })
      // ),
      onPressed: () => callback(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon),
          Text(text.toString(), style: const TextStyle(
              fontSize: 10
          )),
        ],
      )
    );
  }
}
