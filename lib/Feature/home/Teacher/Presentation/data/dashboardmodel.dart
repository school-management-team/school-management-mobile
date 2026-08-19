class Dashboardmodel {
  final String teacherName;
  final String nextLesson;
  final String numOfClasses;
  final String pendingTaskCount;
  final String pendingTaskDetails;
  final String numOfMessages;
  final String messagesSource;

  Dashboardmodel({
    required this.teacherName,
    required this.nextLesson,
    required this.numOfClasses,
    required this.pendingTaskCount,
    required this.pendingTaskDetails,
    required this.messagesSource,
    required this.numOfMessages,
  });

  factory Dashboardmodel.fromJson(Map<String, dynamic> json) {
    return Dashboardmodel(
      teacherName: json['teacher_name']?.toString() ?? '',
      nextLesson: json['next_lesson']?.toString() ?? '',
      numOfClasses: json['num_of_classes']?.toString() ?? '0',
      pendingTaskCount: json['pending_task_count']?.toString() ?? '0',
      pendingTaskDetails: json['pending_task_details']?.toString() ?? '',
      messagesSource: json['messages_source']?.toString() ?? '',
      numOfMessages: json['num_of_messages']?.toString() ?? '0',
    );
  }
}
