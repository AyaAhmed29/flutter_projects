import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/core/widgets/custom_floating_action_button.dart';
import 'package:todo_app/core/widgets/custom_userInf_App_bar.dart';
import 'package:todo_app/feature/auth/data/model/user_model.dart';
import 'package:todo_app/feature/home/view/cubit/home_cubit/home_cubit.dart';
import 'package:todo_app/feature/home/view/cubit/home_cubit/home_state.dart';
import 'package:todo_app/feature/home/view/cubit/user_cubit/user_cubit.dart';
import 'package:todo_app/feature/home/view/cubit/user_cubit/user_state.dart';
import 'package:todo_app/feature/home/view/widgets/custom_user_inf_appbar_shimmer.dart';
import 'package:todo_app/feature/home/view/widgets/home_empty_widget.dart';
import 'package:todo_app/feature/home/view/widgets/home_tasks.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra;
    final user = extra != null ? extra as UserModel : null;
    
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {
          GoRouter.of(context).push(AppRouter.addTaskView, extra: user);
        },
        icon: Assets.assetsImagesIconsFile,
      ),
      body: CustomScrollView(
        slivers: [
          BlocProvider(
            create: (context) => UserCubit()..getUser(userModel: user),
            child: SliverToBoxAdapter(
              child: BlocBuilder<UserCubit, UserState>(
                builder: (context, state) {
                  if (state is UserFailure) {
                    return Center(child: Text(state.message));
                  } else if (state is UserLoading) {
                    return CustomUserInfAppBarShimmer();
                  } else if (state is UserSuccess) {
                    return
                    // CustomUserInfAppBarShimmer();
                    CustomUserInfAppBar(
                      onTap: () => GoRouter.of(
                        context,
                      ).push(AppRouter.profileView, extra: state.user),
                      userModel: state.user,
                    );
                  }
                  return Container();
                },
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 30.h)),

          BlocProvider(
            create: (context) => HomeCubit()..loadTasks(),
            child: SliverToBoxAdapter(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is HomeFailure) {
                    return Center(child: Text("Error: ${state.errorMessage}"));
                  } else if (state is HomeEmpty) {
                    return HomeEmptyWidget();
                  } else if (state is HomeTasksLoaded) {
                    final tasks = state.tasks;
                    return HomeTasks(tasks: tasks);
                  }
                  return Container();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
