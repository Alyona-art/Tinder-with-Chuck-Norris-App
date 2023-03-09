# Tinder with Chuck Norris

A Flatter app that shows jokes from <a href="https://api.chucknorris.io/" target="_blank" style="color:#ED1543;">chucknorris.io</a> that change by tapping a button.

![Title (800 x 500 px)](https://github.com/Alyona-art/Tinder-with-Chuck-Norris-App/blob/main/screenshots/head.png)

## Description

This Flutter application was made as part of the "Cross-platform Mobile Development with Flutter" course. The app receives the joke via json, displays it on the card along with a randomly selected image from local storage. The "like" and "dislike" buttons show the next joke, the "like" button also adds the joke to favorites, which can be viewed on the favorites page.

``main()`` class run the app - ``MyApp()`` class. This class creates ``MyAppState()``, overrides ``colorScheme``, and sets ``StartingPage()`` as the default route where the app is started.

``MyAppState()`` notifies other classes of changes. It contains methods for getting the next joke (``getNext()``), next image (``getImage()``), adding and removing favorites (``toggleFavorite()`` and ``removeFavorite()``).

The ``Joke()`` class represents the information about the joke from json. I used ``http.dart`` and ``json_serializable`` to get and handle information.

``StartingPage()`` contains a small description and a "start" button, clicking on which triggers a new joke and image and creates a ``HomePage()`` based on the ``context``.

``HomePage()`` has a Bottom navigation bar that can call an ``AlertDialog`` with project information, a ``GeneratorPage()`` home page, and a ``FavoritesPage()`` joke page.

``GeneratorPage()`` contains ``BigCard()`` with joke and image, "like" and "dislike" buttons

``FavoritesPage()`` contains the list of favorites (``JokeCard()`` class) that it receives from ``MyAppState()``. Next to each item is a delete icon to remove the joke.


## Screenshots

<table width="100%">
  <tbody>
    <tr>
      <td width="1%"><img src="https://github.com/Alyona-art/Tinder-with-Chuck-Norris-App/blob/main/screenshots/1.png"/></td>
      <td width="1%"><img src="https://github.com/Alyona-art/Tinder-with-Chuck-Norris-App/blob/main/screenshots/2.png"/></td>
      <td width="1%"><img src="https://github.com/Alyona-art/Tinder-with-Chuck-Norris-App/blob/main/screenshots/3.png"/></td>
    </tr>
    <tr>
      <td width="1%"><img src="https://github.com/Alyona-art/Tinder-with-Chuck-Norris-App/blob/main/screenshots/4.png"/></td>
      <td width="1%"><img src="https://github.com/Alyona-art/Tinder-with-Chuck-Norris-App/blob/main/screenshots/5.png"/></td>
      <td width="1%"><img src="https://github.com/Alyona-art/Tinder-with-Chuck-Norris-App/blob/main/screenshots/6.png"/></td>
    </tr>
  </tbody>
</table>

## APK

<a href="https://drive.google.com/drive/folders/1Kc8N1yZvA9fbxPK6YsPIo-Fqbszjt6KE?usp=share_link" target="_blank" style="color:#ED1543;">Download APK</a>
