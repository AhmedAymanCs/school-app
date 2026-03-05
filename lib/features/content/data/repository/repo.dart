import 'package:coureses_platform/features/content/data/models/video_model.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ContentRepo {
  final supa = Supabase.instance.client;
  Future<Either<String, List<VideoModel>>> getContent(String courseId) async {
    try {
      final res = await supa.from('videos').select().eq('course_id', courseId);
      return right(res.map((e) => VideoModel.fromJson(e)).toList());
    } catch (e) {
      return left(e.toString());
    }
  }
}
