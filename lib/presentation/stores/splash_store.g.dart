// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashStore on SplashStoreBase, Store {
  late final _$isAuthenticatedAtom =
      Atom(name: 'SplashStoreBase.isAuthenticated', context: context);

  @override
  bool get isAuthenticated {
    _$isAuthenticatedAtom.reportRead();
    return super.isAuthenticated;
  }

  @override
  set isAuthenticated(bool value) {
    _$isAuthenticatedAtom.reportWrite(value, super.isAuthenticated, () {
      super.isAuthenticated = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'SplashStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$initializeAppAsyncAction =
      AsyncAction('SplashStoreBase.initializeApp', context: context);

  @override
  Future<void> initializeApp() {
    return _$initializeAppAsyncAction.run(() => super.initializeApp());
  }

  @override
  String toString() {
    return '''
isAuthenticated: ${isAuthenticated},
isLoading: ${isLoading}
    ''';
  }
}
