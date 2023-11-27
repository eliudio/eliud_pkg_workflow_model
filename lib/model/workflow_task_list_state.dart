/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_task_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_workflow_model/model/workflow_task_model.dart';

abstract class WorkflowTaskListState extends Equatable {
  const WorkflowTaskListState();

  @override
  List<Object?> get props => [];
}

class WorkflowTaskListLoading extends WorkflowTaskListState {}

class WorkflowTaskListLoaded extends WorkflowTaskListState {
  final List<WorkflowTaskModel?>? values;
  final bool? mightHaveMore;

  const WorkflowTaskListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'WorkflowTaskListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is WorkflowTaskListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class WorkflowTaskNotLoaded extends WorkflowTaskListState {}
