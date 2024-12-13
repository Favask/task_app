import 'package:flutter/material.dart';
import 'package:profile_app/base/base_constants.dart';
import 'package:profile_app/base/navigator_key.dart';
import 'package:profile_app/data/model/task_detail_model.dart';
import 'package:profile_app/presentation/provider/task/task_detail_provider.dart';
import 'package:provider/provider.dart';

class TaskDetails extends StatefulWidget {
  const TaskDetails({super.key, this.id});
   final int? id;
  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {

  @override
  void initState() {
    TaskDetailProvider provider = NavigatorKey.navKey.currentState!.context.read<TaskDetailProvider>();
    provider.fetchTaskDetail(id: widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskDetailProvider>(
        builder: (context, value, child) => Scaffold(
              appBar: AppBar(
                title: const Text("Task Details", style: TextStyle(color: Colors.black)),
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              resizeToAvoidBottomInset: true,
              body: Column(
                children: [
                  CustomTextFormField(
                    controller: value.nameController,
                    labelText: "Name",
                  ),
                  CustomTextFormField(
                    labelText: "Description",
                    controller: value.descriptionController,
                  ),  CustomTextFormField(
                    labelText: "Deadline",
                    controller: value.deadLineController,
                  ),
                  if (value.data?.projectRolls != null)
                    RoundedImageHorizontalList(
                      items: value.data?.projectRolls ?? [],
                    ),
                  if (value.data?.projectActivity != null)
                    ActivityTimeline(
                      activities: value.data?.projectActivity ?? [],
                    ),
                  Expanded(child: SizedBox()),
                  SafeArea(
                    child: Row(children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              value.deleteTask(id: widget.id);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: themeColor, // Button color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'delete',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 4),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              value.saveTaskDetail(id: widget.id);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: themeColor, // Button color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Save',
                            ),
                          ),
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            ));
  }
}

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final bool? enabled;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final EdgeInsetsGeometry? padding;
  final InputBorder? border;
  final TextStyle? labelStyle;
  final bool? filled;
  final Color? fillColor;

  const CustomTextFormField({
    Key? key,
    this.controller,
    required this.labelText,
    this.enabled,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.onChanged,
    this.padding,
    this.border,
    this.labelStyle,
    this.filled,
    this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          label: Text(
            labelText,
            style: labelStyle,
          ),
          border: border ?? const OutlineInputBorder(),
          enabledBorder: border,
          suffixIcon: suffixIcon,
          filled: filled,
          fillColor: fillColor,
        ),
        enabled: enabled,
        keyboardType: keyboardType,
        validator: validator,
        obscureText: obscureText,
        onChanged: onChanged,
      ),
    );
  }
}

class ActivityTimeline extends StatelessWidget {
  final List<ProjectActivity> activities;

  const ActivityTimeline({Key? key, required this.activities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: activities.length,
      itemBuilder: (context, index) {
        return TimelineItem(
          activity: activities[index],
          isFirst: index == 0,
          isLast: index == activities.length - 1,
        );
      },
    );
  }
}

class TimelineItem extends StatelessWidget {
  final ProjectActivity activity;
  final bool isFirst;
  final bool isLast;

  const TimelineItem({
    Key? key,
    required this.activity,
    this.isFirst = false,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Vertical line
          Column(
            children: [
              if (!isFirst)
                Expanded(
                  child: Container(
                    width: 2,
                    color: Colors.grey[300],
                  ),
                ),
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: Colors.grey[300],
                  ),
                ),
            ],
          ),

          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    activity.activity ?? 'No activity description',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    activity.data ?? '--',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedImageHorizontalList extends StatelessWidget {
  // List of items with image URL and subtitle
  final List<ProjectRoll> items;

  const RoundedImageHorizontalList({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 16 : 8,
              right: index == items.length - 1 ? 16 : 8,
              bottom: 8,
              top: 8,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Rounded Image
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(items[index].image ?? ''),
                      fit: BoxFit.cover,
                      onError: (exception, stackTrace) {
                        // Fallback image or error handling
                        BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                        );
                      },
                    ),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                // Subtitle
                Text(
                  items[index].name ?? '',
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
