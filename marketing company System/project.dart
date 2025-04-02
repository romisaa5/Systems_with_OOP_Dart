
import 'client.dart';
import 'employee.dart';
import 'tasks.dart';

class Project {
  int projectID;
  String projectName;
  Client client;
  String statusProject;
  List<Tasks> tasks = [];
  DateTime startDate;
  DateTime endDate;
  List<Employee> assignedEmployees = [];

  Project(this.projectID, this.projectName, this.client, this.statusProject, this.startDate, this.endDate);

  void addTask(Tasks task) {
    tasks.add(task);
    print('Task "${task.title}" added to project "$projectName"');
  }

  void getTasks() {
    print('Tasks for project "$projectName": ${tasks.map((t) => t.title).toList()}');
  }

  void updateStatus(String newStatus) {
    statusProject = newStatus;
    print('Project "$projectName" status updated to $newStatus');
  }

  void assignEmployee(Employee emp) {
    assignedEmployees.add(emp);
    print('Employee ${emp.name} assigned to project "$projectName"');
  }
}
