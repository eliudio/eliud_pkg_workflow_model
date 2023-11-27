/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_view_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_workflow_model/model/assignment_view_model.dart';

abstract class AssignmentViewListState extends Equatable {
  const AssignmentViewListState();

  @override
  List<Object?> get props => [];
}

class AssignmentViewListLoading extends AssignmentViewListState {}

class AssignmentViewListLoaded extends AssignmentViewListState {
  final List<AssignmentViewModel?>? values;
  final bool? mightHaveMore;

  const AssignmentViewListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'AssignmentViewListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is AssignmentViewListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class AssignmentViewNotLoaded extends AssignmentViewListState {}
