import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:timezo/app/app.dart';
import 'package:timezo/utils/utils.dart';
import 'package:timezo/constants/constants.dart';

class WidgetNotAddingText extends StatelessWidget {
  const WidgetNotAddingText({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    final TextStyle textStyle = TextStyles.subtitle0.copyWith(color: CustomColors.lightGrey);
    const TextStyle textStyleBold = TextStyle(fontWeight: FontWeight.w700);

    final List<String> firstText = localization.how_to_add_widget.split(kAppName);
    final List<String> text = [firstText[0], ...firstText[1].split(kBtnText)];

    return Flexible(
      child: RawScrollbar(
        thumbVisibility: true,
        radius: Radius.circular(s4),
        thumbColor: Colors.black.withOpacity(.05),
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView(
            shrinkWrap: true,
            children: [
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  style: textStyle,
                  children: [
                    TextSpan(text: text[0]),
                    const TextSpan(text: kAppName, style: textStyleBold),
                    TextSpan(text: text[1]),
                    TextSpan(text: localization.text_btn_allow, style: textStyleBold),
                    TextSpan(text: text[2]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
