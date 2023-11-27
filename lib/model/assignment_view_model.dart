/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_view_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_helpers/base/model_base.dart';

import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_workflow_model/model/entity_export.dart';

import 'package:eliud_pkg_workflow_model/model/assignment_view_entity.dart';

class AssignmentViewModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_workflow_model';
  static const String id = 'assignmentViews';

  @override
  String documentID;
  @override
  String appId;
  String? title;
  String? description;
  StorageConditionsModel? conditions;

  AssignmentViewModel({
    required this.documentID,
    required this.appId,
    this.title,
    this.description,
    this.conditions,
  });

  @override
  AssignmentViewModel copyWith({
    String? documentID,
    String? appId,
    String? title,
    String? description,
    StorageConditionsModel? conditions,
  }) {
    return AssignmentViewModel(
      documentID: documentID ?? this.documentID,
      appId: appId ?? this.appId,
      title: title ?? this.title,
      description: description ?? this.description,
      conditions: conditions ?? this.conditions,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      appId.hashCode ^
      title.hashCode ^
      description.hashCode ^
      conditions.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssignmentViewModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          appId == other.appId &&
          title == other.title &&
          description == other.description &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'AssignmentViewModel{documentID: $documentID, appId: $appId, title: $title, description: $description, conditions: $conditions}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (conditions != null) {
      referencesCollector
          .addAll(await conditions!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  AssignmentViewEntity toEntity({String? appId}) {
    return AssignmentViewEntity(
      appId: appId,
      title: (title != null) ? title : null,
      description: (description != null) ? description : null,
      conditions:
          (conditions != null) ? conditions!.toEntity(appId: appId) : null,
    );
  }

  static Future<AssignmentViewModel?> fromEntity(
      String documentID, AssignmentViewEntity? entity) async {
    if (entity == null) return null;
    return AssignmentViewModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      title: entity.title,
      description: entity.description,
      conditions: await StorageConditionsModel.fromEntity(entity.conditions),
    );
  }

  static Future<AssignmentViewModel?> fromEntityPlus(
      String documentID, AssignmentViewEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    return AssignmentViewModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      title: entity.title,
      description: entity.description,
      conditions: await StorageConditionsModel.fromEntityPlus(entity.conditions,
          appId: appId),
    );
  }
}
