/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_task_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_workflow_model/model/model_export.dart';

@immutable
abstract class WorkflowTaskFormEvent extends Equatable {
  const WorkflowTaskFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewWorkflowTaskFormEvent extends WorkflowTaskFormEvent {}

class InitialiseWorkflowTaskFormEvent extends WorkflowTaskFormEvent {
  final WorkflowTaskModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseWorkflowTaskFormEvent({this.value});
}

class InitialiseWorkflowTaskFormNoLoadEvent extends WorkflowTaskFormEvent {
  final WorkflowTaskModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseWorkflowTaskFormNoLoadEvent({this.value});
}

class ChangedWorkflowTaskDocumentID extends WorkflowTaskFormEvent {
  final String? value;

  ChangedWorkflowTaskDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedWorkflowTaskDocumentID{ value: $value }';
}

class ChangedWorkflowTaskSeqNumber extends WorkflowTaskFormEvent {
  final String? value;

  ChangedWorkflowTaskSeqNumber({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedWorkflowTaskSeqNumber{ value: $value }';
}

class ChangedWorkflowTaskTask extends WorkflowTaskFormEvent {
  final TaskModel? value;

  ChangedWorkflowTaskTask({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedWorkflowTaskTask{ value: $value }';
}

class ChangedWorkflowTaskConfirmMessage extends WorkflowTaskFormEvent {
  final WorkflowNotificationModel? value;

  ChangedWorkflowTaskConfirmMessage({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedWorkflowTaskConfirmMessage{ value: $value }';
}

class ChangedWorkflowTaskRejectMessage extends WorkflowTaskFormEvent {
  final WorkflowNotificationModel? value;

  ChangedWorkflowTaskRejectMessage({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedWorkflowTaskRejectMessage{ value: $value }';
}

class ChangedWorkflowTaskResponsible extends WorkflowTaskFormEvent {
  final WorkflowTaskResponsible? value;

  ChangedWorkflowTaskResponsible({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedWorkflowTaskResponsible{ value: $value }';
}
