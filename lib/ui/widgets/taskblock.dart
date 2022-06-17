import 'package:ems/cores/location_provider.dart';
import 'package:ems/models/task.dart';
import 'package:ems/ui/screans/trackingtask.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskBlock extends StatelessWidget {
  final Task task;
  const TaskBlock({required this.task,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<LocationProvider>(context);
    Widget taskStatusTile(text,icon,color){
      return Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 5,right: 8,top: 10,bottom: 5),
            child: Row(
              children: [
                const Text("Status: "),
                Text(text,style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: icon,
          )
        ],
      );
    }
    return Container(
      margin: const EdgeInsets.only(left: 8,right: 8,top: 5),
      padding: const EdgeInsets.only(left: 5,right: 5,top: 5),
      height: 100,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 2,
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Task ID : ${task.taskId}',),
                  const SizedBox(width: 10,),
                  Text('Vehicale ID : ${task.vehcalId}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  task.taskId==1?const Text("Status: New"):task.status==2?
                  taskStatusTile("Pending",const Icon(Icons.notifications_active,color: Colors.white,size: 18,), Colors.red):task.status==3?
                 taskStatusTile("Completed",const Icon(Icons.done,color: Colors.white,size: 18,), Colors.green,):
                  taskStatusTile("Assigned",const Icon(Icons.star,color: Colors.white,size: 18,), Colors.amber),
                  const SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      taskProvider.setTaskLocation(lat: task.target!.lng,lng: task.target!.ltg);
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const TaskTracking()));
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 6,right: 6,top: 3,bottom: 3),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: const [
                          Text("Track",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),),
                          SizedBox(width: 6,),
                          Icon(Icons.location_on_rounded,color: Colors.white,),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
