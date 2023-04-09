import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.joke,
    required this.image,
  });

  final String joke;
  final String image;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.primary,
      fontFamily: 'ZillaSlab',
      fontSize: 20,
    );

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: theme.colorScheme.primaryContainer,
      surfaceTintColor: theme.colorScheme.background,
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Flexible(fit: FlexFit.loose, child: Image.asset(image)),
            SizedBox(
              height: 10,
            ),
            Text(
              joke,
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}
