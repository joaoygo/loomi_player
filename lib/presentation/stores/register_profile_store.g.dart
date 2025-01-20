// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterProfileStore on RegisterProfileStoreBase, Store {
  late final _$userNameAtom =
      Atom(name: 'RegisterProfileStoreBase.userName', context: context);

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
      Atom(name: 'RegisterProfileStoreBase.profileImage', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: 'RegisterProfileStoreBase.isLoading', context: context);

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

  late final _$getUserAsyncAction =
      AsyncAction('RegisterProfileStoreBase.getUser', context: context);

  @override
  Future<String> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  late final _$saveUserAsyncAction =
      AsyncAction('RegisterProfileStoreBase.saveUser', context: context);

  @override
  Future<void> saveUser(String uid) {
    return _$saveUserAsyncAction.run(() => super.saveUser(uid));
  }

  late final _$clearUserAsyncAction =
      AsyncAction('RegisterProfileStoreBase.clearUser', context: context);

  @override
  Future<void> clearUser() {
    return _$clearUserAsyncAction.run(() => super.clearUser());
  }

  late final _$RegisterProfileStoreBaseActionController =
      ActionController(name: 'RegisterProfileStoreBase', context: context);

  @override
  void setUserName(String name) {
    final _$actionInfo = _$RegisterProfileStoreBaseActionController.startAction(
        name: 'RegisterProfileStoreBase.setUserName');
    try {
      return super.setUserName(name);
    } finally {
      _$RegisterProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProfileImage(String imagePath) {
    final _$actionInfo = _$RegisterProfileStoreBaseActionController.startAction(
        name: 'RegisterProfileStoreBase.setProfileImage');
    try {
      return super.setProfileImage(imagePath);
    } finally {
      _$RegisterProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userName: ${userName},
profileImage: ${profileImage},
isLoading: ${isLoading}
    ''';
  }
}
