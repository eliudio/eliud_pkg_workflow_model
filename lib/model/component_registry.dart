/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/component_registry.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../model/internal_component.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_spec.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_constructor.dart';
import 'package:eliud_core_main/apis/apis.dart';

import 'assignment_view_component_selector.dart';

/* 
 * Component registry contains a list of components
 */
class ComponentRegistry {
  /* 
   * Initialise the component registry
   */
  init(
    ComponentConstructor assignmentViewComponentConstructorDefault,
    ComponentEditorConstructor assignmentViewComponentEditorConstructor,
  ) {
    Apis.apis()
        .getRegistryApi()
        .addInternalComponents('eliud_pkg_workflow_model', [
      "assignments",
      "assignmentViews",
      "workflows",
    ]);

    Apis.apis().getRegistryApi().register(
        componentName: "eliud_pkg_workflow_model_internalWidgets",
        componentConstructor: ListComponentFactory());
    Apis.apis().getRegistryApi().addDropDownSupporter(
        "assignmentViews", DropdownButtonComponentFactory());
    Apis.apis().getRegistryApi().register(
        componentName: "assignmentViews",
        componentConstructor: assignmentViewComponentConstructorDefault);
    Apis.apis()
        .getRegistryApi()
        .addComponentSpec('eliud_pkg_workflow_model', 'workflow', [
      ComponentSpec(
          'assignmentViews',
          assignmentViewComponentConstructorDefault,
          AssignmentViewComponentSelector(),
          assignmentViewComponentEditorConstructor,
          ({String? appId}) => assignmentViewRepository(appId: appId)!),
    ]);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_pkg_workflow_model',
        'assignments',
        ({String? appId}) => assignmentRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_pkg_workflow_model',
        'assignmentViews',
        ({String? appId}) => assignmentViewRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_pkg_workflow_model',
        'workflows',
        ({String? appId}) => workflowRepository(appId: appId)!);
  }
}
