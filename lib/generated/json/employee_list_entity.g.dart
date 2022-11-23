import 'package:emplyoee_selection/generated/json/base/json_convert_content.dart';
import 'package:emplyoee_selection/app/modules/employee_management/model/employee_list_entity.dart';

EmployeeListEntity $EmployeeListEntityFromJson(Map<String, dynamic> json) {
	final EmployeeListEntity employeeListEntity = EmployeeListEntity();
	final double? iD = jsonConvert.convert<double>(json['ID']);
	if (iD != null) {
		employeeListEntity.iD = iD;
	}
	final String? createdAt = jsonConvert.convert<String>(json['CreatedAt']);
	if (createdAt != null) {
		employeeListEntity.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['UpdatedAt']);
	if (updatedAt != null) {
		employeeListEntity.updatedAt = updatedAt;
	}
	final String? account = jsonConvert.convert<String>(json['account']);
	if (account != null) {
		employeeListEntity.account = account;
	}
	final String? password = jsonConvert.convert<String>(json['password']);
	if (password != null) {
		employeeListEntity.password = password;
	}
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		employeeListEntity.username = username;
	}
	final String? avatar = jsonConvert.convert<String>(json['avatar']);
	if (avatar != null) {
		employeeListEntity.avatar = avatar;
	}
	final double? state = jsonConvert.convert<double>(json['state']);
	if (state != null) {
		employeeListEntity.state = state;
	}
	return employeeListEntity;
}

Map<String, dynamic> $EmployeeListEntityToJson(EmployeeListEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['ID'] = entity.iD;
	data['CreatedAt'] = entity.createdAt;
	data['UpdatedAt'] = entity.updatedAt;
	data['account'] = entity.account;
	data['password'] = entity.password;
	data['username'] = entity.username;
	data['avatar'] = entity.avatar;
	data['state'] = entity.state;
	return data;
}