import 'package:flutter/material.dart';
import 'package:live_class_project/entities/todo.dart';
import 'package:live_class_project/ui/widgets/empty_list_widget.dart';
import 'package:live_class_project/ui/widgets/todo_item.dart';

class DoneTodoListTab extends StatelessWidget {
  const DoneTodoListTab(
      {super.key,
      required this.todoList,
      required this.onDelete,
      required this.onStatusChange});

  final List<Todo> todoList;
  final Function(int) onDelete;
  final Function(int) onStatusChange;

  @override
  Widget build(BuildContext context) {
    if (todoList.isEmpty) {
      return const EmptyListWidget();
    }

    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (_) {
            onDelete(index);
          },
          child: TodoItem(
            todo: todoList[index],
            onIconButtonPressed: () {
              onStatusChange(index);
            },
          ),
        );
      },
    );
  }
}
