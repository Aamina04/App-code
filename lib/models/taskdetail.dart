import 'package:geolocator/geolocator.dart';

class TaskDetail{
  final String taskId;
  final String taskDetailId;
  final DateTime dateTime;
  final Position lacation;
  TaskDetail({required this.taskId,required this.taskDetailId,required this.dateTime,required this.lacation});
}