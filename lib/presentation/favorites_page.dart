import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/providers/repository_provider.dart';
import 'components/joke_card.dart';

class FavoritesPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites =
        ref.read(RepositoriesProviders.jokeLocalRepositoryProvider);

    var theme = Theme.of(context);
    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.secondary,
      fontFamily: 'ZillaSlab',
      fontWeight: FontWeight.bold,
      fontSize: 28,
    );

    if (favorites.getAll().isEmpty) {
      return Center(
        child: Text(
          'No favorites yet.',
          style: style,
        ),
      );
    }

    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text(
                'You have '
                '${favorites.getAll().length} favorites:',
                style: style,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  for (var joke in favorites.getAll()) JokeCard(joke: joke)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
