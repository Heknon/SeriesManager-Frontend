import 'package:flutter/cupertino.dart';
import 'package:seriesmanager_frontend/models/media_type.dart';

class SerializedBroadcast {
  final MediaType mediaType;
  final int id;
  final Map<int, Set<int>> watched;
  final Set<String> lists;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const SerializedBroadcast({
    @required this.mediaType,
    @required this.id,
    @required this.watched,
    @required this.lists,
  });

  SerializedBroadcast copyWith({
    MediaType mediaType,
    int id,
    Map<int, Set<int>> watched,
    Set<String> lists,
  }) {
    if ((mediaType == null || identical(mediaType, this.mediaType)) &&
        (id == null || identical(id, this.id)) &&
        (watched == null || identical(watched, this.watched)) &&
        (lists == null || identical(lists, this.lists))) {
      return this;
    }

    return new SerializedBroadcast(
      mediaType: mediaType ?? this.mediaType,
      id: id ?? this.id,
      watched: watched ?? this.watched,
      lists: lists ?? this.lists,
    );
  }

  @override
  String toString() {
    return 'SerializedBroadcast{mediaType: $mediaType, id: $id, watched: $watched, lists: $lists}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SerializedBroadcast &&
          runtimeType == other.runtimeType &&
          mediaType == other.mediaType &&
          id == other.id &&
          watched == other.watched &&
          lists == other.lists);

  @override
  int get hashCode => mediaType.hashCode ^ id.hashCode ^ watched.hashCode ^ lists.hashCode;

  factory SerializedBroadcast.fromMap(Map<String, dynamic> map) {
    return new SerializedBroadcast(
      mediaType: getMediaType(map['searchType'] as String),
      id: map['id'] as int,
      watched: map['watched'],
      lists: (map['lists'] as List).map((e) => e as String).toSet(),
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'mediaType': this.mediaType,
      'id': this.id,
      'watched': this.watched,
      'lists': this.lists,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}