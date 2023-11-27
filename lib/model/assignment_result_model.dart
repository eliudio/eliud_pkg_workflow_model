/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_result_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_helpers/base/model_base.dart';

import 'package:eliud_pkg_workflow_model/model/entity_export.dart';

import 'package:eliud_pkg_workflow_model/model/assignment_result_entity.dart';

class AssignmentResultModel implements ModelBase {
  static const String packageName = 'eliud_pkg_workflow_model';
  static const String id = 'assignmentResults';

  @override
  String documentID;
  String? key;
  String? value;

  AssignmentResultModel({
    required this.documentID,
    this.key,
    this.value,
  });

  @override
  AssignmentResultModel copyWith({
    String? documentID,
    String? key,
    String? value,
  }) {
    return AssignmentResultModel(
      documentID: documentID ?? this.documentID,
      key: key ?? this.key,
      value: value ?? this.value,
    );
  }

  @override
  int get hashCode => documentID.hashCode ^ key.hashCode ^ value.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssignmentResultModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          key == other.key &&
          value == other.value;

  @override
  String toString() {
    return 'AssignmentResultModel{documentID: $documentID, key: $key, value: $value}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    return referencesCollector;
  }

  @override
  AssignmentResultEntity toEntity({String? appId}) {
    return AssignmentResultEntity(
      key: (key != null) ? key : null,
      value: (value != null) ? value : null,
    );
  }

  static Future<AssignmentResultModel?> fromEntity(
      String documentID, AssignmentResultEntity? entity) async {
    if (entity == null) return null;
    return AssignmentResultModel(
      documentID: documentID,
      key: entity.key,
      value: entity.value,
    );
  }

  static Future<AssignmentResultModel?> fromEntityPlus(
      String documentID, AssignmentResultEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    return AssignmentResultModel(
      documentID: documentID,
      key: entity.key,
      value: entity.value,
    );
  }
}
