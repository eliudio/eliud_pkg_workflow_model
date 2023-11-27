/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_view_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core_helpers/base/entity_base.dart';
import 'package:eliud_core_main/model/entity_export.dart';

class AssignmentViewEntity implements EntityBase {
  final String? appId;
  final String? title;
  final String? description;
  final StorageConditionsEntity? conditions;

  AssignmentViewEntity({
    required this.appId,
    this.title,
    this.description,
    this.conditions,
  });

  AssignmentViewEntity copyWith({
    String? documentID,
    String? appId,
    String? title,
    String? description,
    StorageConditionsEntity? conditions,
  }) {
    return AssignmentViewEntity(
      appId: appId ?? this.appId,
      title: title ?? this.title,
      description: description ?? this.description,
      conditions: conditions ?? this.conditions,
    );
  }

  List<Object?> get props => [
        appId,
        title,
        description,
        conditions,
      ];

  @override
  String toString() {
    return 'AssignmentViewEntity{appId: $appId, title: $title, description: $description, conditions: $conditions}';
  }

  static AssignmentViewEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null) {
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap,
          newDocumentIds: newDocumentIds);
    }

    return AssignmentViewEntity(
      appId: map['appId'],
      title: map['title'],
      description: map['description'],
      conditions: conditionsFromMap,
    );
  }

  @override
  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? conditionsMap =
        conditions != null ? conditions!.toDocument() : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) {
      theDocument["appId"] = appId;
    } else {
      theDocument["appId"] = null;
    }
    if (title != null) {
      theDocument["title"] = title;
    } else {
      theDocument["title"] = null;
    }
    if (description != null) {
      theDocument["description"] = description;
    } else {
      theDocument["description"] = null;
    }
    if (conditions != null) {
      theDocument["conditions"] = conditionsMap;
    } else {
      theDocument["conditions"] = null;
    }
    return theDocument;
  }

  @override
  AssignmentViewEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static AssignmentViewEntity? fromJsonString(String json,
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
