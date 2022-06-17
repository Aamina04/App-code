import 'package:dio/dio.dart';
import 'package:ems/constants.dart';
import 'package:ems/cores/taskscore.dart';
import 'package:ems/ui/screans/taskdetail.dart';
import 'package:ems/ui/widgets/block.dart';
import 'package:ems/ui/widgets/myappbar.dart';
import 'package:ems/ui/widgets/mydrawer.dart';
import 'package:fluid_kit/fluid_kit.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final TaskCore taskCore = TaskCore();
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: MyAppBar(),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 6, right: 6,top: 10),
        child: ListView(
          children: [
            // Container(
            //   margin: const EdgeInsets.only(top: 10, left: 10, bottom: 5),
            //   child: const Text(
            //     recentTask,
            //     style: TextStyle(
            //       fontSize: 18,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            // ),
            // this Another Package Screen Size Handle
            Fluid(
              spacing: 10,
              children: [
                Fluidable(
                    minWidth: 280,
                    child: GestureDetector(
                        onTap: () => function(
                            context, "Total Task", taskCore.getAllTask),
                        child: HomeBlock(
                          title: allTask,
                          quantity: 2123,
                          icon: totalsTaskIcon,
                          backgroundColor: Colors.blue.shade100,
                        ))),
                Fluidable(
                    minWidth: 140,
                    child: GestureDetector(
                      onTap: () => function(
                          context, "Completed Task", taskCore.getCompletedTask),
                      child: HomeBlock(
                        title: completedTask,
                        quantity: 113,
                        icon: completedTaskIcon,
                        backgroundColor: Colors.amber.shade100,
                      ),
                    )),
                Fluidable(
                    minWidth: 140,
                    child: GestureDetector(
                      onTap: () async{
                        print('fdasfjsadlfjlksadj');
                        // var response = await Dio().get('http://www.google.com');
                        // print(response);
                        final response = await Dio().get('http://192.168.43.211/emptrac/apis/comp_task.php?id=01');

                      },
                      // function(
                      //     context, "Remaining Task", taskCore.getRemainingTask),
                      child: HomeBlock(
                        title: remainingTasks,
                        quantity: 223,
                        icon: remainingTaskIcon,
                        backgroundColor: Colors.green.shade100,
                      ),
                    )),
                // Fluidable(
                //     minWidth: 140,
                //     child: GestureDetector(
                //       onTap: () => function(
                //           context, "Assigned Task", taskCore.getAssignedTask),
                //       child: HomeBlock(
                //         title: assignTask,
                //         quantity: 2223,
                //         icon: assignedTaskIcon,
                //         backgroundColor: Colors.orange.shade100,
                //       ),
                //     )),
              ],
            )
          ],
        ),
      ),
      drawer: const MyDrawer(),
    );
  }

  void function(context, text, call) {
    // Task Details Screens Where all Task We Show
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                TasksDetailPage(title: text, function: call)));
  }
}
