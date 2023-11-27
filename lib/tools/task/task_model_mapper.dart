import 'package:eliud_pkg_workflow_model/tools/task/task_entity.dart';
import 'package:eliud_pkg_workflow_model/tools/task/task_model.dart';

abstract class TaskModelMapper {
  TaskModel fromEntity(TaskEntity entity);
  TaskModel fromEntityPlus(TaskEntity entity);
  TaskEntity fromMap(Map snap);
}
