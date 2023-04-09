# Tinder with Chuck Norris

A Flatter app that shows jokes from <a href="https://api.chucknorris.io/" target="_blank" style="color:#ED1543;">chucknorris.io</a> that change by tapping a button.

![Title (800 x 500 px)](https://github.com/Alyona-art/Tinder-with-Chuck-Norris-App/blob/main/screenshots/head.png)

## Description

This Flutter application was made as part of the "Cross-platform Mobile Development with Flutter" course. The app receives the joke via json, displays it on the card along with a randomly selected image from local storage. The "like" and "dislike" buttons show the next joke, the "like" button also adds the joke to favorites, which can be viewed on the favorites page.

``main()`` class run the app - ``MyApp()`` class. This class overrides ``colorScheme``, and starts app with home page -  ``MainPage()``.

``MyAppState()`` notifies other classes of changes. It contains methods for getting the next joke (``getNext()``), next image (``getImage()``), adding and removing favorites (``toggleFavorite()`` and ``removeFavorite()``).

The ``Joke()`` class represents the information about the joke from json. I used ``http.dart`` and ``json_serializable`` to get and handle information.

``MainPage()`` contains ``BottomNavigationBar`` that switches pages between ``SettingsPage()``, ``HomePage()`` and ``FavoritesPage()``. 

``HomePage()`` contains ``BigCard()`` with joke and image, "like" and "dislike" buttons. I used ``Riverpod`` for state-management. Information for the card is taken from ``jokeDataProvider`` and ``imageProvider``.

``FavoritesPage()`` contains the list of favorites (``JokeCard()`` class) that it receives from ``jokeLocalRepositoryProvider``. Next to each item is a delete icon to remove the joke. I use ``Hive`` for persisting of favourite jokes.

To separate UI files from logic files I used the following architecture pattern


```
└──lib
   ├──data 
   ├──domain
   │  ├──models
   │  ├──providers
   │  └──repositories
   └──presentation
      └──components
```
      

## Screenshots

<table width="100%">
  <tbody>
    <tr>
      <td width="1%"><img src="https://github.com/Alyona-art/Tinder-with-Chuck-Norris-App/blob/main/screenshots/v2_1.png"/></td>
      <td width="1%"><img src="https://github.com/Alyona-art/Tinder-with-Chuck-Norris-App/blob/main/screenshots/v2_2.png"/></td>
      <td width="1%"><img src="https://github.com/Alyona-art/Tinder-with-Chuck-Norris-App/blob/main/screenshots/v2_3.png"/></td>
    </tr>
  </tbody>
</table>

## APK

<a href="https://drive.google.com/drive/folders/1SDB9YVoiZCUS-WUX3-SvLC-OygzMsANu?usp=sharing">Download APK</a>
