import 'package:flutter/material.dart';
import 'package:takequiz/config/themes/ui_parameters.dart';

TextStyle cardTitles(context) => TextStyle(
      color: UIParamaters.isDarkMode()
          ? Theme.of(context).textTheme.bodyText1!.color
          : Theme.of(context).primaryColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

const detailText = TextStyle(fontSize: 12);
