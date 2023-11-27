/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core_helpers/base/model_base.dart';

import 'package:eliud_pkg_workflow_model/model/model_export.dart';
import 'package:eliud_pkg_workflow_model/model/entity_export.dart';

import 'package:eliud_pkg_workflow_model/model/workflow_entity.dart';

class WorkflowModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_workflow_model';
  static const String id = 'workflows';

  @override
  String documentID;
  String? name;
  List<WorkflowTaskModel>? workflowTask;

  // This is the identifier of the app to which this feed belongs
  @override
  String appId;

  WorkflowModel({
    required this.documentID,
    this.name,
    this.workflowTask,
    required this.appId,
  });

  @override
  WorkflowModel copyWith({
    String? documentID,
    String? name,
    List<WorkflowTaskModel>? workflowTask,
    String? appId,
  }) {
    return WorkflowModel(
      documentID: documentID ?? this.documentID,
      name: name ?? this.name,
      workflowTask: workflowTask ?? this.workflowTask,
      appId: appId ?? this.appId,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      name.hashCode ^
      workflowTask.hashCode ^
      appId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkflowModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          name == other.name &&
          ListEquality().equals(workflowTask, other.workflowTask) &&
          appId == other.appId;

  @override
  String toString() {
    String workflowTaskCsv =
        (workflowTask == null) ? '' : workflowTask!.join(', ');

    return 'WorkflowModel{documentID: $documentID, name: $name, workflowTask: WorkflowTask[] { $workflowTaskCsv }, appId: $appId}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (workflowTask != null) {
      for (var item in workflowTask!) {
        referencesCollector.addAll(await item.collectReferences(appId: appId));
      }
    }
    return referencesCollector;
  }

  @override
  WorkflowEntity toEntity({String? appId}) {
    return WorkflowEntity(
      name: (name != null) ? name : null,
      workflowTask: (workflowTask != null)
          ? workflowTask!.map((item) => item.toEntity(appId: appId)).toList()
          : null,
      appId: appId,
    );
  }

  static Future<WorkflowModel?> fromEntity(
      String documentID, WorkflowEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return WorkflowModel(
      documentID: documentID,
      name: entity.name,
      workflowTask: entity.workflowTask == null
          ? null
          : List<WorkflowTaskModel>.from(
              await Future.wait(entity.workflowTask!.map((item) {
              counter++;
              return WorkflowTaskModel.fromEntity(counter.toString(), item);
            }).toList())),
      appId: entity.appId ?? '',
    );
  }

  static Future<WorkflowModel?> fromEntityPlus(
      String documentID, WorkflowEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return WorkflowModel(
      documentID: documentID,
      name: entity.name,
      workflowTask: entity.workflowTask == null
          ? null
          : List<WorkflowTaskModel>.from(
              await Future.wait(entity.workflowTask!.map((item) {
              counter++;
              return WorkflowTaskModel.fromEntityPlus(counter.toString(), item,
                  appId: appId);
            }).toList())),
      appId: entity.appId ?? '',
    );
  }
}
