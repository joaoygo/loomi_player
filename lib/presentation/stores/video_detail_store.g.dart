// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VideoDetailStore on VideoDetailStoreBase, Store {
  Computed<Duration>? _$totalDurationComputed;

  @override
  Duration get totalDuration =>
      (_$totalDurationComputed ??= Computed<Duration>(() => super.totalDuration,
              name: 'VideoDetailStoreBase.totalDuration'))
          .value;

  late final _$commentsListAtom =
      Atom(name: 'VideoDetailStoreBase.commentsList', context: context);

  @override
  ObservableList<CommentsModel> get commentsList {
    _$commentsListAtom.reportRead();
    return super.commentsList;
  }

  @override
  set commentsList(ObservableList<CommentsModel> value) {
    _$commentsListAtom.reportWrite(value, super.commentsList, () {
      super.commentsList = value;
    });
  }

  late final _$userAtom =
      Atom(name: 'VideoDetailStoreBase.user', context: context);

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
      Atom(name: 'VideoDetailStoreBase.isLoading', context: context);

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

  late final _$isInitializedAtom =
      Atom(name: 'VideoDetailStoreBase.isInitialized', context: context);

  @override
  bool get isInitialized {
    _$isInitializedAtom.reportRead();
    return super.isInitialized;
  }

  @override
  set isInitialized(bool value) {
    _$isInitializedAtom.reportWrite(value, super.isInitialized, () {
      super.isInitialized = value;
    });
  }

  late final _$isPlayingAtom =
      Atom(name: 'VideoDetailStoreBase.isPlaying', context: context);

  @override
  bool get isPlaying {
    _$isPlayingAtom.reportRead();
    return super.isPlaying;
  }

  @override
  set isPlaying(bool value) {
    _$isPlayingAtom.reportWrite(value, super.isPlaying, () {
      super.isPlaying = value;
    });
  }

  late final _$currentPositionAtom =
      Atom(name: 'VideoDetailStoreBase.currentPosition', context: context);

  @override
  Duration get currentPosition {
    _$currentPositionAtom.reportRead();
    return super.currentPosition;
  }

  @override
  set currentPosition(Duration value) {
    _$currentPositionAtom.reportWrite(value, super.currentPosition, () {
      super.currentPosition = value;
    });
  }

  late final _$isExpandedAtom =
      Atom(name: 'VideoDetailStoreBase.isExpanded', context: context);

  @override
  bool get isExpanded {
    _$isExpandedAtom.reportRead();
    return super.isExpanded;
  }

  @override
  set isExpanded(bool value) {
    _$isExpandedAtom.reportWrite(value, super.isExpanded, () {
      super.isExpanded = value;
    });
  }

  late final _$showCommentsAtom =
      Atom(name: 'VideoDetailStoreBase.showComments', context: context);

  @override
  bool get showComments {
    _$showCommentsAtom.reportRead();
    return super.showComments;
  }

  @override
  set showComments(bool value) {
    _$showCommentsAtom.reportWrite(value, super.showComments, () {
      super.showComments = value;
    });
  }

  late final _$showControlsAtom =
      Atom(name: 'VideoDetailStoreBase.showControls', context: context);

  @override
  bool get showControls {
    _$showControlsAtom.reportRead();
    return super.showControls;
  }

  @override
  set showControls(bool value) {
    _$showControlsAtom.reportWrite(value, super.showControls, () {
      super.showControls = value;
    });
  }

  late final _$initializeVideoAsyncAction =
      AsyncAction('VideoDetailStoreBase.initializeVideo', context: context);

  @override
  Future<void> initializeVideo(String videoUrl) {
    return _$initializeVideoAsyncAction
        .run(() => super.initializeVideo(videoUrl));
  }

  late final _$commentVideoAsyncAction =
      AsyncAction('VideoDetailStoreBase.commentVideo', context: context);

  @override
  Future<bool> commentVideo(String videoId, String comment) {
    return _$commentVideoAsyncAction
        .run(() => super.commentVideo(videoId, comment));
  }

  late final _$getCommentsAsyncAction =
      AsyncAction('VideoDetailStoreBase.getComments', context: context);

  @override
  Future<void> getComments(String videoId) {
    return _$getCommentsAsyncAction.run(() => super.getComments(videoId));
  }

  late final _$deleteCommentAsyncAction =
      AsyncAction('VideoDetailStoreBase.deleteComment', context: context);

  @override
  Future<bool> deleteComment(String videoId, String commentId) {
    return _$deleteCommentAsyncAction
        .run(() => super.deleteComment(videoId, commentId));
  }

  late final _$VideoDetailStoreBaseActionController =
      ActionController(name: 'VideoDetailStoreBase', context: context);

  @override
  void toggleControlsVisibility() {
    final _$actionInfo = _$VideoDetailStoreBaseActionController.startAction(
        name: 'VideoDetailStoreBase.toggleControlsVisibility');
    try {
      return super.toggleControlsVisibility();
    } finally {
      _$VideoDetailStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePlayPause() {
    final _$actionInfo = _$VideoDetailStoreBaseActionController.startAction(
        name: 'VideoDetailStoreBase.togglePlayPause');
    try {
      return super.togglePlayPause();
    } finally {
      _$VideoDetailStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleComments() {
    final _$actionInfo = _$VideoDetailStoreBaseActionController.startAction(
        name: 'VideoDetailStoreBase.toggleComments');
    try {
      return super.toggleComments();
    } finally {
      _$VideoDetailStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleFullscreen() {
    final _$actionInfo = _$VideoDetailStoreBaseActionController.startAction(
        name: 'VideoDetailStoreBase.toggleFullscreen');
    try {
      return super.toggleFullscreen();
    } finally {
      _$VideoDetailStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void seekTo(Duration position) {
    final _$actionInfo = _$VideoDetailStoreBaseActionController.startAction(
        name: 'VideoDetailStoreBase.seekTo');
    try {
      return super.seekTo(position);
    } finally {
      _$VideoDetailStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleExpansion() {
    final _$actionInfo = _$VideoDetailStoreBaseActionController.startAction(
        name: 'VideoDetailStoreBase.toggleExpansion');
    try {
      return super.toggleExpansion();
    } finally {
      _$VideoDetailStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
commentsList: ${commentsList},
user: ${user},
isLoading: ${isLoading},
isInitialized: ${isInitialized},
isPlaying: ${isPlaying},
currentPosition: ${currentPosition},
isExpanded: ${isExpanded},
showComments: ${showComments},
showControls: ${showControls},
totalDuration: ${totalDuration}
    ''';
  }
}
