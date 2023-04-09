import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var headTextStyle = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.primary,
      fontFamily: 'ZillaSlab',
      fontSize: 26,
      fontWeight: FontWeight.bold,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "In progress",
            style: headTextStyle,
          ),
        )
      ],
    );
  }
}
