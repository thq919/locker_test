import 'dart:convert';

import 'package:test/locker_model.dart';


class LockerListState  {
  final List<LockerModel> items;
  const LockerListState({
     this.items = const [],
  });

  LockerListState copyWith({
    List<LockerModel>? items,
  }) {
    return LockerListState(
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'items': items,
    };
  }

  factory LockerListState.fromMap(Map<String, dynamic> map) {
    return LockerListState(
      items: List<LockerModel>.from(
        ((map['items'] ?? const <LockerModel>[]) as List<LockerModel>),
      ),
    );
  }

  toJson() => toMap();

  factory LockerListState.fromJson(String source) =>
      LockerListState.fromMap(json.decode(source) as Map<String, dynamic>);  
  
}
