import 'package:coureses_platform/core/constants/color_manager.dart';
import 'package:coureses_platform/core/theme/text_style.dart';
import 'package:coureses_platform/core/widgets/custom_button.dart';
import 'package:coureses_platform/features/course_details/data/repo.dart';
import 'package:coureses_platform/features/course_details/logic/cubit.dart';
import 'package:coureses_platform/features/course_details/logic/state.dart';
import 'package:coureses_platform/core/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({super.key, required this.course});
  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isTablet = size.width >= 600;
    final hPad = size.width * (isTablet ? 0.08 : 0.04);
    return BlocProvider(
      create: (context) =>
          CourseDetailsCubit(CourseDetailsRepo())..checkEnrollment(
            coursesId: course.id,
            usersId: Supabase.instance.client.auth.currentUser!.id,
          ),
      child: BlocConsumer<CourseDetailsCubit, CourseDetailsState>(
        listener: (context, state) {
          if (state is CourseEnrollmentError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
          if (state is CourseEnrollmentSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Enrolled Successfully!')));
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorManager.secondaryColor,
            body: state is CourseEnrollmentLoading
                ? const Center(child: CircularProgressIndicator())
                : CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        expandedHeight: size.height * (isTablet ? 0.42 : 0.38),
                        pinned: true,
                        backgroundColor: ColorManager.secondaryColor,
                        elevation: 0,
                        centerTitle: true,
                        title: Text(
                          'Course Details',
                          style: AppTextStyles.coursetitle.copyWith(
                            fontSize: isTablet ? 22 : 18,
                            color: ColorManager.maintextColor,
                          ),
                        ),
                        flexibleSpace: FlexibleSpaceBar(
                          background: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(
                                course.image,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => Container(
                                  color: ColorManager.secondaryColor,
                                  child: const Icon(
                                    Icons.error,
                                    color: Colors.red,
                                    size: 48,
                                  ),
                                ),
                              ),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      ColorManager.secondaryColor.withOpacity(
                                        0.95,
                                      ),
                                    ],
                                    stops: const [0.5, 1.0],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: hPad,
                            vertical: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                course.title,
                                style: AppTextStyles.coursetitle.copyWith(
                                  fontSize: isTablet ? 26 : 20,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorManager.primaryColor.withOpacity(
                                    0.12,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: ColorManager.primaryColor
                                        .withOpacity(0.4),
                                  ),
                                ),
                                child: Text(
                                  '${course.price} USD',
                                  style: AppTextStyles.courseprice.copyWith(
                                    fontSize: isTablet ? 18 : 15,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              Text(
                                'Description',
                                style: AppTextStyles.coursedescription.copyWith(
                                  fontSize: isTablet ? 20 : 16,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                course.description,
                                style: AppTextStyles.coursedetails.copyWith(
                                  fontSize: isTablet ? 16 : 14,
                                  height: 1.6,
                                ),
                              ),
                              SizedBox(height: size.height * 0.05),
                              Center(
                                child: SizedBox(
                                  width: size.width * (isTablet ? 0.45 : 0.70),
                                  height: isTablet ? 58 : 50,
                                  child: CustomButton(
                                    text:
                                        context
                                            .read<CourseDetailsCubit>()
                                            .isEnrolled
                                        ? 'Enrolled'
                                        : 'Enroll Course',
                                    onPressed:
                                        context
                                            .read<CourseDetailsCubit>()
                                            .isEnrolled
                                        ? null
                                        : () {
                                            context
                                                .read<CourseDetailsCubit>()
                                                .enrollCourse(
                                                  coursesId: course.id,
                                                  usersId: Supabase
                                                      .instance
                                                      .client
                                                      .auth
                                                      .currentUser!
                                                      .id,
                                                );
                                          },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
