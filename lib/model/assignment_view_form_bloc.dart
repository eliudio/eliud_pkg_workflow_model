/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_view_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_pkg_workflow_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_workflow_model/model/model_export.dart';

import 'package:eliud_pkg_workflow_model/model/assignment_view_form_event.dart';
import 'package:eliud_pkg_workflow_model/model/assignment_view_form_state.dart';

class AssignmentViewFormBloc
    extends Bloc<AssignmentViewFormEvent, AssignmentViewFormState> {
  final FormAction? formAction;
  final String? appId;

  AssignmentViewFormBloc(this.appId, {this.formAction})
      : super(AssignmentViewFormUninitialized()) {
    on<InitialiseNewAssignmentViewFormEvent>((event, emit) {
      AssignmentViewFormLoaded loaded = AssignmentViewFormLoaded(
          value: AssignmentViewModel(
        documentID: "",
        appId: "",
        title: "",
        description: "",
      ));
      emit(loaded);
    });

    on<InitialiseAssignmentViewFormEvent>((event, emit) async {
      // Need to re-retrieve the document from the repository so that I get all associated types
      AssignmentViewFormLoaded loaded = AssignmentViewFormLoaded(
          value: await assignmentViewRepository(appId: appId)!
              .get(event.value!.documentID));
      emit(loaded);
    });
    on<InitialiseAssignmentViewFormNoLoadEvent>((event, emit) async {
      AssignmentViewFormLoaded loaded =
          AssignmentViewFormLoaded(value: event.value);
      emit(loaded);
    });
    AssignmentViewModel? newValue;
    on<ChangedAssignmentViewDocumentID>((event, emit) async {
      if (state is AssignmentViewFormInitialized) {
        final currentState = state as AssignmentViewFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.addAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableAssignmentViewForm(value: newValue));
        }
      }
    });
    on<ChangedAssignmentViewTitle>((event, emit) async {
      if (state is AssignmentViewFormInitialized) {
        final currentState = state as AssignmentViewFormInitialized;
        newValue = currentState.value!.copyWith(title: event.value);
        emit(SubmittableAssignmentViewForm(value: newValue));
      }
    });
    on<ChangedAssignmentViewDescription>((event, emit) async {
      if (state is AssignmentViewFormInitialized) {
        final currentState = state as AssignmentViewFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableAssignmentViewForm(value: newValue));
      }
    });
    on<ChangedAssignmentViewConditions>((event, emit) async {
      if (state is AssignmentViewFormInitialized) {
        final currentState = state as AssignmentViewFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittableAssignmentViewForm(value: newValue));
      }
    });
  }

  DocumentIDAssignmentViewFormError error(
          String message, AssignmentViewModel newValue) =>
      DocumentIDAssignmentViewFormError(message: message, value: newValue);

  Future<AssignmentViewFormState> _isDocumentIDValid(
      String? value, AssignmentViewModel newValue) async {
    if (value == null) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    if (value.isEmpty) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    Future<AssignmentViewModel?> findDocument =
        assignmentViewRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableAssignmentViewForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }
}
