import 'package:flutter/material.dart';

import 'package:timezo/app/app.dart';
import 'package:timezo/data/models/models.dart';

List<WidgetThemeAndroid> widgetThemes = [
  WidgetThemeAndroid(
    themeName: 'dark',
    color: CustomColors.widgetDark,
    widgetColor: CustomColors.barrierColor,
    textColor: CustomColors.widgetLight,
    subtextColor: Colors.white.withOpacity(.6),
    separatorColor: CustomColors.widgetGreySP,
    moonIconColor: CustomColors.widgetLight,
  ),
  WidgetThemeAndroid(
    themeName: 'light',
    color: Colors.white,
    textColor: CustomColors.dark,
    subtextColor: Colors.black.withOpacity(.5),
    moonIconColor: CustomColors.dark,
    separatorColor: CustomColors.lightGrey,
  ),
  WidgetThemeAndroid(
    themeName: 'yellow',
    color: CustomColors.widgetYellow,
    textColor: CustomColors.dark,
    subtextColor: Colors.black.withOpacity(.5),
    sunIconColor: CustomColors.dark,
    moonIconColor: CustomColors.dark,
    separatorColor: CustomColors.widgetGreySP,
  ),
  WidgetThemeAndroid(
    themeName: 'purple',
    color: CustomColors.widgetPurple,
    textColor: Colors.white,
    subtextColor: Colors.white.withOpacity(.6),
    sunIconColor: CustomColors.widgetYellow,
    moonIconColor: CustomColors.widgetLight,
    separatorColor: Colors.white,
  ),
  WidgetThemeAndroid(
    themeName: 'blue',
    color: CustomColors.widgetBlue,
    textColor: Colors.white,
    subtextColor: Colors.white.withOpacity(.6),
    sunIconColor: CustomColors.widgetYellow,
    moonIconColor: CustomColors.widgetLight,
    separatorColor: Colors.white,
  ),
  const WidgetThemeAndroid(
    themeName: 'sky',
    imagePath: 'android/app/src/main/res/drawable/sky.webp',
  ),
  const WidgetThemeAndroid(
    themeName: 'sunset',
    imagePath: 'android/app/src/main/res/drawable/sunset.webp',
  ),
  const WidgetThemeAndroid(
    themeName: 'twigs',
    imagePath: 'android/app/src/main/res/drawable/twigs.webp',
  ),
  const WidgetThemeAndroid(
    themeName: 'surfboards',
    imagePath: 'android/app/src/main/res/drawable/surfboards.webp',
  ),
  const WidgetThemeAndroid(
    themeName: 'river',
    imagePath: 'android/app/src/main/res/drawable/river.webp',
  ),
  const WidgetThemeAndroid(
    themeName: 'sand_mountains',
    imagePath: 'android/app/src/main/res/drawable/sand_mountains.webp',
  ),
  const WidgetThemeAndroid(
    themeName: 'oasis',
    imagePath: 'android/app/src/main/res/drawable/oasis.webp',
  ),
  const WidgetThemeAndroid(
    themeName: 'night',
    imagePath: 'android/app/src/main/res/drawable/night.webp',
  ),
  const WidgetThemeAndroid(
    themeName: 'bushes',
    imagePath: 'android/app/src/main/res/drawable/bushes.webp',
  ),
  const WidgetThemeAndroid(
    themeName: 'koi_fish',
    imagePath: 'android/app/src/main/res/drawable/koi_fish.webp',
  ),
  const WidgetThemeAndroid(
    themeName: 'painted_flower',
    imagePath: 'android/app/src/main/res/drawable/painted_flower.webp',
  ),
  const WidgetThemeAndroid(
    themeName: 'jasmine',
    imagePath: 'android/app/src/main/res/drawable/jasmine.webp',
  ),
  const WidgetThemeAndroid(
    themeName: 'hibiscus',
    imagePath: 'android/app/src/main/res/drawable/hibiscus.webp',
  ),
  const WidgetThemeAndroid(
    themeName: 'hearts_handdraw',
    imagePath: 'android/app/src/main/res/drawable/hearts_handdraw.webp',
  ),
  const WidgetThemeAndroid(
    themeName: 'couple',
    imagePath: 'android/app/src/main/res/drawable/couple.webp',
  ),
  const WidgetThemeAndroid(
    themeName: 'cotton_flower',
    imagePath: 'android/app/src/main/res/drawable/cotton_flower.webp',
  ),
  const WidgetThemeAndroid(
    themeName: 'christmas_food',
    imagePath: 'android/app/src/main/res/drawable/christmas_food.webp',
  ),
  const WidgetThemeAndroid(
    themeName: 'bird_patterns',
    imagePath: 'android/app/src/main/res/drawable/bird_patterns.webp',
  ),
  const WidgetThemeAndroid(
    themeName: 'beach',
    imagePath: 'android/app/src/main/res/drawable/beach.webp',
  ),
  const WidgetThemeAndroid(
    themeName: 'gradient_leaves',
    imagePath: 'android/app/src/main/res/drawable/gradient_leaves.webp',
  ),
  const WidgetThemeAndroid(
    themeName: 'leaves',
    imagePath: 'android/app/src/main/res/drawable/leaves.webp',
  ),
];
