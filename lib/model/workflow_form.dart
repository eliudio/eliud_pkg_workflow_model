/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 workflow_form.dart
                       
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
import 'package:eliud_pkg_workflow_model/model/embedded_component.dart';

import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_workflow_model/model/model_export.dart';

import 'package:eliud_pkg_workflow_model/model/workflow_list_bloc.dart';
import 'package:eliud_pkg_workflow_model/model/workflow_list_event.dart';
import 'package:eliud_pkg_workflow_model/model/workflow_model.dart';
import 'package:eliud_pkg_workflow_model/model/workflow_form_bloc.dart';
import 'package:eliud_pkg_workflow_model/model/workflow_form_event.dart';
import 'package:eliud_pkg_workflow_model/model/workflow_form_state.dart';

class WorkflowForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final WorkflowModel? value;
  final ActionModel? submitAction;

  WorkflowForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the WorkflowForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<WorkflowFormBloc>(
        create: (context) => WorkflowFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseWorkflowFormEvent(value: value)),
        child: _MyWorkflowForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<WorkflowFormBloc>(
        create: (context) => WorkflowFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseWorkflowFormNoLoadEvent(value: value)),
        child: _MyWorkflowForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update Workflow'
                      : 'Add Workflow'),
          body: BlocProvider<WorkflowFormBloc>(
            create: (context) => WorkflowFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseWorkflowFormEvent(value: value)
                : InitialiseNewWorkflowFormEvent())),
            child: _MyWorkflowForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyWorkflowForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyWorkflowForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyWorkflowForm> createState() => _MyWorkflowFormState(formAction);
}

class _MyWorkflowFormState extends State<_MyWorkflowForm> {
  final FormAction? formAction;
  late WorkflowFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();

  _MyWorkflowFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<WorkflowFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _nameController.addListener(_onNameChanged);
    _appIdController.addListener(_onAppIdChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkflowFormBloc, WorkflowFormState>(
        builder: (context, state) {
      if (state is WorkflowFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is WorkflowFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _nameController.text = state.value!.name.toString();
        _appIdController.text = state.value!.appId.toString();
      }
      if (state is WorkflowFormInitialized) {
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
                labelText: 'Name',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _nameController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is NameWorkflowFormError ? state.message : null,
                hintText: null));

        children.add(Container(
            height: (fullScreenHeight(context) / 2.5),
            child: workflowTasksList(widget.app, context,
                state.value!.workflowTask, _onWorkflowTaskChanged)));

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
                .groupTitle(widget.app, context, 'General')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Document ID',
                icon: Icons.vpn_key,
                readOnly: (formAction == FormAction.updateAction),
                textEditingController: _documentIDController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is DocumentIDWorkflowFormError ? state.message : null,
                hintText: null));

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
                    state is AppIdWorkflowFormError ? state.message : null,
                hintText: 'field.remark'));

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
                        if (state is WorkflowFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<WorkflowListBloc>(context)
                                .add(UpdateWorkflowList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              name: state.value!.name,
                              workflowTask: state.value!.workflowTask,
                              appId: state.value!.appId,
                            )));
                          } else {
                            BlocProvider.of<WorkflowListBloc>(context)
                                .add(AddWorkflowList(
                                    value: WorkflowModel(
                              documentID: state.value!.documentID,
                              name: state.value!.name,
                              workflowTask: state.value!.workflowTask,
                              appId: state.value!.appId,
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

  void _onDocumentIDChanged() {
    _myFormBloc
        .add(ChangedWorkflowDocumentID(value: _documentIDController.text));
  }

  void _onNameChanged() {
    _myFormBloc.add(ChangedWorkflowName(value: _nameController.text));
  }

  void _onWorkflowTaskChanged(value) {
    _myFormBloc.add(ChangedWorkflowWorkflowTask(value: value));
    setState(() {});
  }

  void _onAppIdChanged() {
    _myFormBloc.add(ChangedWorkflowAppId(value: _appIdController.text));
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _nameController.dispose();
    _appIdController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(BuildContext context, WorkflowFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!Apis.apis()
            .getCoreApi()
            .memberIsOwner(context, widget.app.documentID));
  }
}
