import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/grade_model.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/task_repo_tostud.dart';
import 'package:school/Feature/home/Teacher/Presentation/data/taskandactivitymodel.dart';

abstract class Classstate {}

class ClassInitial extends Classstate {}

class ClassLoading extends Classstate {}

class SectionStudentLoaded extends Classstate {
  final List<StudentModel> students;
  SectionStudentLoaded(this.students);
}

class SectionStudentLoading extends Classstate {}

class GradeSavedSuccess extends Classstate {
  final String message;
  GradeSavedSuccess(this.message);
}

class GradeSavedError extends Classstate {
  final String message;
  GradeSavedError(this.message);
}

class ClassLoaded extends Classstate {
  final List<ClassModel> classes;
  final List<ActivityModel> activities;
  ClassLoaded({required this.classes, required this.activities});
}

class ClassError extends Classstate {
  final String message;
  ClassError(this.message);
}

class ClassCubit extends Cubit<Classstate> {
  final Taskforstud repo;
  ClassCubit(this.repo) : super(ClassInitial());
  //,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
  Future<void> fetchData() async {
    emit(ClassLoading());
    try {
      final classes = await repo.getclasses();
      final activities = await repo.getactivities();
      emit(ClassLoaded(classes: classes, activities: activities));
    } catch (e) {
      emit(ClassError('فشل في تحميل البيانات'));
    }
  }

  //......................................
  Future<void> fetchclasses() async {
    emit(ClassLoading());
    try {
      final classes = await repo.getclasses();
      final currentState = state;
      List<ActivityModel> activities = [];
      if (currentState is ClassLoaded) {
        activities = currentState.activities;
      }
      emit(ClassLoaded(classes: classes, activities: activities));
    } catch (e) {
      emit(ClassError('فشل في تحميل الفصول'));
    }
  }

  //.........................................
  Future<void> fetchactivities() async {
    emit(ClassLoading());
    try {
      final activities = await repo.getactivities();
      final currentState = state;
      List<ClassModel> classes = [];
      if (currentState is ClassLoaded) {
        classes = currentState.classes;
      }
      emit(ClassLoaded(classes: classes, activities: activities));
    } catch (e) {
      emit(ClassError('فشل في تحميل النشاطات'));
    }
  }

  //..................................................
  Future<void> fetchStudentsBySectionId(String sectionId) async {
    emit(SectionStudentLoading());
    try {
      final students = await repo.getStudentsBySection(sectionId);
      emit(SectionStudentLoaded(students));
    } catch (e) {
      emit(GradeSavedError('فشل في تحميل قائمة الطلاب'));
    }
  }

  Future<void> saveSectionGrades({
    required String sectionId,
    required String gradeType,
    required List<GradeModel> grades,
  }) async {
    emit(SectionStudentLoading());
    try {
      await repo.saveGrades(
        sectionId: sectionId,
        gradeType: gradeType,
        grades: grades,
      );
      emit(GradeSavedSuccess('تم حفظ الدرجات بنجاح'));
    } catch (e) {
      emit(GradeSavedError('حدث خطأ أثناء حفظ الدرجات'));
    }
  }
}

final globalClassesCubit = ClassCubit(Taskforstud());
