/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:eliud_core_helpers/helpers/common_tools.dart';
import 'package:eliud_pkg_workflow_model/model/assignment_repository.dart';

import 'package:eliud_pkg_workflow_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow_model/model/repository_export.dart';
import 'package:eliud_pkg_workflow_model/model/cache_export.dart';
import 'package:eliud_pkg_workflow_model/model/model_export.dart';
import 'package:eliud_pkg_workflow_model/model/entity_export.dart';

class AssignmentCache implements AssignmentRepository {
  final AssignmentRepository reference;
  final Map<String?, AssignmentModel?> fullCache = {};

  AssignmentCache(this.reference);

  /// Add a AssignmentModel to the repository, cached
  @override
  Future<AssignmentModel> add(AssignmentModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  /// Add a AssignmentEntity to the repository, cached
  @override
  Future<AssignmentEntity> addEntity(
      String documentID, AssignmentEntity value) {
    return reference.addEntity(documentID, value);
  }

  /// Update a AssignmentEntity in the repository, cached
  @override
  Future<AssignmentEntity> updateEntity(
      String documentID, AssignmentEntity value) {
    return reference.updateEntity(documentID, value);
  }

  /// Delete a AssignmentModel from the repository, cached
  @override
  Future<void> delete(AssignmentModel value) {
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  /// Retrieve a AssignmentModel with it's id, cached
  @override
  Future<AssignmentModel?> get(String? id,
      {Function(Exception)? onError}) async {
    var value = fullCache[id];
    if (value != null) return refreshRelations(value);
    value = await reference.get(id, onError: onError);
    fullCache[id] = value;
    return value;
  }

  /// Update a AssignmentModel
  @override
  Future<AssignmentModel> update(AssignmentModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  /// Retrieve list of List<AssignmentModel?>
  @override
  Stream<List<AssignmentModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return reference.values(
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        setLastDoc: setLastDoc,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  Stream<List<AssignmentModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return reference.valuesWithDetails(
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        setLastDoc: setLastDoc,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  Future<List<AssignmentModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    return await reference.valuesList(
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        setLastDoc: setLastDoc,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  Future<List<AssignmentModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    return await reference.valuesListWithDetails(
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        setLastDoc: setLastDoc,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  void flush() {
    fullCache.clear();
  }

  @override
  String? timeStampToString(dynamic timeStamp) {
    return reference.timeStampToString(timeStamp);
  }

  @override
  dynamic getSubCollection(String documentId, String name) {
    return reference.getSubCollection(documentId, name);
  }

  @override
  Future<AssignmentModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    return reference
        .changeValue(documentId, fieldName, changeByThisValue)
        .then((newValue) {
      fullCache[documentId] = newValue;
      return newValue!;
    });
  }

  @override
  Future<AssignmentEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    return reference.getEntity(id, onError: onError);
  }

  @override
  AssignmentEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    return reference.fromMap(o, newDocumentIds: newDocumentIds);
  }

  @override
  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<AssignmentModel?>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return reference.listen(trigger,
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  StreamSubscription<List<AssignmentModel?>> listenWithDetails(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return reference.listenWithDetails(trigger,
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  StreamSubscription<AssignmentModel?> listenTo(
      String documentId, AssignmentChanged changed,
      {AssignmentErrorHandler? errorHandler}) {
    return reference.listenTo(documentId, ((value) {
      if (value != null) {
        fullCache[value.documentID] = value;
      }
      changed(value);
    }), errorHandler: errorHandler);
  }

  static Future<AssignmentModel> refreshRelations(AssignmentModel model) async {
    WorkflowModel? workflowHolder;
    if (model.workflow != null) {
      try {
        await workflowRepository(appId: model.appId)!
            .get(model.workflow!.documentID)
            .then((val) {
          workflowHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    List<AssignmentResultModel>? resultsCurrentHolder;
    if (model.resultsCurrent != null) {
      resultsCurrentHolder = List<AssignmentResultModel>.from(
              await Future.wait(model.resultsCurrent!.map((element) async {
        return await AssignmentResultCache.refreshRelations(element);
      })))
          .toList();
    }

    List<AssignmentResultModel>? resultsPreviousHolder;
    if (model.resultsPrevious != null) {
      resultsPreviousHolder = List<AssignmentResultModel>.from(
              await Future.wait(model.resultsPrevious!.map((element) async {
        return await AssignmentResultCache.refreshRelations(element);
      })))
          .toList();
    }

    return model.copyWith(
      workflow: workflowHolder,
      resultsCurrent: resultsCurrentHolder,
      resultsPrevious: resultsPreviousHolder,
    );
  }
}
