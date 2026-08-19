import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/QuestionModel.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/questiont_repo.dart';

abstract class QuestionBankstate {}

class QuestionInitial extends QuestionBankstate {}

class QuestionLoading extends QuestionBankstate {}

class QuestionLoaded extends QuestionBankstate {
  final List<QuestionModel> questions;
  final int totalQuestions;
  final int savedQuestions;
  final int recentlyAdded;

  QuestionLoaded({
    required this.questions,
    required this.recentlyAdded,
    required this.savedQuestions,
    required this.totalQuestions,
  });
}

class QuestionError extends QuestionBankstate {
  final String message;
  QuestionError(this.message);
}

class QuestionCubit extends Cubit<QuestionBankstate> {
  final QuestRepo repo;
  QuestionCubit(this.repo) : super(QuestionInitial());

  List<QuestionModel> allquestion = [];
  String? currentfiltersubject;
  String? currentfilterdifficulty;
  String? searchQuery;

  Future<void> fetchquestions() async {
    emit(QuestionLoading());
    try {
      allquestion = await repo.getallquest();
      emitLoadedState();
    } catch (e) {
      emit(QuestionError('فشل تحميل الأسئلة: ${e.toString()}'));
    }
  }

  void searchquestion({String? query, String? subject, String? difficulty}) {
    searchQuery = query;
    currentfiltersubject = subject;
    currentfilterdifficulty = difficulty;

    emit(QuestionLoading());
    try {
      List<QuestionModel> results = List.from(allquestion);

      if (query != null && query.isNotEmpty) {
        results = results
            .where(
              (q) =>
                  q.questionText.contains(query) ||
                  q.subject.contains(query) ||
                  q.typequestion.contains(query) ||
                  q.difficulty.contains(query),
            )
            .toList();
      }

      if (subject != null && subject.isNotEmpty) {
        results = results.where((q) => q.subject == subject).toList();
      }

      if (difficulty != null && difficulty.isNotEmpty) {
        results = results.where((q) => q.difficulty == difficulty).toList();
      }

      final today = DateTime.now();
      final recent = results
          .where(
            (q) => q.creataAt.isAfter(today.subtract(const Duration(days: 7))),
          )
          .length;

      final savedQuestions = results.where((q) => q.isBookMarked).length;

      emit(
        QuestionLoaded(
          questions: results,
          recentlyAdded: recent,
          savedQuestions: savedQuestions,
          totalQuestions: results.length,
        ),
      );
    } catch (e) {
      emit(QuestionError('فشل في البحث: ${e.toString()}'));
    }
  }

  void filterQuestion({String? subject, String? difficulty}) {
    currentfilterdifficulty = difficulty;
    currentfiltersubject = subject;
    applyFilters();
  }

  void applyFilters() {
    emit(QuestionLoading());
    try {
      List<QuestionModel> filtered = List.from(allquestion);

      if (searchQuery != null && searchQuery!.isNotEmpty) {
        filtered = filtered
            .where((q) => q.questionText.contains(searchQuery!))
            .toList();
      }

      if (currentfiltersubject != null && currentfiltersubject!.isNotEmpty) {
        filtered = filtered
            .where((q) => q.subject == currentfiltersubject)
            .toList();
      }

      if (currentfilterdifficulty != null &&
          currentfilterdifficulty!.isNotEmpty) {
        filtered = filtered
            .where((q) => q.difficulty == currentfilterdifficulty)
            .toList();
      }
      final today = DateTime.now();
      final recent = filtered
          .where(
            (q) => q.creataAt.isAfter(today.subtract(const Duration(days: 7))),
          )
          .length;

      final savedQuestions = filtered.where((q) => q.isBookMarked).length;

      emit(
        QuestionLoaded(
          questions: filtered,
          recentlyAdded: recent,
          savedQuestions: savedQuestions,
          totalQuestions: filtered.length,
        ),
      );
    } catch (e) {
      emit(QuestionError('فشل التصفية: ${e.toString()}'));
    }
  }

  void resetFilters() {
    searchQuery = null;
    currentfiltersubject = null;
    currentfilterdifficulty = null;
    fetchquestions();
  }

  void emitLoadedState() {
    final today = DateTime.now();
    final recent = allquestion
        .where(
          (q) => q.creataAt.isAfter(today.subtract(const Duration(days: 7))),
        )
        .length;

    final savedQuestions = allquestion.where((q) => q.isBookMarked).length;

    emit(
      QuestionLoaded(
        questions: List.from(allquestion),
        recentlyAdded: recent,
        savedQuestions: savedQuestions,
        totalQuestions: allquestion.length,
      ),
    );
  }

  Future<void> addquestion(QuestionModel question) async {
    try {
      final success = await repo.addquest(question);
      if (success) {
        await fetchquestions();
      } else {
        emit(QuestionError('فشل إضافة السؤال'));
      }
    } catch (e) {
      emit(QuestionError('خطأ غير متوقع: ${e.toString()}'));
    }
  }

  void toggleBookMark(String id) {
    final index = allquestion.indexWhere((q) => q.id == id);
    if (index != -1) {
      allquestion[index].isBookMarked = !allquestion[index].isBookMarked;
      repo.update(allquestion[index]);
      emitLoadedState();
    }
  }

  void incrementUsage(String id) {
    final index = allquestion.indexWhere((q) => q.id == id);
    if (index != -1) {
      allquestion[index].usage += 1;
      repo.update(allquestion[index]);
      emitLoadedState();
    }
  }
}

final globalQuestionCubit = QuestionCubit(QuestRepo());
