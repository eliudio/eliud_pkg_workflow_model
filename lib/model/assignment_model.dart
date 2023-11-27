/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core_helpers/base/model_base.dart';

import 'package:eliud_pkg_workflow_model/model/abstract_repository_singleton.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_workflow_model/model/model_export.dart';
import 'package:eliud_pkg_workflow_model/model/entity_export.dart';

import 'package:eliud_pkg_workflow_model/model/assignment_entity.dart';

enum AssignmentStatus { success, declined, open, unknown }

AssignmentStatus toAssignmentStatus(int? index) {
  switch (index) {
    case 0:
      return AssignmentStatus.success;
    case 1:
      return AssignmentStatus.declined;
    case 2:
      return AssignmentStatus.open;
  }
  return AssignmentStatus.unknown;
}

class AssignmentModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_workflow_model';
  static const String id = 'assignments';

  @override
  String documentID;

  // This is the identifier of the app to which this feed belongs
  @override
  String appId;
  String reporterId;
  String? assigneeId;
  TaskModel? task;
  WorkflowModel? workflow;

  // this corresponds to the WorkflowModel.workflowTask[i].seqNumber
  int? workflowTaskSeqNumber;
  DateTime? timestamp;
  AssignmentStatus? status;

  // The results of the current assignment
  List<AssignmentResultModel>? resultsCurrent;

  // The results of the assignment that preceded this assignment. So this is the same as the resultsCurrent of the preceeding task to which the current member might not have access to (no read access rights)
  List<AssignmentResultModel>? resultsPrevious;
  String? triggeredById;
  WorkflowNotificationModel? confirmMessage;
  WorkflowNotificationModel? rejectMessage;

  AssignmentModel({
    required this.documentID,
    required this.appId,
    required this.reporterId,
    this.assigneeId,
    this.task,
    this.workflow,
    this.workflowTaskSeqNumber,
    this.timestamp,
    this.status,
    this.resultsCurrent,
    this.resultsPrevious,
    this.triggeredById,
    this.confirmMessage,
    this.rejectMessage,
  });

  @override
  AssignmentModel copyWith({
    String? documentID,
    String? appId,
    String? reporterId,
    String? assigneeId,
    TaskModel? task,
    WorkflowModel? workflow,
    int? workflowTaskSeqNumber,
    DateTime? timestamp,
    AssignmentStatus? status,
    List<AssignmentResultModel>? resultsCurrent,
    List<AssignmentResultModel>? resultsPrevious,
    String? triggeredById,
    WorkflowNotificationModel? confirmMessage,
    WorkflowNotificationModel? rejectMessage,
  }) {
    return AssignmentModel(
      documentID: documentID ?? this.documentID,
      appId: appId ?? this.appId,
      reporterId: reporterId ?? this.reporterId,
      assigneeId: assigneeId ?? this.assigneeId,
      task: task ?? this.task,
      workflow: workflow ?? this.workflow,
      workflowTaskSeqNumber:
          workflowTaskSeqNumber ?? this.workflowTaskSeqNumber,
      timestamp: timestamp ?? this.timestamp,
      status: status ?? this.status,
      resultsCurrent: resultsCurrent ?? this.resultsCurrent,
      resultsPrevious: resultsPrevious ?? this.resultsPrevious,
      triggeredById: triggeredById ?? this.triggeredById,
      confirmMessage: confirmMessage ?? this.confirmMessage,
      rejectMessage: rejectMessage ?? this.rejectMessage,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      appId.hashCode ^
      reporterId.hashCode ^
      assigneeId.hashCode ^
      task.hashCode ^
      workflow.hashCode ^
      workflowTaskSeqNumber.hashCode ^
      timestamp.hashCode ^
      status.hashCode ^
      resultsCurrent.hashCode ^
      resultsPrevious.hashCode ^
      triggeredById.hashCode ^
      confirmMessage.hashCode ^
      rejectMessage.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssignmentModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          appId == other.appId &&
          reporterId == other.reporterId &&
          assigneeId == other.assigneeId &&
          task == other.task &&
          workflow == other.workflow &&
          workflowTaskSeqNumber == other.workflowTaskSeqNumber &&
          timestamp == other.timestamp &&
          status == other.status &&
          ListEquality().equals(resultsCurrent, other.resultsCurrent) &&
          ListEquality().equals(resultsPrevious, other.resultsPrevious) &&
          triggeredById == other.triggeredById &&
          confirmMessage == other.confirmMessage &&
          rejectMessage == other.rejectMessage;

  @override
  String toString() {
    String resultsCurrentCsv =
        (resultsCurrent == null) ? '' : resultsCurrent!.join(', ');
    String resultsPreviousCsv =
        (resultsPrevious == null) ? '' : resultsPrevious!.join(', ');

    return 'AssignmentModel{documentID: $documentID, appId: $appId, reporterId: $reporterId, assigneeId: $assigneeId, task: $task, workflow: $workflow, workflowTaskSeqNumber: $workflowTaskSeqNumber, timestamp: $timestamp, status: $status, resultsCurrent: AssignmentResult[] { $resultsCurrentCsv }, resultsPrevious: AssignmentResult[] { $resultsPreviousCsv }, triggeredById: $triggeredById, confirmMessage: $confirmMessage, rejectMessage: $rejectMessage}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (workflow != null) {
      referencesCollector.add(ModelReference(
          WorkflowModel.packageName, WorkflowModel.id, workflow!));
    }
    if (task != null) {
      referencesCollector.addAll(await task!.collectReferences(appId: appId));
    }
    if (workflow != null) {
      referencesCollector
          .addAll(await workflow!.collectReferences(appId: appId));
    }
    if (resultsCurrent != null) {
      for (var item in resultsCurrent!) {
        referencesCollector.addAll(await item.collectReferences(appId: appId));
      }
    }
    if (resultsPrevious != null) {
      for (var item in resultsPrevious!) {
        referencesCollector.addAll(await item.collectReferences(appId: appId));
      }
    }
    if (confirmMessage != null) {
      referencesCollector
          .addAll(await confirmMessage!.collectReferences(appId: appId));
    }
    if (rejectMessage != null) {
      referencesCollector
          .addAll(await rejectMessage!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  AssignmentEntity toEntity({String? appId}) {
    return AssignmentEntity(
      appId: appId,
      reporterId: reporterId,
      assigneeId: (assigneeId != null) ? assigneeId : null,
      task: (task != null) ? task!.toEntity(appId: appId) : null,
      workflowId: (workflow != null) ? workflow!.documentID : null,
      workflowTaskSeqNumber:
          (workflowTaskSeqNumber != null) ? workflowTaskSeqNumber : null,
      timestamp: (timestamp == null) ? null : timestamp!.millisecondsSinceEpoch,
      status: (status != null) ? status!.index : null,
      resultsCurrent: (resultsCurrent != null)
          ? resultsCurrent!.map((item) => item.toEntity(appId: appId)).toList()
          : null,
      resultsPrevious: (resultsPrevious != null)
          ? resultsPrevious!.map((item) => item.toEntity(appId: appId)).toList()
          : null,
      triggeredById: (triggeredById != null) ? triggeredById : null,
      confirmMessage: (confirmMessage != null)
          ? confirmMessage!.toEntity(appId: appId)
          : null,
      rejectMessage: (rejectMessage != null)
          ? rejectMessage!.toEntity(appId: appId)
          : null,
    );
  }

  static Future<AssignmentModel?> fromEntity(
      String documentID, AssignmentEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return AssignmentModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      reporterId: entity.reporterId ?? '',
      assigneeId: entity.assigneeId,
      task: TaskModel.fromEntity(entity.task),
      workflowTaskSeqNumber: entity.workflowTaskSeqNumber,
      timestamp: entity.timestamp == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch((entity.timestamp as int)),
      status: toAssignmentStatus(entity.status),
      resultsCurrent: entity.resultsCurrent == null
          ? null
          : List<AssignmentResultModel>.from(
              await Future.wait(entity.resultsCurrent!.map((item) {
              counter++;
              return AssignmentResultModel.fromEntity(counter.toString(), item);
            }).toList())),
      resultsPrevious: entity.resultsPrevious == null
          ? null
          : List<AssignmentResultModel>.from(
              await Future.wait(entity.resultsPrevious!.map((item) {
              counter++;
              return AssignmentResultModel.fromEntity(counter.toString(), item);
            }).toList())),
      triggeredById: entity.triggeredById,
      confirmMessage:
          await WorkflowNotificationModel.fromEntity(entity.confirmMessage),
      rejectMessage:
          await WorkflowNotificationModel.fromEntity(entity.rejectMessage),
    );
  }

  static Future<AssignmentModel?> fromEntityPlus(
      String documentID, AssignmentEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    WorkflowModel? workflowHolder;
    if (entity.workflowId != null) {
      try {
        workflowHolder =
            await workflowRepository(appId: appId)!.get(entity.workflowId);
      } on Exception catch (e) {
        print('Error whilst trying to initialise workflow');
        print('Error whilst retrieving workflow with id ${entity.workflowId}');
        print('Exception: $e');
      }
    }

    var counter = 0;
    return AssignmentModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      reporterId: entity.reporterId ?? '',
      assigneeId: entity.assigneeId,
      task: await TaskModel.fromEntityPlus(entity.task, appId: appId),
      workflow: workflowHolder,
      workflowTaskSeqNumber: entity.workflowTaskSeqNumber,
      timestamp: entity.timestamp == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch((entity.timestamp as int)),
      status: toAssignmentStatus(entity.status),
      resultsCurrent: entity.resultsCurrent == null
          ? null
          : List<AssignmentResultModel>.from(
              await Future.wait(entity.resultsCurrent!.map((item) {
              counter++;
              return AssignmentResultModel.fromEntityPlus(
                  counter.toString(), item,
                  appId: appId);
            }).toList())),
      resultsPrevious: entity.resultsPrevious == null
          ? null
          : List<AssignmentResultModel>.from(
              await Future.wait(entity.resultsPrevious!.map((item) {
              counter++;
              return AssignmentResultModel.fromEntityPlus(
                  counter.toString(), item,
                  appId: appId);
            }).toList())),
      triggeredById: entity.triggeredById,
      confirmMessage: await WorkflowNotificationModel.fromEntityPlus(
          entity.confirmMessage,
          appId: appId),
      rejectMessage: await WorkflowNotificationModel.fromEntityPlus(
          entity.rejectMessage,
          appId: appId),
    );
  }
}
