import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'MyAppState.dart';

class JokeCard extends StatelessWidget {
  const JokeCard({
    super.key,
    required this.joke,
  });

  final String joke;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var theme = Theme.of(context);
    var style = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontFamily: 'ZillaSlab',
      fontSize: 20,
    );

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: theme.colorScheme.primary,
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListTile(
          leading: IconButton(
            icon: Icon(Icons.delete_outline, semanticLabel: 'Delete'),
            color: theme.colorScheme.onPrimary,
            iconSize: 32,
            onPressed: () {
              appState.removeFavorite(joke);
            },
          ),
          title: Text(
            joke,
            style: style,
          ),
        ),
      ),
    );
  }
}
