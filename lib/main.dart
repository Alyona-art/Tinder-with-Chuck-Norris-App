import 'package:chuck_norris_app/my_app.dart';
import 'package:chuck_norris_app/domain/providers/repository_provider.dart';
import 'package:chuck_norris_app/domain/providers/state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Future<void> _initHive() async {
    final dir = await path.getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }

  await _initHive();

  await RepositoriesProviders.init();
  await JokeStateProvider.init();
  runApp(ProviderScope(child: MyApp()));
}
