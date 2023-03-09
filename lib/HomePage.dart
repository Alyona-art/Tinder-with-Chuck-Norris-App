import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'FavoritesPage.dart';
import 'GeneratorPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex = 1;

  static List<Widget> _widgetOptions = <Widget>[
    GeneratorPage(),
    GeneratorPage(),
    FavoritesPage(),
  ];

  void _onItemTapped(int index) {
    var previousIndex = _selectedIndex;

    if (index == 0) {
      var theme = Theme.of(context);
      var style = theme.textTheme.displayMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontFamily: 'ZillaSlab',
        fontSize: 20,
      );
      var headTextStyle = theme.textTheme.displaySmall!.copyWith(
        color: theme.colorScheme.primary,
        fontFamily: 'ZillaSlab',
        fontSize: 30,
        fontWeight: FontWeight.bold,
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: FractionalOffset.topRight,
                  child: IconButton(
                    onPressed: () => {
                      setState(() {
                        _selectedIndex = previousIndex;
                      }),
                      Navigator.pop(context, 'Close')
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
                Text(
                  'About me',
                  style: headTextStyle,
                ),
              ],
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Hello! \nI\'m Alyona, developer of this app. '
                    'This is just study project, so don\'t expect much. '
                    'But still I tried my best.\n'),
                const Text('You can contact me via email or telegram:'),
                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Email',
                        style: style,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            const mailUrl =
                                'mailto:a.artemeva@innopolis.university';
                            final uri = Uri.parse(mailUrl);
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(uri);
                            }
                          },
                      ),
                      TextSpan(
                        text: '      ',
                      ),
                      TextSpan(
                        text: 'Telegram',
                        style: style,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            const url = 'http://t.me/Art_libra';
                            final uri = Uri.parse(url);
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(uri);
                            }
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(2.0))),
          );
        },
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var headTextStyle = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.primary,
      fontFamily: 'ZillaSlab',
      fontSize: 30,
      fontWeight: FontWeight.bold,
    );

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                'Tinder with ',
                style: headTextStyle,
              ),
              SizedBox(width: 10),
              Image.asset('assets/images/chuck_text.png', width: 200),
            ],
          ),
        ),
        body: Row(
          children: [
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'About me',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      );
    });
  }
}
