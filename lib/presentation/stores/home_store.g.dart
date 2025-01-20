// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$videosAtom =
      Atom(name: 'HomeStoreBase.videos', context: context);

  @override
  ObservableList<VideoEntity> get videos {
    _$videosAtom.reportRead();
    return super.videos;
  }

  @override
  set videos(ObservableList<VideoEntity> value) {
    _$videosAtom.reportWrite(value, super.videos, () {
      super.videos = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'HomeStoreBase.isLoading', context: context);

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
      Atom(name: 'HomeStoreBase.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$userAtom = Atom(name: 'HomeStoreBase.user', context: context);

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

  late final _$fetchVideosAsyncAction =
      AsyncAction('HomeStoreBase.fetchVideos', context: context);

  @override
  Future<void> fetchVideos() {
    return _$fetchVideosAsyncAction.run(() => super.fetchVideos());
  }

  late final _$getUserAsyncAction =
      AsyncAction('HomeStoreBase.getUser', context: context);

  @override
  Future<UserModel?> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  @override
  String toString() {
    return '''
videos: ${videos},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
user: ${user}
    ''';
  }
}
