import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('${bloc.runtimeType} $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint('${bloc.runtimeType} $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    debugPrint('${bloc.runtimeType} $error');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    debugPrint('${bloc.runtimeType} closed');
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint('${bloc.runtimeType} created');
  }
}
