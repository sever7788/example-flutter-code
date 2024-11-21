import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'widget_theme_state.dart';
import '../../widgets/widgets.dart';

class WidgetsAndroidScreen extends StatefulWidget {
  const WidgetsAndroidScreen({super.key});

  @override
  State<WidgetsAndroidScreen> createState() => _WidgetsAndroidScreenState();
}

class _WidgetsAndroidScreenState extends State<WidgetsAndroidScreen> {
  final PageController pageController = PageController();

  int selectedWidget = 0;

  int selectedThemeIndex = 0;
  double widgetOpacity = 0.7;

  @override
  void initState() {
    super.initState();
    pageController.addListener(pageListener);
  }

  void pageListener() {
    final int newPageIndex = pageController.page!.round().toInt();

    if (newPageIndex != selectedWidget) {
      setState(() {
        selectedWidget = newPageIndex;
      });
    }
  }

  void changeThemeIndex(int index) {
    setState(() {
      selectedThemeIndex = index;
    });
  }

  void setWidgetOpacity(double opacity) {
    setState(() {
      widgetOpacity = opacity;
    });
  }

  @override
  void dispose() {
    pageController.removeListener(pageListener);
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return SettingsTemplate(
      header: localization.adding_widget,
      top: false,
      bottom: true,
      builder: (Widget header) => WidgetThemeState(
        selectedThemeIndex: selectedThemeIndex,
        changeThemeIndex: changeThemeIndex,
        setWidgetOpacity: setWidgetOpacity,
        widgetOpacity: widgetOpacity,
        selectedWidget: selectedWidget,
        child: Column(
          children: [
            Flexible(
              flex: MediaQuery.of(context).size.height > 600 ? 19 : 15,
              child: ListWidgets(header: header, pageController: pageController),
            ),
            const Flexible(flex: 15, child: SettingUpWidgets())
          ],
        ),
      ),
    );
  }
}
