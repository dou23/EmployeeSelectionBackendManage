import 'package:emplyoee_selection/generated/json/base/json_convert_content.dart';
import 'package:emplyoee_selection/app/modules/login/model/login_response_entity.dart';
import 'package:hive/hive.dart';


LoginEntity $LoginEntityFromJson(Map<String, dynamic> json) {
	final LoginEntity loginEntity = LoginEntity();
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		loginEntity.username = username;
	}
	final String? account = jsonConvert.convert<String>(json['account']);
	if (account != null) {
		loginEntity.account = account;
	}
	final String? token = jsonConvert.convert<String>(json['token']);
	if (token != null) {
		loginEntity.token = token;
	}
	final int? expires = jsonConvert.convert<int>(json['expires']);
	if (expires != null) {
		loginEntity.expires = expires;
	}
	final String? avatar = jsonConvert.convert<String>(json['avatar']);
	if (avatar != null) {
		loginEntity.avatar = avatar;
	}
	return loginEntity;
}

Map<String, dynamic> $LoginEntityToJson(LoginEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['username'] = entity.username;
	data['account'] = entity.account;
	data['token'] = entity.token;
	data['expires'] = entity.expires;
	data['avatar'] = entity.avatar;
	return data;
}