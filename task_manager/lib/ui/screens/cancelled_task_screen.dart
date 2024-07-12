import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/models/task_list_wrapper_model.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/data/network_caller/network_caller.dart';
import 'package:task_manager/data/utilities/urls.dart';
import 'package:task_manager/ui/widgets/centered_progress_indicator.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';
import 'package:task_manager/ui/widgets/task_item.dart';

class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({super.key});

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {
  bool _getTaskInProgress = false;
  List<TaskModel> _taskList = [];

  @override
  void initState() {
    super.initState();
    _getCancelledTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: _getTaskInProgress == false,
        replacement: const CenteredProgressIndicator(),
        child: ListView.builder(
          itemCount: _taskList.length,
          itemBuilder: (context, index) {
            return TaskItem(
              taskModel: _taskList[index],
              onUpdateTask: () {
                _getCancelledTasks();
              },
            );
          },
        ),
      ),
    );
  }

  Future<void> _getCancelledTasks() async {
    _getTaskInProgress = true;
    if (mounted) {
      setState(() {});
    }
    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.progressTasks);
    if (response.isSuccess) {
      TaskListWrapperModel taskListWrapperModel =
          TaskListWrapperModel.fromJson(response.responseData);
      _taskList = taskListWrapperModel.taskList ?? [];
    } else {
      if (mounted) {
        showSnackBarMessage(context,
            response.errorMessage ?? 'Get progress task failed! Try again');
      }
    }
    _getTaskInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }
}
