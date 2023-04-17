class Todo {
  final String title;
  final String description;

  late bool completed;

  Todo(this.title, this.description, this.completed);

  // Convert our model json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['description'] = description;
    data['completed'] = completed;

    return data;
  }

  factory Todo.fromJson(json) {
    return Todo(json['title'], json['description'], json['completed']);
  }

  // toString
  @override
  String toString() {
    return 'title: $title , description: $description , completed: ${completed ? 'yes' : 'no'}';
  }
}
