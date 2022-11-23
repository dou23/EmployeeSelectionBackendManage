import 'package:emplyoee_selection/generated/json/base/json_convert_content.dart';
import 'package:emplyoee_selection/app/modules/selection_content/model/selection_content_entity.dart';

SelectionContentEntity $SelectionContentEntityFromJson(Map<String, dynamic> json) {
	final SelectionContentEntity selectionContentEntity = SelectionContentEntity();
	final int? iD = jsonConvert.convert<int>(json['ID']);
	if (iD != null) {
		selectionContentEntity.iD = iD;
	}
	final String? createdAt = jsonConvert.convert<String>(json['CreatedAt']);
	if (createdAt != null) {
		selectionContentEntity.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['UpdatedAt']);
	if (updatedAt != null) {
		selectionContentEntity.updatedAt = updatedAt;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		selectionContentEntity.name = name;
	}
	final List<SelectionContentContentDetail>? contentDetail = jsonConvert.convertListNotNull<SelectionContentContentDetail>(json['contentDetail']);
	if (contentDetail != null) {
		selectionContentEntity.contentDetail = contentDetail;
	}
	return selectionContentEntity;
}

Map<String, dynamic> $SelectionContentEntityToJson(SelectionContentEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['ID'] = entity.iD;
	data['CreatedAt'] = entity.createdAt;
	data['UpdatedAt'] = entity.updatedAt;
	data['name'] = entity.name;
	data['contentDetail'] =  entity.contentDetail?.map((v) => v.toJson()).toList();
	return data;
}

SelectionContentContentDetail $SelectionContentContentDetailFromJson(Map<String, dynamic> json) {
	final SelectionContentContentDetail selectionContentContentDetail = SelectionContentContentDetail();
	final int? iD = jsonConvert.convert<int>(json['ID']);
	if (iD != null) {
		selectionContentContentDetail.iD = iD;
	}
	final String? createdAt = jsonConvert.convert<String>(json['CreatedAt']);
	if (createdAt != null) {
		selectionContentContentDetail.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['UpdatedAt']);
	if (updatedAt != null) {
		selectionContentContentDetail.updatedAt = updatedAt;
	}
	final int? selectionContentId = jsonConvert.convert<int>(json['selection_content_id']);
	if (selectionContentId != null) {
		selectionContentContentDetail.selectionContentId = selectionContentId;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		selectionContentContentDetail.name = name;
	}
	final String? description = jsonConvert.convert<String>(json['description']);
	if (description != null) {
		selectionContentContentDetail.description = description;
	}
	final int? highestScore = jsonConvert.convert<int>(json['highest_score']);
	if (highestScore != null) {
		selectionContentContentDetail.highestScore = highestScore;
	}
	final int? lowestScore = jsonConvert.convert<int>(json['lowest_score']);
	if (lowestScore != null) {
		selectionContentContentDetail.lowestScore = lowestScore;
	}
	return selectionContentContentDetail;
}

Map<String, dynamic> $SelectionContentContentDetailToJson(SelectionContentContentDetail entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['ID'] = entity.iD;
	data['CreatedAt'] = entity.createdAt;
	data['UpdatedAt'] = entity.updatedAt;
	data['selection_content_id'] = entity.selectionContentId;
	data['name'] = entity.name;
	data['description'] = entity.description;
	data['highest_score'] = entity.highestScore;
	data['lowest_score'] = entity.lowestScore;
	return data;
}