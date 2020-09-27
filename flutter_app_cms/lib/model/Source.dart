import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Source {
  String _id;
  String _name;

  Source({String id, String name}) {
    this._id = id;
    this._name = name;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;

  Source.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    return data;
  }
}
