import 'package:coureses_platform/core/routing/routes.dart';
import 'package:coureses_platform/features/content/data/repository/repo.dart';
import 'package:coureses_platform/features/content/logic/cubit.dart';
import 'package:coureses_platform/features/content/logic/state.dart';
import 'package:coureses_platform/features/content/presentation/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContentPage extends StatelessWidget {
  final String courseId;
  const ContentPage({super.key, required this.courseId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ContentCubit(contentRepo: ContentRepo(), courseId: courseId)
            ..getContent(),
      child: Scaffold(
        appBar: AppBar(title: Text('Content')),
        body: SafeArea(
          child: BlocBuilder<ContentCubit, ContentState>(
            builder: (context, state) {
              if (state.status == ContentStatus.error) {
                return Center(child: Text(state.error));
              }
              if (state.status == ContentStatus.success) {
                return ListView.builder(
                  itemCount: state.content.length,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  itemBuilder: (context, index) {
                    final lesson = state.content[index];
                    return VideoCard(
                      title: lesson.title,
                      subtitle: lesson.description,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.videoviewer,
                          arguments: lesson.videoUrl,
                        );
                      },
                    );
                  },
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
