import 'project.dart';

class Client {
  String name;
  int clientID;
  String email;
  String phone;
  String companyName;
  List<Project> projectsForClient = [];

  Client(this.name, this.clientID, this.email, this.phone, this.companyName);

  void addProject(Project project) {
    projectsForClient.add(project);
  }


  void getProjects() {
  print('Projects for $name:');
  for (var project in projectsForClient) {
    print('- ${project.projectName}');
  }


  }

  void updateContactInfo(String newEmail, String newPhone) {
    email = newEmail;
    phone = newPhone;
    print('Updated Contact Info: \n New phone: $newPhone \n New Email: $newEmail');
  }
}