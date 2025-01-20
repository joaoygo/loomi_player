// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on LoginStoreBase, Store {
  late final _$userAtom = Atom(name: 'LoginStoreBase.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'LoginStoreBase.isLoading', context: context);

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

  late final _$errorMessageAtom =
      Atom(name: 'LoginStoreBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$isProfileSetupRequiredAtom =
      Atom(name: 'LoginStoreBase.isProfileSetupRequired', context: context);

  @override
  bool get isProfileSetupRequired {
    _$isProfileSetupRequiredAtom.reportRead();
    return super.isProfileSetupRequired;
  }

  @override
  set isProfileSetupRequired(bool value) {
    _$isProfileSetupRequiredAtom
        .reportWrite(value, super.isProfileSetupRequired, () {
      super.isProfileSetupRequired = value;
    });
  }

  late final _$loginWithGoogleAsyncAction =
      AsyncAction('LoginStoreBase.loginWithGoogle', context: context);

  @override
  Future<void> loginWithGoogle() {
    return _$loginWithGoogleAsyncAction.run(() => super.loginWithGoogle());
  }

  late final _$loginWithEmailPasswordAsyncAction =
      AsyncAction('LoginStoreBase.loginWithEmailPassword', context: context);

  @override
  Future<void> loginWithEmailPassword(String email, String password) {
    return _$loginWithEmailPasswordAsyncAction
        .run(() => super.loginWithEmailPassword(email, password));
  }

  late final _$logoutAsyncAction =
      AsyncAction('LoginStoreBase.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  @override
  String toString() {
    return '''
user: ${user},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
isProfileSetupRequired: ${isProfileSetupRequired}
    ''';
  }
}
