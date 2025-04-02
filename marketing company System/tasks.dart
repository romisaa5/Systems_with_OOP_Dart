
import 'employee.dart';

class Tasks {
  int taskID;
  String title;
  String description;
  Employee? assignedTo;
  DateTime dueDate;
  String status;
  String priority;

  Tasks(this.taskID, this.title, this.description, this.assignedTo, this.dueDate, this.status, this.priority);

  void updateStatus(String newStatus) {
    status = newStatus;
    print('Task "$title" status updated to $newStatus');
  }

  void assignTo(Employee emp) {
    assignedTo = emp;
    print('Task "$title" assigned to ${emp.name}');
  }

  void updateDescription(String newDescription) {
    description = newDescription;
    print('Task "$title" description updated');
  }
}