import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'MyAppState.dart';
import 'BigCard.dart';

class GeneratorPage extends StatefulWidget {
  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
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
                  child: BigCard(joke: appState.current)),
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
                      appState.getNext();
                      appState.getImage();
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
                      appState.toggleFavorite(appState.current);
                      appState.getNext();
                      appState.getImage();
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
