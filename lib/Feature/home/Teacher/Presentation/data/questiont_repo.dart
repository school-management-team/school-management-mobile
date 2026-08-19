import 'package:school/Feature/home/Teacher/Presentation/data/QuestionModel.dart';

class QuestRepo {
  List<QuestionModel> mockquestion = [
    QuestionModel(
      id: '1',
      difficulty: "سهل",
      options: ['5', '8', '10'],
      questionText: 'ماهو ناتج 5+3 ؟',
      subject: "رياضيات",
      typequestion: 'خيارات متعددة',
      creataAt: DateTime.now().subtract(Duration(days: 1)),
      isBookMarked: false,
      usage: 50,
    ),
    QuestionModel(
      id: '2',
      difficulty: "صعب",
      questionText: 'اشرح مبدأحفظ الطاقة',
      subject: "الفيزياء",
      typequestion: 'مقال',
      creataAt: DateTime.now().subtract(Duration(days: 2)),
      isBookMarked: false,
      usage: 20,
    ),
    QuestionModel(
      id: '3',
      difficulty: "متوسط",
      // options: ['5', '8', '10'],
      questionText: 'الفعل المضارع يبنى دائما إذا تصلت به نون النسوة ',
      subject: "عربي",
      typequestion: 'صح / خطأ',
      creataAt: DateTime.now().subtract(Duration(days: 3)),
      isBookMarked: false,
      usage: 15,
    ),
  ];
  Future<List<QuestionModel>> getallquest() async {
    await Future.delayed(Duration(milliseconds: 500));
    return mockquestion;
  }

  Future<bool> addquest(QuestionModel question) async {
    await Future.delayed(Duration(milliseconds: 500));
    mockquestion.add(question);
    return true;
  }

  Future<List<QuestionModel>> searchquestion({
    String? query,
    String? subject,
    String? difficulty,
  }) async {
    await Future.delayed(Duration(milliseconds: 500));
    return mockquestion.where((q) {
      bool match = true;
      if (subject != null && subject.isNotEmpty) {
        match = match && q.subject == subject;
      }
      if (difficulty != null && difficulty.isNotEmpty) {
        match = match && q.difficulty == difficulty;
      }
      return true;
    }).toList();
  }

  Future<bool> update(QuestionModel question) async {
    await Future.delayed(Duration(milliseconds: 500));
    final index = mockquestion.indexWhere((q) => q.id == question.id);
    if (index != -1) {
      mockquestion[index] = question;
      return true;
    }
    return false;
  }
}
