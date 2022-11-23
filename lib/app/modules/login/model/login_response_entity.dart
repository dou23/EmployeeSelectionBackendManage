import 'package:emplyoee_selection/generated/json/login_response_entity.g.dart';

import 'package:emplyoee_selection/generated/json/base/json_field.dart';
import 'package:hive/hive.dart';
import 'dart:convert';

part 'login_response_entity.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class LoginEntity {
  LoginEntity();

  factory LoginEntity.fromJson(Map<String, dynamic> json) =>
      $LoginEntityFromJson(json);

  Map<String, dynamic> toJson() => $LoginEntityToJson(this);

  @HiveField(0)
  String? username;
  @HiveField(1)
  String? account;
  @HiveField(2)
  String? token;
  @HiveField(3)
  int? expires;
  @HiveField(4)
  String? avatar;

  @override
  String toString() {
    return jsonEncode(this);
  }
}
