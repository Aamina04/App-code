import 'package:ems/constants.dart';
import 'package:ems/dummy/dummy_data.dart';
import 'package:ems/models/location.dart';
import 'package:ems/models/task.dart';
import 'package:dio/dio.dart';
class TaskCore {
  List<Task> tasks = [];
  Future<List<Task>> getRemainingTask() async {
    List<Task> tasks = [];
    const String allTaskEndpoint = '/remainingtask';
    try {
      final response = await Dio().get('$baseUrl$allTaskEndpoint');
      if (response.statusCode == 200) {
        response.data.forEach((doc) {
          tasks.add(Task(
              taskId: doc['task_rep_id'],
              target: Location(ltg: doc['latitude'], lng: doc['longitude']),
              dueDate: doc['task_status'],
              status: doc['longitude'],
              vehcalId: doc['latitude']));
        });
      }
    } catch (e) {
      print("Failed to Get All Tasks : $e");
    }
    return tasks;
  }

  Future<List<Task>> getAllTask() async {
    List<Task> tasks = [];
    const String allTaskEndpoint = '/all_tasks';
    try {
      final response = await Dio().get('$baseUrl$allTaskEndpoint');
      if (response.statusCode == 200) {
        response.data.forEach((doc) {
          tasks.add(Task(
              taskId: doc['task_rep_id'],
              target: Location(ltg: doc['latitude'], lng: doc['longitude']),
              dueDate: doc['task_status'],
              status: doc['latitude'],
              vehcalId: doc['latitude']));
        });
      }
    } catch (e) {
      print("Failed to Get All Tasks : $e");
    }
    return tasks;
  }

  Future<List<Task>> getCompletedTask() async {
    List<Task> tasks = [];
    const String allTaskEndpoint = '/emptrac/apis/comp_task.php?id=01';
    try {
      final response = await Dio().get('$baseUrl$allTaskEndpoint');
      if (response.statusCode == 200) {
        print('dfadsfasfdsafsad');
        
        response.data.forEach((doc) {
          tasks.add(Task(
              taskId: doc['task_rep_id'],
              // target: Location(ltg: doc['latitude'], lng: doc['longitude']),
              // dueDate: doc['task_status'],
              // status: doc['latitude'],
              // vehcalId: doc['latitude']
              ));
        });
        print('tasks => ${tasks.length}');
      }
    } catch (e) {
      print("Failed to Get All Tasks : $e");
    }
    return tasks;
  }

  List<Task> getAssignedTask() {
    print("Fetching Raming task");
    return dummyTaskList;
  }
}
