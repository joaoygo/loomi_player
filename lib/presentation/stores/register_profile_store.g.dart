// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterProfileStore on _RegisterProfileStore, Store {
  late final _$userNameAtom =
      Atom(name: '_RegisterProfileStore.userName', context: context);

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  late final _$profileImageAtom =
      Atom(name: '_RegisterProfileStore.profileImage', context: context);

  @override
  String get profileImage {
    _$profileImageAtom.reportRead();
    return super.profileImage;
  }

  @override
  set profileImage(String value) {
    _$profileImageAtom.reportWrite(value, super.profileImage, () {
      super.profileImage = value;
    });
  }

  late final _$getUserAsyncAction =
      AsyncAction('_RegisterProfileStore.getUser', context: context);

  @override
  Future<String> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  late final _$saveUserAsyncAction =
      AsyncAction('_RegisterProfileStore.saveUser', context: context);

  @override
  Future<void> saveUser(String uid, String email) {
    return _$saveUserAsyncAction.run(() => super.saveUser(uid, email));
  }

  late final _$clearUserAsyncAction =
      AsyncAction('_RegisterProfileStore.clearUser', context: context);

  @override
  Future<void> clearUser() {
    return _$clearUserAsyncAction.run(() => super.clearUser());
  }

  late final _$_RegisterProfileStoreActionController =
      ActionController(name: '_RegisterProfileStore', context: context);

  @override
  void setUserName(String name) {
    final _$actionInfo = _$_RegisterProfileStoreActionController.startAction(
        name: '_RegisterProfileStore.setUserName');
    try {
      return super.setUserName(name);
    } finally {
      _$_RegisterProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProfileImage(String imagePath) {
    final _$actionInfo = _$_RegisterProfileStoreActionController.startAction(
        name: '_RegisterProfileStore.setProfileImage');
    try {
      return super.setProfileImage(imagePath);
    } finally {
      _$_RegisterProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userName: ${userName},
profileImage: ${profileImage}
    ''';
  }
}
