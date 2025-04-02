
import 'department.dart';
import 'tasks.dart';

class Employee {
  String name;
  int employeeID;
  String email;
  String phone;
  String position;
  Department? department;
  List<Tasks> assignedTasks = [];

  Employee(this.name, this.employeeID, this.email, this.phone, this.position, this.department);

  void assignTask(Tasks task) {
    assignedTasks.add(task);
  }

  void getTasks() {
    print('Tasks for $name: ${assignedTasks.map((t) => t.title).toList()}');
  }

  void updatePosition(String newPosition) {
    position = newPosition;
    print('New Position: $newPosition');
  }
}