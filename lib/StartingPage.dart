import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'HomePage.dart';
import 'MyAppState.dart';

class StartingPage extends StatelessWidget {
  const StartingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var theme = Theme.of(context);
    var headTextStyle = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.primary,
      fontFamily: 'ZillaSlab',
      fontSize: 42,
    );

    var strokeStyle = theme.textTheme.displaySmall!.copyWith(
      fontFamily: 'ZillaSlab',
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
      foreground: Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5
        ..color = Color.fromARGB(255, 0, 0, 0),
    );
    var textStyle = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontFamily: 'ZillaSlab',
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
    );

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: 50),
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/chucknorris_logo.png',
                        width: 400),
                    SizedBox(height: 20),
                    Text(
                      'Tinder with Chuck Norris',
                      style: headTextStyle,
                    ),
                    SizedBox(height: 10),
                    Text('Find your favorite Chuck Norris facts!'),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        appState.getNext();
                        appState.getImage();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                            horizontal: 70.0, vertical: 30.0)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered)) {
                              return theme.colorScheme.secondary;
                            }
                            return theme.colorScheme.primary;
                          },
                        ),
                      ),
                      child: Stack(
                        children: [
                          Text(
                            'START',
                            style: strokeStyle,
                          ),
                          Text(
                            'START',
                            style: textStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
