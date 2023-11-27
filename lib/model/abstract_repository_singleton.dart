/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/abstract_repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../model/assignment_repository.dart';
import '../model/assignment_view_repository.dart';
import '../model/workflow_repository.dart';
import 'package:eliud_core_main/tools/etc/member_collection_info.dart';

AssignmentRepository? assignmentRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.assignmentRepository(appId);
AssignmentViewRepository? assignmentViewRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.assignmentViewRepository(appId);
WorkflowRepository? workflowRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.workflowRepository(appId);

abstract class AbstractRepositorySingleton {
  static List<MemberCollectionInfo> collections = [
    MemberCollectionInfo('assignment', 'assigneeId'),
  ];
  static late AbstractRepositorySingleton singleton;

  AssignmentRepository? assignmentRepository(String? appId);
  AssignmentViewRepository? assignmentViewRepository(String? appId);
  WorkflowRepository? workflowRepository(String? appId);

  void flush(String? appId) {
    assignmentRepository(appId)!.flush();
    assignmentViewRepository(appId)!.flush();
    workflowRepository(appId)!.flush();
  }
}
