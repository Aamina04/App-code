import 'package:ems/models/location.dart';
import 'package:ems/models/task.dart';

List<Task> dummyTaskList = [
  Task(
      taskId: 'RMT',
      target: Location(ltg: 34.034849916373794, lng: 71.43149381330733),
      dueDate: DateTime.now(),
      status: 5,
      vehcalId: '013'),
  Task(
      taskId: 'Abtabad',
      target: Location(ltg: 37.4119983, lng: 73.2215),
      dueDate: DateTime.now(),
      status: 3,
      vehcalId: '011'),
  Task(
      taskId: 'UET Peshawar',
      target: Location(lng: 34.0031559, ltg: 71.4853481),
      dueDate: DateTime.now(),
      status: 4,
      vehcalId: '011'),
  Task(
      taskId: 'UET Peshawar -2 ',
      target: Location(lng: 34.002697, ltg: 71.484808),
      dueDate: DateTime.now(),
      status: 4,
      vehcalId: '011'),
  Task(
      taskId: 'ISLAMIA College-2',
      target: Location(lng: 34.00101586753699, ltg: 71.47996902465822),
      dueDate: DateTime.now(),
      status: 2,
      vehcalId: '011'),
  Task(
      taskId: 'KMC-2',
      target: Location(lng: 33.99957494601919, ltg: 71.48606300354005),
      dueDate: DateTime.now(),
      status: 2,
      vehcalId: '011'),
  Task(
      taskId: 'UOP-2',
      target: Location(lng: 34.00524954489206, ltg: 71.48730754852296),
      dueDate: DateTime.now(),
      status: 1,
      vehcalId: '011'),
  Task(
      taskId: 'Girsl Hostel',
      target: Location(lng: 34.0097002, ltg: 71.4798875),
      dueDate: DateTime.now(),
      status: 1,
      vehcalId: '011'),
  Task(
      taskId: 'Ok Game',
      target: Location(lng: 34.0048962, ltg: 71.4809979),
      dueDate: DateTime.now(),
      status: 2,
      vehcalId: '011'),
];
