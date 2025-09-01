import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/core/widgets/custom_floating_action_button.dart';
import 'package:todo_app/core/widgets/custom_userInf_App_bar.dart';
import 'package:todo_app/core/widgets/taskList_shimmer.dart';
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

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserCubit()..getUser(userModel: user)),
        BlocProvider(create: (_) => HomeCubit()..loadTasks()),
      ],
      child: Scaffold(
        floatingActionButton: CustomFloatingActionButton(
          onPressed: () {
            context.push(AppRouter.addTaskView, extra: user);
          },
          icon: Assets.assetsImagesIconsFile,
        ),
        body: Builder(
          builder: (context) {
            return CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),

              slivers: [
                SliverToBoxAdapter(
                  child: BlocBuilder<UserCubit, UserState>(
                    builder: (context, state) {
                      if (state is UserFailure) {
                        return Center(child: Text(state.message));
                      } else if (state is UserLoading) {
                        return CustomUserInfAppBarShimmer();
                      } else if (state is UserSuccess) {
                        return CustomUserInfAppBar(
                          onTap: () => context.push(
                            AppRouter.profileView,
                            extra: state.user,
                          ),
                          userModel: state.user,
                        );
                      }
                      return SizedBox.shrink();
                    },
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 30.h)),
                SliverToBoxAdapter(
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if (state is HomeLoading) {
                        return TaskListShimmer();
                      } else if (state is HomeFailure) {
                        return Center(
                          child: Text("Error: ${state.errorMessage}"),
                        );
                      } else if (state is HomeEmpty) {
                        return HomeEmptyWidget();
                      } else if (state is HomeTasksLoaded) {
                        return HomeTasks(tasks: state.tasks);
                      }
                      return SizedBox.shrink();
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
