import 'package:coureses_platform/core/routing/routes.dart';
import 'package:coureses_platform/core/widgets/custom_button.dart';
import 'package:coureses_platform/features/profile/data/repository/repo.dart';
import 'package:coureses_platform/features/profile/logic/cubit.dart';
import 'package:coureses_platform/features/profile/presentation/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return BlocProvider(
      create: (context) => ProfileCubit(ProfileRepo())..getProfile(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xFFF3F0FA),
            body: state.status == ProfileStatus.loading
                ? const Center(child: CircularProgressIndicator())
                : state.status == ProfileStatus.error
                ? Center(child: Text(state.error))
                : Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.08,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ProfileCard(
                          name: state.user!.name,
                          email: state.user!.email,
                        ),
                        const SizedBox(height: 30),
                        CustomButton(
                          text: 'LogOut',
                          onPressed: () {
                            context.read<ProfileCubit>().logout(context);
                          },
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
