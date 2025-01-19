// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChangePasswordStore on ChangePasswordStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'ChangePasswordStoreBase.isLoading', context: context);

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

  late final _$currentPasswordAtom =
      Atom(name: 'ChangePasswordStoreBase.currentPassword', context: context);

  @override
  String get currentPassword {
    _$currentPasswordAtom.reportRead();
    return super.currentPassword;
  }

  @override
  set currentPassword(String value) {
    _$currentPasswordAtom.reportWrite(value, super.currentPassword, () {
      super.currentPassword = value;
    });
  }

  late final _$newPasswordAtom =
      Atom(name: 'ChangePasswordStoreBase.newPassword', context: context);

  @override
  String get newPassword {
    _$newPasswordAtom.reportRead();
    return super.newPassword;
  }

  @override
  set newPassword(String value) {
    _$newPasswordAtom.reportWrite(value, super.newPassword, () {
      super.newPassword = value;
    });
  }

  late final _$confirmPasswordAtom =
      Atom(name: 'ChangePasswordStoreBase.confirmPassword', context: context);

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$changePasswordAsyncAction =
      AsyncAction('ChangePasswordStoreBase.changePassword', context: context);

  @override
  Future<bool> changePassword(String currentPassword, String newPassword) {
    return _$changePasswordAsyncAction
        .run(() => super.changePassword(currentPassword, newPassword));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
currentPassword: ${currentPassword},
newPassword: ${newPassword},
confirmPassword: ${confirmPassword}
    ''';
  }
}
