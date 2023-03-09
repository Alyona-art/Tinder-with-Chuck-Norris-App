import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'MyAppState.dart';
import 'JokeCard.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var theme = Theme.of(context);
    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.secondary,
      fontFamily: 'ZillaSlab',
      fontWeight: FontWeight.bold,
      fontSize: 28,
    );

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text(
          'No favorites yet.',
          style: style,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Text(
            'You have '
            '${appState.favorites.length} favorites:',
            style: style,
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              for (var joke in appState.favorites) JokeCard(joke: joke)
            ],
          ),
        ),
      ],
    );
  }
}
