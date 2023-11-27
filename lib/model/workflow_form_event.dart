/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_pkg_workflow_model/model/model_export.dart';

@immutable
abstract class WorkflowFormEvent extends Equatable {
  const WorkflowFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewWorkflowFormEvent extends WorkflowFormEvent {}

class InitialiseWorkflowFormEvent extends WorkflowFormEvent {
  final WorkflowModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseWorkflowFormEvent({this.value});
}

class InitialiseWorkflowFormNoLoadEvent extends WorkflowFormEvent {
  final WorkflowModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseWorkflowFormNoLoadEvent({this.value});
}

class ChangedWorkflowDocumentID extends WorkflowFormEvent {
  final String? value;

  ChangedWorkflowDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedWorkflowDocumentID{ value: $value }';
}

class ChangedWorkflowName extends WorkflowFormEvent {
  final String? value;

  ChangedWorkflowName({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedWorkflowName{ value: $value }';
}

class ChangedWorkflowWorkflowTask extends WorkflowFormEvent {
  final List<WorkflowTaskModel>? value;

  ChangedWorkflowWorkflowTask({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedWorkflowWorkflowTask{ value: $value }';
}

class ChangedWorkflowAppId extends WorkflowFormEvent {
  final String? value;

  ChangedWorkflowAppId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedWorkflowAppId{ value: $value }';
}
