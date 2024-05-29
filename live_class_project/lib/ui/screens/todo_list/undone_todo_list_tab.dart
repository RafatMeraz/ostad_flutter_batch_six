import 'package:flutter/material.dart';
import 'package:live_class_project/entities/todo.dart';
import 'package:live_class_project/ui/widgets/todo_item.dart';

class UndoneTodoListTab extends StatelessWidget {
  const UndoneTodoListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (_) {},
          child: TodoItem(
            todo: Todo(
                'Title will be here', 'descriptionm asdfjdf', DateTime.now()),
            onIconButtonPressed: () {},
          ),
        );
      },
    );
  }
}
