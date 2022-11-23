import 'package:emplyoee_selection/generated/json/base/json_field.dart';
import 'package:emplyoee_selection/generated/json/employee_list_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class EmployeeListEntity {

	@JSONField(name: "ID")
	double? iD;
	@JSONField(name: "CreatedAt")
	String? createdAt;
	@JSONField(name: "UpdatedAt")
	String? updatedAt;
	String? account;
	String? password;
	String? username;
	String? avatar;
	double? state;
  
  EmployeeListEntity();

  factory EmployeeListEntity.fromJson(Map<String, dynamic> json) => $EmployeeListEntityFromJson(json);

  Map<String, dynamic> toJson() => $EmployeeListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}