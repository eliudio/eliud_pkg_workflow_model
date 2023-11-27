/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_view_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_workflow_model/model/model_export.dart';

@immutable
abstract class AssignmentViewFormEvent extends Equatable {
  const AssignmentViewFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewAssignmentViewFormEvent extends AssignmentViewFormEvent {}

class InitialiseAssignmentViewFormEvent extends AssignmentViewFormEvent {
  final AssignmentViewModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseAssignmentViewFormEvent({this.value});
}

class InitialiseAssignmentViewFormNoLoadEvent extends AssignmentViewFormEvent {
  final AssignmentViewModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseAssignmentViewFormNoLoadEvent({this.value});
}

class ChangedAssignmentViewDocumentID extends AssignmentViewFormEvent {
  final String? value;

  ChangedAssignmentViewDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAssignmentViewDocumentID{ value: $value }';
}

class ChangedAssignmentViewAppId extends AssignmentViewFormEvent {
  final String? value;

  ChangedAssignmentViewAppId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAssignmentViewAppId{ value: $value }';
}

class ChangedAssignmentViewTitle extends AssignmentViewFormEvent {
  final String? value;

  ChangedAssignmentViewTitle({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAssignmentViewTitle{ value: $value }';
}

class ChangedAssignmentViewDescription extends AssignmentViewFormEvent {
  final String? value;

  ChangedAssignmentViewDescription({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAssignmentViewDescription{ value: $value }';
}

class ChangedAssignmentViewConditions extends AssignmentViewFormEvent {
  final StorageConditionsModel? value;

  ChangedAssignmentViewConditions({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAssignmentViewConditions{ value: $value }';
}
