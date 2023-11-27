/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core_helpers/base/entity_base.dart';
import 'package:eliud_pkg_workflow_model/model/entity_export.dart';

class WorkflowEntity implements EntityBase {
  final String? name;
  final List<WorkflowTaskEntity>? workflowTask;
  final String? appId;

  WorkflowEntity({
    this.name,
    this.workflowTask,
    required this.appId,
  });

  WorkflowEntity copyWith({
    String? documentID,
    String? name,
    List<WorkflowTaskEntity>? workflowTask,
    String? appId,
  }) {
    return WorkflowEntity(
      name: name ?? this.name,
      workflowTask: workflowTask ?? this.workflowTask,
      appId: appId ?? this.appId,
    );
  }

  List<Object?> get props => [
        name,
        workflowTask,
        appId,
      ];

  @override
  String toString() {
    String workflowTaskCsv =
        (workflowTask == null) ? '' : workflowTask!.join(', ');

    return 'WorkflowEntity{name: $name, workflowTask: WorkflowTask[] { $workflowTaskCsv }, appId: $appId}';
  }

  static WorkflowEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var workflowTaskFromMap = map['workflowTask'];
    List<WorkflowTaskEntity> workflowTaskList;
    if (workflowTaskFromMap != null) {
      workflowTaskList = (map['workflowTask'] as List<dynamic>)
          .map((dynamic item) => WorkflowTaskEntity.fromMap(item as Map,
              newDocumentIds: newDocumentIds)!)
          .toList();
    } else {
      workflowTaskList = [];
    }

    return WorkflowEntity(
      name: map['name'],
      workflowTask: workflowTaskList,
      appId: map['appId'],
    );
  }

  @override
  Map<String, Object?> toDocument() {
    final List<Map<String?, dynamic>>? workflowTaskListMap =
        workflowTask != null
            ? workflowTask!.map((item) => item.toDocument()).toList()
            : null;

    Map<String, Object?> theDocument = HashMap();
    if (name != null) {
      theDocument["name"] = name;
    } else {
      theDocument["name"] = null;
    }
    if (workflowTask != null) {
      theDocument["workflowTask"] = workflowTaskListMap;
    } else {
      theDocument["workflowTask"] = null;
    }
    if (appId != null) {
      theDocument["appId"] = appId;
    } else {
      theDocument["appId"] = null;
    }
    return theDocument;
  }

  @override
  WorkflowEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static WorkflowEntity? fromJsonString(String json,
      {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  @override
  Future<Map<String, Object?>> enrichedDocument(
      Map<String, Object?> theDocument) async {
    return theDocument;
  }
}
