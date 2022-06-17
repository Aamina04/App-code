import 'package:ems/constants.dart';
import 'package:ems/models/task.dart';
import 'package:ems/ui/widgets/taskblock.dart';
import 'package:flutter/material.dart';
class TasksDetailPage extends StatefulWidget {
  final String title;
  final Function function;
  const TasksDetailPage({required this.title,required this.function,Key? key}) : super(key: key);
  @override
  State<TasksDetailPage> createState() => _TasksDetailPageState();
}

class _TasksDetailPageState extends State<TasksDetailPage> {
  List<Task> taskList = [];
  bool isLoading = true;
  void getLoad() async{
    taskList = await widget.function();
    setState(() {
      
      isLoading = false;
    });
  }
  @override
  void initState(){
    super.initState();
    getLoad();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 1000,
          backgroundColor: appBarColor,
          automaticallyImplyLeading: true,
      ),),
      body: isLoading == true?
      const Center(
        child: CircularProgressIndicator(
          color: Colors.red,
          strokeWidth: 10,
        ),
      ):
      ListView(
        children: taskList.map((Task task) => TaskBlock(task: task)).toList(),
      ),
    );
  }
}
