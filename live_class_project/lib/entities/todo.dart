class Todo {
  String title;
  String description;
  DateTime time;
  bool isDone;

  Todo(this.title, this.description, this.time, [this.isDone = false]);
}
