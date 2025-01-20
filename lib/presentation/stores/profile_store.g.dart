// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileStore on _ProfileStore, Store {
  late final _$userAtom = Atom(name: '_ProfileStore.user', context: context);

  @override
  UserModel? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ProfileStore.isLoading', context: context);

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
      Atom(name: '_ProfileStore.errorMessage', context: context);

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

  late final _$getUserAsyncAction =
      AsyncAction('_ProfileStore.getUser', context: context);

  @override
  Future<void> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  late final _$deleteUserAsyncAction =
      AsyncAction('_ProfileStore.deleteUser', context: context);

  @override
  Future<bool> deleteUser() {
    return _$deleteUserAsyncAction.run(() => super.deleteUser());
  }

  late final _$clearUserAsyncAction =
      AsyncAction('_ProfileStore.clearUser', context: context);

  @override
  Future<void> clearUser() {
    return _$clearUserAsyncAction.run(() => super.clearUser());
  }

  late final _$getTypeAccountAsyncAction =
      AsyncAction('_ProfileStore.getTypeAccount', context: context);

  @override
  Future<bool> getTypeAccount() {
    return _$getTypeAccountAsyncAction.run(() => super.getTypeAccount());
  }

  @override
  String toString() {
    return '''
user: ${user},
isLoading: ${isLoading},
errorMessage: ${errorMessage}
    ''';
  }
}
