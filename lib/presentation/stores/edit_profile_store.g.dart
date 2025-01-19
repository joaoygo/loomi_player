// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditProfileStore on EditProfileStoreBase, Store {
  late final _$userNameAtom =
      Atom(name: 'EditProfileStoreBase.userName', context: context);

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
      Atom(name: 'EditProfileStoreBase.profileImage', context: context);

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
      Atom(name: 'EditProfileStoreBase.isLoading', context: context);

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

  late final _$EditProfileStoreBaseActionController =
      ActionController(name: 'EditProfileStoreBase', context: context);

  @override
  void setUserName(String name) {
    final _$actionInfo = _$EditProfileStoreBaseActionController.startAction(
        name: 'EditProfileStoreBase.setUserName');
    try {
      return super.setUserName(name);
    } finally {
      _$EditProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onImagePicked(File imageFile) {
    final _$actionInfo = _$EditProfileStoreBaseActionController.startAction(
        name: 'EditProfileStoreBase.onImagePicked');
    try {
      return super.onImagePicked(imageFile);
    } finally {
      _$EditProfileStoreBaseActionController.endAction(_$actionInfo);
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
