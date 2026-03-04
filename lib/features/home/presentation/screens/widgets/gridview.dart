import 'package:coureses_platform/core/constants/color_manager.dart';
import 'package:coureses_platform/core/routing/routes.dart';
import 'package:coureses_platform/core/theme/text_style.dart';
import 'package:coureses_platform/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CoursesGridView extends StatelessWidget {
  final List courses;

  const CoursesGridView({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final crossAxisCount = screenWidth < 600
        ? 2
        : screenWidth < 900
        ? 3
        : 4;

    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenHeight * 0.01,
        ),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: courses.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: screenHeight * 0.01,
            crossAxisSpacing: screenWidth * 0.02,
            childAspectRatio: screenWidth < 400 ? 0.65 : 0.75,
          ),
          itemBuilder: (context, index) {
            final course = courses[index];
            return _CourseCard(course: course, screenWidth: screenWidth);
          },
        ),
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  final dynamic course;
  final double screenWidth;

  const _CourseCard({required this.course, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ColorManager.primaryColor),
        color: ColorManager.secondaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  course.image,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image, size: 50),
                ),
              ),
            ),

            const SizedBox(height: 6),

            Flexible(
              flex: 2,
              child: Text(
                course.title,
                style: AppTextStyles.s18w600.copyWith(
                  fontSize: screenWidth < 400 ? 12 : 14,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              '${course.price} USD',
              style: AppTextStyles.s18w600.copyWith(
                fontSize: screenWidth < 400 ? 11 : 13,
              ),
            ),

            const SizedBox(height: 6),

            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: 'Details',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.coursedetails,
                    arguments: course,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
