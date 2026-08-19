import 'package:bloc/bloc.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/grade_model.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/grade_repo.dart';

abstract class GradeState {}

class GradeInitial extends GradeState {}

class GradeLoading extends GradeState {}

class GradeClassesLoaded extends GradeState {
  final List<String> classes;
  GradeClassesLoaded(this.classes);
}

class GradeSectionsLoaded extends GradeState {
  final List<String> sections;
  GradeSectionsLoaded(this.sections);
}

class GradeStudentsLoaded extends GradeState {
  final List<StudentModel> students;
  GradeStudentsLoaded(this.students);
}

class GradeSaved extends GradeState {
  final String message;
  GradeSaved(this.message);
}

class GradeError extends GradeState {
  final String message;
  GradeError(this.message);
}

class GradeCubit extends Cubit<GradeState> {
  final GradeRepo repo;
  GradeCubit(this.repo) : super(GradeInitial());

  String? selectedClass;
  String? selectedSection;
  String? selectedGradeType;

  Future<void> fetchClasses() async {
    emit(GradeLoading());
    try {
      final classes = await repo.getClasses();
      emit(GradeClassesLoaded(classes));
    } catch (e) {
      emit(GradeError('فشل  تحميل الفصول'));
    }
  }

  Future<void> fetchSections(String className) async {
    selectedClass = className;
    emit(GradeLoading());
    try {
      final sections = await repo.getSections(className);
      emit(GradeSectionsLoaded(sections));
    } catch (e) {
      emit(GradeError('فشل  تحميل الشعب'));
    }
  }

  Future<void> fetchStudents(String className, String section) async {
    selectedSection = section;
    emit(GradeLoading());
    try {
      final students = await repo.getStudents(className, section);
      emit(GradeStudentsLoaded(students));
    } catch (e) {
      emit(GradeError('فشل  تحميل الطلاب'));
    }
  }

  Future<void> saveGrades({
    required String gradeType,
    required List<GradeModel> grades,
  }) async {
    selectedGradeType = gradeType;
    emit(GradeLoading());
    try {
      final success = await repo.saveGrades(
        className: selectedClass!,
        section: selectedSection!,
        gradeType: gradeType,
        grades: grades,
      );
      if (success) {
        emit(GradeSaved('تم حفظ ${grades.length} درجة بنجاح'));
      } else {
        emit(GradeError('فشل حفظ الدرجات'));
      }
    } catch (e) {
      emit(GradeError('خطأ غير متوقع: ${e.toString()}'));
    }
  }

  void reset() {
    selectedClass = null;
    selectedSection = null;
    selectedGradeType = null;
    emit(GradeInitial());
  }
}

final globalGradeCubit = GradeCubit(GradeRepo());
