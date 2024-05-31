import 'package:flutter/material.dart';
import 'package:live_class_project/entities/todo.dart';
import 'package:live_class_project/ui/screens/add_new_todo_screen.dart';
import 'package:live_class_project/ui/screens/todo_list/all_todo_list_tab.dart';
import 'package:live_class_project/ui/screens/todo_list/done_todo_list_tab.dart';
import 'package:live_class_project/ui/screens/todo_list/undone_todo_list_tab.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen>
    with SingleTickerProviderStateMixin {
  // late TabController _tabController = TabController(length: 3, vsync: this);
  final List<Todo> _todoList = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
          bottom: _buildTabBar(),
        ),
        body: TabBarView(
          children: [
            AllTodoListTab(
              onDelete: _deleteTodo,
              onStatusChange: _toggleTodoStatus,
              todoList: _todoList,
            ),
            UndoneTodoListTab(
              onDelete: _deleteTodo,
              onStatusChange: _toggleTodoStatus,
              todoList: _todoList.where((item) => item.isDone == false).toList(),
            ),
            DoneTodoListTab(
              onDelete: _deleteTodo,
              onStatusChange: _toggleTodoStatus,
              todoList: _todoList.where((item) => item.isDone == true).toList(),
            ),
          ],
        ),
        floatingActionButton: _buildAddTodoFAB(),
      ),
    );
  }

  FloatingActionButton _buildAddTodoFAB() {
    return FloatingActionButton.extended(
      tooltip: 'Add new todo',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddNewTodoScreen(onAddTodo: _addNewTodo),
          ),
        );
      },
      label: const Text('Add'),
      icon: const Icon(Icons.add),
    );
  }

  TabBar _buildTabBar() {
    return const TabBar(
      tabs: [
        Tab(
          text: 'All',
        ),
        Tab(
          text: 'Undone',
        ),
        Tab(
          text: 'Done',
        ),
      ],
    );
  }

  void _addNewTodo(Todo todo) {
    _todoList.add(todo);
    if (mounted) {
      setState(() {});
    }
  }

  void _deleteTodo(int index) {
    _todoList.removeAt(index);
    if (mounted) {
      setState(() {});
    }
  }

  void _toggleTodoStatus(int index) {
    _todoList[index].isDone = !_todoList[index].isDone;
    if (mounted) {
      setState(() {});
    }
  }
}
