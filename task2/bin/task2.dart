import 'package:task2/task2.dart' as task2;
import 'dart:io';

void main() {
  List<String> tasks = [];
  List<String> completedTasks = [];

  while (true) {
    run(tasks, completedTasks); //run program as long as user continues actions
    print('Continue? Press n for No and any other button for Yes.');
    String cont = stdin.readLineSync()!.toLowerCase();
    if (cont == 'n') {
      break;
    }
  }
}

void run(List<String> tasks, List<String> completedTasks) {
  print(
      "To-Do List Manager, choose an action to perform:\n" //show all available actions
      "1- Add a new task. \n"
      "2- View task list. \n"
      "3- Mark a task as completed. \n"
      "4- Delete a task. \n"
      "5- View completed tasks. \n");

  int choice = int.parse(stdin.readLineSync()!);

  switch (choice) {
    //executing action based on user input
    case 1:
      add_task(tasks);
      break;
    case 2:
      view_tasks(tasks);
      break;
    case 3:
      complete_task(tasks, completedTasks);
      break;
    case 4:
      delete_task(tasks);
      break;
    case 5:
      print("(Completed)");
      view_tasks(completedTasks);
      break;
    default:
      print("Input Not Valid.");
      return;
  }
}

void add_task(List<String> tasks) {
  print('Please type the task you want to add:');
  String task = stdin.readLineSync()!;
  if (task.isNotEmpty) {
    //check that user input is not an empty line
    tasks.add(task); // then add to tasks list
    print('New task added successfully.');
  }
}

void view_tasks(List<String> tasks) {
  if (tasks.isEmpty) {
    print("You have no tasks in your list.");
    return;
  }
  print('Your Current To-Do List:');
  for (String task in tasks) {
    var index =
        tasks.indexOf(task) + 1; //view tasks with numbers starting from 1
    print("$index. $task"); //to manage tasks easier
  }
}

void complete_task(List<String> tasks, List<String> completedTasks) {
  print('Enter the number of the task you completed:');
  int index = int.parse(stdin.readLineSync()!) - 1; //choose number of task
  completedTasks.add(tasks[index]); //save in in completed list
  tasks[index] =
      '${tasks[index]} (completed)'; //and mark it as completed in original list
}

void delete_task(List<String> tasks) {
  print('Enter the number of the task you want to delete: ');
  int index =
      int.parse(stdin.readLineSync()!) - 1; //task index is shown number - 1
  if (index < 0 || index >= tasks.length) {
    //check if task number is within list range
    print('Number Not Valid');
    return;
  }
  if (tasks.isNotEmpty) {
    //if index is valid then remove the corresponding task
    tasks.removeAt(index);
  }
}
