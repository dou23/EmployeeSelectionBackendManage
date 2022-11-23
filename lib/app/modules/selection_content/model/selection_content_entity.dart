import 'package:emplyoee_selection/generated/json/base/json_field.dart';
import 'package:emplyoee_selection/generated/json/selection_content_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class SelectionContentEntity {

	@JSONField(name: "ID")
	int? iD;
	@JSONField(name: "CreatedAt")
	String? createdAt;
	@JSONField(name: "UpdatedAt")
	String? updatedAt;
	String? name;
	List<SelectionContentContentDetail>? contentDetail;
  
  SelectionContentEntity();

  factory SelectionContentEntity.fromJson(Map<String, dynamic> json) => $SelectionContentEntityFromJson(json);

  Map<String, dynamic> toJson() => $SelectionContentEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SelectionContentContentDetail {

	@JSONField(name: "ID")
	int? iD;
	@JSONField(name: "CreatedAt")
	String? createdAt;
	@JSONField(name: "UpdatedAt")
	String? updatedAt;
	@JSONField(name: "selection_content_id")
	int? selectionContentId;
	String? name;
	String? description;
	@JSONField(name: "highest_score")
	int? highestScore;
	@JSONField(name: "lowest_score")
	int? lowestScore;
  
  SelectionContentContentDetail();

  factory SelectionContentContentDetail.fromJson(Map<String, dynamic> json) => $SelectionContentContentDetailFromJson(json);

  Map<String, dynamic> toJson() => $SelectionContentContentDetailToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}