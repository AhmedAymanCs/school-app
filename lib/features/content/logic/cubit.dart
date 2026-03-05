import 'package:coureses_platform/features/content/data/repository/repo.dart';
import 'package:coureses_platform/features/content/logic/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContentCubit extends Cubit<ContentState> {
  final String courseId;
  final ContentRepo contentRepo;
  ContentCubit({required this.contentRepo, required this.courseId})
    : super(ContentState());
  Future<void> getContent() async {
    emit(ContentState(status: ContentStatus.loading));
    final res = await contentRepo.getContent(courseId);
    res.fold(
      (error) => emit(ContentState(status: ContentStatus.error, error: error)),
      (success) =>
          emit(ContentState(status: ContentStatus.success, content: success)),
    );
  }
}
