class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  //static list of todos to begin with
  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Web Apps Assignment 4', isDone: true ),
      ToDo(id: '02', todoText: 'Put the groceries inside freezer', isDone: true ),
      ToDo(id: '03', todoText: 'Final Project submission : Game Design', ),
      ToDo(id: '04', todoText: 'App pitch Portfolio 2', ),
      ToDo(id: '05', todoText: 'Work on flutter  app for 2 hour', ),
      ToDo(id: '06', todoText: 'Shift at 2', ),
    ];
  }
}