
import 'employee.dart';
import 'project.dart';

class Department {
  int departmentID;
  String departmentName;
  List<Employee> employees = [];
  List<Project> projects = [];

  Department(this.departmentID, this.departmentName);

  void addEmployee(Employee emp) {
    employees.add(emp);
    print('Employee ${emp.name} added to department $departmentName');
  }

  void removeEmployee(Employee emp) {
    employees.remove(emp);
    print('Employee ${emp.name} removed from department $departmentName');
  }

  void getProjects() {
    print('Projects for $departmentName: ${projects.map((p) => p.projectName).toList()}');
  }
}
