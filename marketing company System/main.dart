



import 'client.dart';
import 'department.dart';
import 'employee.dart';
import 'project.dart';
import 'tasks.dart';

void main() {
  // objects 
  Client client1 = Client("Ahmed", 101, "ahmed@example.com", "0123456789", "Tech Corp");
  Employee emp1 = Employee("Sara", 201, "sara@example.com", "01122334455", "Developer", null);
  Employee emp2 = Employee("Ali", 202, "ali@example.com", "01555667788", "Designer", null);
  Department dept1 = Department(1, "IT Department");
  Project project1 = Project(301, "New App", client1, "In Progress", DateTime(2025, 1, 1), DateTime(2025, 6, 1));
  Tasks task1 = Tasks(401, "Design UI", "Create user interface for the app", emp2, DateTime(2025, 3, 1), "Pending", "High");
  
 
  client1.addProject(project1);
  client1.getProjects();
  
  
  client1.updateContactInfo("ahmed.new@example.com", "01012345678");
  
  dept1.addEmployee(emp1);
  dept1.addEmployee(emp2);
  dept1.getProjects();

  emp2.assignTask(task1);
  emp2.getTasks();
  

  task1.updateStatus("Completed");
  

  project1.addTask(task1);
  project1.getTasks();

  project1.updateStatus("Completed");
  
  
   
  project1.assignEmployee(emp1);
  project1.assignEmployee(emp2);
}