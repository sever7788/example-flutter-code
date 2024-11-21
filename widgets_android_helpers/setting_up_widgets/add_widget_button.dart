import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:timezo/app/app.dart';
import 'package:timezo/bloc/bloc.dart';
import 'package:timezo/firebase/analytics.dart';
import 'package:timezo/constants/constants.dart';
import 'package:timezo/screens/widgets_android_screen/widget_theme_state.dart';

import '../../my_icon.dart';
import '../../custom_button.dart';
import '../../modals/modal_ads_premium.dart';
import '../../modals/small_modal.dart';

class AddWidgetButton extends StatefulWidget {
  const AddWidgetButton({super.key});

  @override
  State<AddWidgetButton> createState() => _AddWidgetButtonState();
}

class _AddWidgetButtonState extends State<AddWidgetButton> {
  bool get premium => BlocProvider.of<PurchasesBloc>(context).state.premium;

  WidgetThemeState get widgetThemeState => WidgetThemeState.of(context);

  void installWidget() {
    sendEvents();
    if (!premium) {
      ModalRouter.showModalWithIndicator(
        context: context,
        child: ModalAdsPremium(eventFBPlace: 'install_widget', result: () => createWidget(context)),
      );
    } else {
      createWidget(context);
    }
  }

  void sendEvents() {
    sendEvent(eventName: 'set_widget_name_${widgetThemeState.selectedWidgetName.name}');
    sendEvent(eventName: 'set_widget_theme_${widgetThemeState.selectedTheme.themeName}');
    sendEvent(
        eventName: 'set_widget_opacity_${widgetThemeState.widgetOpacity < 0.5 ? 'less' : 'more'}');
  }

  void createWidget(BuildContext context) async {
    const MethodChannel channel = MethodChannel('flutter.dev/timezo');

    try {
      await channel.invokeMethod('createShortcutWidget', {
        'widgetName': widgetThemeState.selectedWidgetName.name,
        'themeName': widgetThemeState.selectedTheme.themeName,
        'opacity': (255 * widgetThemeState.widgetOpacity).round().toString(),
      }).then((value) {
        if (kDebugMode) print('Result: $value');

        showResult(isError: value != true);
      }).onError((error, stackTrace) {
        showResult(isError: true);
        throw stackTrace;
      });
    } on PlatformException {
      showResult(isError: true);
    }
  }

  void showResult({bool isError = false}) {
    final localization = AppLocalizations.of(context)!;

    final String title = isError ? localization.ups : localization.done;
    final String message =
        isError ? localization.add_widget_error_message : localization.add_widget_done_message;

    ModalRouter.showDialogBlur(context,
        barrierLabel: 'ADD-WIDGET',
        child: SmallModal(
          title: title,
          message: message,
          buttonText: localization.ok,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final Color color = Theme.of(context).colorScheme.onTertiary;

    return CustomButton(
      height: s46,
      radius: s36,
      type: ButtonTypes.gradient,
      onTap: installWidget,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!premium)
            Container(
              margin: EdgeInsets.only(right: s8),
              child: MyIcon(iconName: IconNames.smartDisplay, color: color),
            ),
          Text(
            localization.install,
            style: TextStyles.caption2.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
