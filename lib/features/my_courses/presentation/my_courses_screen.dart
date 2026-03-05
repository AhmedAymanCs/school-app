import 'package:coureses_platform/core/routing/routes.dart';
import 'package:coureses_platform/features/my_courses/data/repo/repo.dart';
import 'package:coureses_platform/features/my_courses/logic/cubit.dart';
import 'package:coureses_platform/features/my_courses/logic/state.dart';
import 'package:coureses_platform/features/my_courses/presentation/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCoursesPage extends StatelessWidget {
  const MyCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyCoursesCubit(MyCoursesRepo())..getMyCourses(),
      child: BlocBuilder<MyCoursesCubit, MyCoursesState>(
        builder: (context, state) {
          if (state is MyCoursesError) {
            return Center(child: Text(state.error));
          }
          if (state is MyCoursesSuccess) {
            return ListView.builder(
              itemCount: state.myCourses.length,
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemBuilder: (context, index) {
                final lesson = state.myCourses[index];
                return LessonCard(
                  image: lesson.image,
                  title: lesson.title,
                  subtitle: lesson.description,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.content,
                      arguments: lesson.id,
                    );
                    print('Tapped on course : ${lesson.title}');
                  },
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
