import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/joke.dart';
import '../../domain/providers/repository_provider.dart';

class JokeCard extends ConsumerWidget {
  const JokeCard({
    super.key,
    required this.joke,
  });

  final Joke joke;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jokesRepository =
        ref.read(RepositoriesProviders.jokeLocalRepositoryProvider);

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
              jokesRepository.delete(joke.id);
            },
          ),
          title: Text(
            joke.value,
            style: style,
          ),
        ),
      ),
    );
  }
}
