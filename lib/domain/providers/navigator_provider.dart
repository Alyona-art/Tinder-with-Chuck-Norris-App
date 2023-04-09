import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:equatable/equatable.dart';

class NavigatorStates extends Equatable {
  const NavigatorStates({this.index = 1});

  final int index;
  NavigatorStates copyWith({int? index}) {
    return NavigatorStates(index: index ?? this.index);
  }

  @override
  List<Object?> get props => [index];
}

class NavigatorNotifier extends StateNotifier<NavigatorStates> {
  NavigatorNotifier() : super(const NavigatorStates());

  void onIndexChanged(int index) {
    state = state.copyWith(index: index);
  }
}

final navigatorProvider =
    StateNotifierProvider<NavigatorNotifier, NavigatorStates>(
        (ref) => NavigatorNotifier());
