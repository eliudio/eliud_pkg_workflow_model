/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 assignment_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_main/model/app_model.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core_main/apis/action_api/action_model.dart';

import 'package:eliud_core_main/apis/apis.dart';

import 'package:eliud_core_helpers/etc/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_main/apis/style/style_registry.dart';
import 'package:eliud_core_main/model/internal_component.dart';
import 'package:eliud_pkg_workflow_model/model/embedded_component.dart';

import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_workflow_model/model/model_export.dart';

import 'package:eliud_pkg_workflow_model/model/assignment_list_bloc.dart';
import 'package:eliud_pkg_workflow_model/model/assignment_list_event.dart';
import 'package:eliud_pkg_workflow_model/model/assignment_model.dart';
import 'package:eliud_pkg_workflow_model/model/assignment_form_bloc.dart';
import 'package:eliud_pkg_workflow_model/model/assignment_form_event.dart';
import 'package:eliud_pkg_workflow_model/model/assignment_form_state.dart';

class AssignmentForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final AssignmentModel? value;
  final ActionModel? submitAction;

  AssignmentForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the AssignmentForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<AssignmentFormBloc>(
        create: (context) => AssignmentFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseAssignmentFormEvent(value: value)),
        child: _MyAssignmentForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<AssignmentFormBloc>(
        create: (context) => AssignmentFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseAssignmentFormNoLoadEvent(value: value)),
        child: _MyAssignmentForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update Assignment'
                      : 'Add Assignment'),
          body: BlocProvider<AssignmentFormBloc>(
            create: (context) => AssignmentFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseAssignmentFormEvent(value: value)
                : InitialiseNewAssignmentFormEvent())),
            child: _MyAssignmentForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyAssignmentForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyAssignmentForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyAssignmentForm> createState() => _MyAssignmentFormState(formAction);
}

class _MyAssignmentFormState extends State<_MyAssignmentForm> {
  final FormAction? formAction;
  late AssignmentFormBloc _myFormBloc;

  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _reporterIdController = TextEditingController();
  final TextEditingController _assigneeIdController = TextEditingController();
  String? _workflow;
  final TextEditingController _workflowTaskSeqNumberController =
      TextEditingController();
  int? _statusSelectedRadioTile;
  final TextEditingController _triggeredByIdController =
      TextEditingController();

  _MyAssignmentFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<AssignmentFormBloc>(context);
    _appIdController.addListener(_onAppIdChanged);
    _reporterIdController.addListener(_onReporterIdChanged);
    _assigneeIdController.addListener(_onAssigneeIdChanged);
    _workflowTaskSeqNumberController
        .addListener(_onWorkflowTaskSeqNumberChanged);
    _statusSelectedRadioTile = 0;
    _triggeredByIdController.addListener(_onTriggeredByIdChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssignmentFormBloc, AssignmentFormState>(
        builder: (context, state) {
      if (state is AssignmentFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is AssignmentFormLoaded) {
        _appIdController.text = state.value!.appId.toString();
        _reporterIdController.text = state.value!.reporterId.toString();
        _assigneeIdController.text = state.value!.assigneeId.toString();
        if (state.value!.workflow != null) {
          _workflow = state.value!.workflow!.documentID;
        } else {
          _workflow = "";
        }
        _workflowTaskSeqNumberController.text =
            state.value!.workflowTaskSeqNumber.toString();
        if (state.value!.status != null) {
          _statusSelectedRadioTile = state.value!.status!.index;
        } else {
          _statusSelectedRadioTile = 0;
        }
        _triggeredByIdController.text = state.value!.triggeredById.toString();
      }
      if (state is AssignmentFormInitialized) {
        List<Widget> children = [];
        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'App Identifier',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _appIdController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is AppIdAssignmentFormError ? state.message : null,
                hintText: 'field.remark'));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Workflow Sequence Id',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _workflowTaskSeqNumberController,
                keyboardType: TextInputType.number,
                validator: (_) =>
                    state is WorkflowTaskSeqNumberAssignmentFormError
                        ? state.message
                        : null,
                hintText: 'field.remark'));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _statusSelectedRadioTile,
                'success',
                'success',
                !Apis.apis()
                        .getCoreApi()
                        .memberIsOwner(context, widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionStatus(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _statusSelectedRadioTile,
                'declined',
                'declined',
                !Apis.apis()
                        .getCoreApi()
                        .memberIsOwner(context, widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionStatus(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _statusSelectedRadioTile,
                'open',
                'open',
                !Apis.apis()
                        .getCoreApi()
                        .memberIsOwner(context, widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionStatus(val)));

        children.add(Container(
            height: (fullScreenHeight(context) / 2.5),
            child: assignmentResultsList(widget.app, context,
                state.value!.resultsCurrent, _onResultsCurrentChanged)));

        children.add(Container(
            height: (fullScreenHeight(context) / 2.5),
            child: assignmentResultsList(widget.app, context,
                state.value!.resultsPrevious, _onResultsPreviousChanged)));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Reporter')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Reporter',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _reporterIdController,
                keyboardType: TextInputType.text,
                validator: (_) => state is ReporterIdAssignmentFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Assignee')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Assignee',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _assigneeIdController,
                keyboardType: TextInputType.text,
                validator: (_) => state is AssigneeIdAssignmentFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Triggered by')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Triggered by',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _triggeredByIdController,
                keyboardType: TextInputType.text,
                validator: (_) => state is TriggeredByIdAssignmentFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Workflow')));

        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "workflows",
              value: _workflow,
              trigger: (value, privilegeLevel) => _onWorkflowSelected(value),
              optional: false),
        );

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Assignee')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Assignee',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _assigneeIdController,
                keyboardType: TextInputType.text,
                validator: (_) => state is AssigneeIdAssignmentFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'WorkflowNotification')));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        if ((formAction != FormAction.showData) &&
            (formAction != FormAction.showPreloadedData)) {
          children.add(StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminFormStyle()
              .button(
                widget.app,
                context,
                label: 'Submit',
                onPressed: _readOnly(context, state)
                    ? null
                    : () {
                        if (state is AssignmentFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<AssignmentListBloc>(context)
                                .add(UpdateAssignmentList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              reporterId: state.value!.reporterId,
                              assigneeId: state.value!.assigneeId,
                              task: state.value!.task,
                              workflow: state.value!.workflow,
                              workflowTaskSeqNumber:
                                  state.value!.workflowTaskSeqNumber,
                              timestamp: state.value!.timestamp,
                              status: state.value!.status,
                              resultsCurrent: state.value!.resultsCurrent,
                              resultsPrevious: state.value!.resultsPrevious,
                              triggeredById: state.value!.triggeredById,
                              confirmMessage: state.value!.confirmMessage,
                              rejectMessage: state.value!.rejectMessage,
                            )));
                          } else {
                            BlocProvider.of<AssignmentListBloc>(context)
                                .add(AddAssignmentList(
                                    value: AssignmentModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              reporterId: state.value!.reporterId,
                              assigneeId: state.value!.assigneeId,
                              task: state.value!.task,
                              workflow: state.value!.workflow,
                              workflowTaskSeqNumber:
                                  state.value!.workflowTaskSeqNumber,
                              timestamp: state.value!.timestamp,
                              status: state.value!.status,
                              resultsCurrent: state.value!.resultsCurrent,
                              resultsPrevious: state.value!.resultsPrevious,
                              triggeredById: state.value!.triggeredById,
                              confirmMessage: state.value!.confirmMessage,
                              rejectMessage: state.value!.rejectMessage,
                            )));
                          }
                          if (widget.submitAction != null) {
                            Apis.apis()
                                .getRouterApi()
                                .navigateTo(context, widget.submitAction!);
                          } else {
                            Navigator.pop(context);
                          }
                        }
                      },
              ));
        }

        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .container(
                widget.app,
                context,
                Form(
                  child: ListView(
                      padding: const EdgeInsets.all(8),
                      physics: ((formAction == FormAction.showData) ||
                              (formAction == FormAction.showPreloadedData))
                          ? NeverScrollableScrollPhysics()
                          : null,
                      shrinkWrap: ((formAction == FormAction.showData) ||
                          (formAction == FormAction.showPreloadedData)),
                      children: children),
                ),
                formAction!);
      } else {
        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminListStyle()
            .progressIndicator(widget.app, context);
      }
    });
  }

  void _onAppIdChanged() {
    _myFormBloc.add(ChangedAssignmentAppId(value: _appIdController.text));
  }

  void _onReporterIdChanged() {
    _myFormBloc
        .add(ChangedAssignmentReporterId(value: _reporterIdController.text));
  }

  void _onAssigneeIdChanged() {
    _myFormBloc
        .add(ChangedAssignmentAssigneeId(value: _assigneeIdController.text));
  }

  void _onWorkflowSelected(String? val) {
    setState(() {
      _workflow = val;
    });
    _myFormBloc.add(ChangedAssignmentWorkflow(value: val));
  }

  void _onWorkflowTaskSeqNumberChanged() {
    _myFormBloc.add(ChangedAssignmentWorkflowTaskSeqNumber(
        value: _workflowTaskSeqNumberController.text));
  }

  void setSelectionStatus(int? val) {
    setState(() {
      _statusSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedAssignmentStatus(value: toAssignmentStatus(val)));
  }

  void _onResultsCurrentChanged(value) {
    _myFormBloc.add(ChangedAssignmentResultsCurrent(value: value));
    setState(() {});
  }

  void _onResultsPreviousChanged(value) {
    _myFormBloc.add(ChangedAssignmentResultsPrevious(value: value));
    setState(() {});
  }

  void _onTriggeredByIdChanged() {
    _myFormBloc.add(
        ChangedAssignmentTriggeredById(value: _triggeredByIdController.text));
  }

  @override
  void dispose() {
    _appIdController.dispose();
    _reporterIdController.dispose();
    _assigneeIdController.dispose();
    _workflowTaskSeqNumberController.dispose();
    _triggeredByIdController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(BuildContext context, AssignmentFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!Apis.apis()
            .getCoreApi()
            .memberIsOwner(context, widget.app.documentID));
  }
}
