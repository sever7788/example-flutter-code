import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:timezo/app/app.dart';
import 'package:timezo/firebase/analytics.dart';
import 'package:timezo/constants/constants.dart';

import '../../my_icon.dart';
import 'widget_not_adding_text.dart';
import '../../modals/modal_with_buttons.dart';

class NotAddWidget extends StatelessWidget {
  const NotAddWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final Color iconColor = Theme.of(context).colorScheme.onTertiary;

    return GestureDetector(
      onTap: () {
        ModalRouter.showDialogBlur(
          context,
          barrierLabel: 'NO-ADD-WIDGET',
          child: ModalWithButtons(
            title: localization.not_adding,
            textAgree: localization.allow,
            textCancel: localization.close,
            widgetAfterSubtitle: const WidgetNotAddingText(),
            onCancel: () => Navigator.of(context).pop(),
            onAgree: () async {
              const MethodChannel channel = MethodChannel('flutter.dev/timezo');

              try {
                await channel.invokeMethod('openSettings');
              } on PlatformException catch (_) {}
            },
          ),
        );
        sendEvent(eventName: 'widget_screen_not_adding');
      },
      child: Container(
        height: s46,
        width: s46,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [CustomColors.yellowDark, CustomColors.yellowLight],
          ),
        ),
        child: MyIcon(iconName: IconNames.query, color: iconColor),
      ),
    );
  }
}
