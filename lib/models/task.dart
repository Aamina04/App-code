import 'package:ems/models/location.dart';

class Task{
   String? taskId;
   Location? target;
   DateTime? dueDate;
   int? status;
   String? vehcalId;
  Task({
   this.taskId,
     this.target,
     this.dueDate,
     this.status,
     this.vehcalId}
    );

    Task.fromJson(json){
      taskId = json['task_rep_id'];
    }

}