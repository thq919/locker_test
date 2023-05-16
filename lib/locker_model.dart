// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LockerModel {
  final String name;
  final String id;
  final bool enable;
  const LockerModel({
    required this.name,
    required this.id,
    required this.enable,
  });


  LockerModel copyWith({
    String? name,
    String? id,
    bool? enable,
  }) {
    return LockerModel(
      name: name ?? this.name,
      id: id ?? this.id,
      enable: enable ?? this.enable,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'enable': enable,
    };
  }

  factory LockerModel.fromMap(Map<String, dynamic> map) {
    return LockerModel(
      name: (map["name"] ?? '') as String,
      id: (map["id"] ?? 0) as String,
      enable: (map["enable"] ?? false) as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory LockerModel.fromJson(String source) => LockerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LockerModel(name: $name, id: $id, enable: $enable)';

  @override
  bool operator ==(covariant LockerModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.id == id &&
      other.enable == enable;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode ^ enable.hashCode;
}
