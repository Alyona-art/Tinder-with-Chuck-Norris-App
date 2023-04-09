import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/providers/repository_provider.dart';
import 'components/big_card.dart';
import '../domain/models/joke.dart';
import '../domain/providers/favorites_provider.dart';
import '../domain/providers/image_provider.dart';
import '../domain/providers/joke_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final joke = ref.watch(jokeDataProvider);
    final image = ref.watch(imageProvider);
    Joke jokeData = Joke(id: "", url: "", value: "");

    final jokesRepository =
        ref.read(RepositoriesProviders.jokeLocalRepositoryProvider);
    var theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                width: 500,
                height: 600,
                child: joke.when(
                    data: (joke) {
                      jokeData = joke;
                      return BigCard(joke: joke.value, image: image);
                    },
                    error: (err, s) => Text(err.toString()),
                    loading: () => const Center(
                          child: CircularProgressIndicator(),
                        )),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      ref.read(jokeDataProvider.notifier).fetch(ref);
                      ref.read(imageProvider.notifier).getImage();
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: 70.0, vertical: 30.0)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return theme.colorScheme.primary.withOpacity(0.5);
                          }
                          return theme.colorScheme.primary;
                        },
                      ),
                    ),
                    child: Icon(
                      Icons.thumb_down_outlined,
                      size: 48,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      ref.read(favoritesProvider.notifier).add(jokeData);
                      jokesRepository.add(jokeData);
                      ref.read(jokeDataProvider.notifier).fetch(ref);
                      ref.read(imageProvider.notifier).getImage();
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: 70.0, vertical: 30.0)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return theme.colorScheme.secondary.withOpacity(0.5);
                          }
                          return theme.colorScheme.secondary;
                        },
                      ),
                    ),
                    child: Icon(Icons.favorite_border_outlined,
                        size: 48, color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
