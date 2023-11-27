/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_task_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core_helpers/base/entity_base.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_workflow_model/model/entity_export.dart';

class WorkflowTaskEntity implements EntityBase {
  final int? seqNumber;
  final TaskEntity? task;
  final WorkflowNotificationEntity? confirmMessage;
  final WorkflowNotificationEntity? rejectMessage;
  final int? responsible;

  WorkflowTaskEntity({
    this.seqNumber,
    this.task,
    this.confirmMessage,
    this.rejectMessage,
    this.responsible,
  });

  WorkflowTaskEntity copyWith({
    String? documentID,
    int? seqNumber,
    TaskEntity? task,
    WorkflowNotificationEntity? confirmMessage,
    WorkflowNotificationEntity? rejectMessage,
    int? responsible,
  }) {
    return WorkflowTaskEntity(
      seqNumber: seqNumber ?? this.seqNumber,
      task: task ?? this.task,
      confirmMessage: confirmMessage ?? this.confirmMessage,
      rejectMessage: rejectMessage ?? this.rejectMessage,
      responsible: responsible ?? this.responsible,
    );
  }

  List<Object?> get props => [
        seqNumber,
        task,
        confirmMessage,
        rejectMessage,
        responsible,
      ];

  @override
  String toString() {
    return 'WorkflowTaskEntity{seqNumber: $seqNumber, task: $task, confirmMessage: $confirmMessage, rejectMessage: $rejectMessage, responsible: $responsible}';
  }

  static WorkflowTaskEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var taskFromMap = map['task'];
    if (taskFromMap != null) {
      taskFromMap =
          TaskEntity.fromMap(taskFromMap, newDocumentIds: newDocumentIds);
    }
    var confirmMessageFromMap = map['confirmMessage'];
    if (confirmMessageFromMap != null) {
      confirmMessageFromMap = WorkflowNotificationEntity.fromMap(
          confirmMessageFromMap,
          newDocumentIds: newDocumentIds);
    }
    var rejectMessageFromMap = map['rejectMessage'];
    if (rejectMessageFromMap != null) {
      rejectMessageFromMap = WorkflowNotificationEntity.fromMap(
          rejectMessageFromMap,
          newDocumentIds: newDocumentIds);
    }

    return WorkflowTaskEntity(
      seqNumber: int.tryParse(map['seqNumber'].toString()),
      task: taskFromMap,
      confirmMessage: confirmMessageFromMap,
      rejectMessage: rejectMessageFromMap,
      responsible: map['responsible'],
    );
  }

  @override
  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? taskMap =
        task != null ? task!.toDocument() : null;
    final Map<String, dynamic>? confirmMessageMap =
        confirmMessage != null ? confirmMessage!.toDocument() : null;
    final Map<String, dynamic>? rejectMessageMap =
        rejectMessage != null ? rejectMessage!.toDocument() : null;

    Map<String, Object?> theDocument = HashMap();
    if (seqNumber != null) {
      theDocument["seqNumber"] = seqNumber;
    } else {
      theDocument["seqNumber"] = null;
    }
    if (task != null) {
      theDocument["task"] = taskMap;
    } else {
      theDocument["task"] = null;
    }
    if (confirmMessage != null) {
      theDocument["confirmMessage"] = confirmMessageMap;
    } else {
      theDocument["confirmMessage"] = null;
    }
    if (rejectMessage != null) {
      theDocument["rejectMessage"] = rejectMessageMap;
    } else {
      theDocument["rejectMessage"] = null;
    }
    if (responsible != null) {
      theDocument["responsible"] = responsible;
    } else {
      theDocument["responsible"] = null;
    }
    return theDocument;
  }

  @override
  WorkflowTaskEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith();
    return newEntity;
  }

  static WorkflowTaskEntity? fromJsonString(String json,
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
