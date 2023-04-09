import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_page.dart';
import 'favorites_page.dart';
import '../domain/providers/navigator_provider.dart';
import 'settings_page.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  static final List<Widget> _widgetOptions = <Widget>[
    SettingsPage(),
    HomePage(),
    FavoritesPage()
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var headTextStyle = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.primary,
      fontFamily: 'ZillaSlab',
      fontSize: 26,
      fontWeight: FontWeight.bold,
    );
    var navigatorIndex = ref.watch(navigatorProvider);

    return Scaffold(
      appBar: AppBar(
        title: Expanded(
          child: Row(
            children: [
              Text(
                'Tinder with ',
                style: headTextStyle,
              ),
              SizedBox(width: 10),
              Image.asset('assets/images/chuck_text.png', width: 150),
            ],
          ),
        ),
        backgroundColor: theme.colorScheme.primaryContainer,
      ),
      body: Center(
        child: _widgetOptions[navigatorIndex.index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigatorIndex.index,
        onTap: (value) {
          ref.read(navigatorProvider.notifier).onIndexChanged(value);
        },
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: theme.colorScheme.primaryContainer,
        items: const [
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
      ),
      backgroundColor: theme.colorScheme.background,
    );
  }
}
