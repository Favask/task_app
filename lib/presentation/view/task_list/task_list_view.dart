import 'package:flutter/material.dart';
import 'package:profile_app/base/base_constants.dart';
import 'package:profile_app/base/navigator_key.dart';
import 'package:profile_app/presentation/provider/task/task_list_provider.dart';
import 'package:profile_app/presentation/view/drawer.dart';
import 'package:profile_app/presentation/view/task_list/task_detail_view.dart';
import 'package:provider/provider.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  void initState() {
    TaskListProvider provider = NavigatorKey.navKey.currentState!.context.read<TaskListProvider>();
    provider.fetchTaskList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskListProvider>(
      builder: (context, value, child) => Scaffold(
        drawer: const DrawerScreen(),
        appBar: AppBar(
          backgroundColor: themeColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: ListView.builder(
                itemCount: value.data.length,
                itemBuilder: (context, index) => Column(children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  TaskDetails(id: index)));

                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              value.data[index].name ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          _buildRequirement('Description', Text('${value.data[index].description ?? ''} ')),
                          _buildRequirement('Percentage', Text('${value.data[index].percentage ?? ''} ')),
                          _buildRequirement('Status', Text('${value.data[index].status ?? ''} '))
                        ],
                      ),
                    ),
                  )
                ]),
              )),
              SafeArea(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeColor, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: const Size(double.infinity, 48),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const TaskDetails()));
                  },
                  child: const Text('Create A Task'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRequirement(String title, Widget value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.grey),
            ),
            value
          ],
        ),
      ),
    );
  }
}
