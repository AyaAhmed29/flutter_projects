import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/core/utils/app_style.dart';
import 'package:todo_app/core/widgets/custom_floating_action_button.dart';
import 'package:todo_app/core/widgets/custom_userInf_app_bar.dart';
import 'package:todo_app/feature/home/view/cubit/home_cubit.dart';
import 'package:todo_app/feature/home/view/cubit/home_state.dart';
import 'package:todo_app/feature/home/view/widgets/in_progress_list_view.dart';
import 'package:todo_app/feature/home/view/widgets/number_container.dart';
import 'package:todo_app/feature/home/view/widgets/task_completion_card.dart';
import 'package:todo_app/feature/home/view/widgets/task_group_list_view.dart';
import 'package:todo_app/feature/task/data/model/task_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {
          GoRouter.of(context).push(AppRouter.addTaskView);
        },
        icon: Assets.assetsImagesIconsFile,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomUserInfAppBar(
              onTap: () => GoRouter.of(context).push(AppRouter.profileView),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 30.h)),

          BlocProvider(
            create: (context) => HomeCubit()..loadTasks(),
            child: Builder(
              builder: (context) {
                return SliverToBoxAdapter(
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if (state is HomeLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is HomeFailure) {
                        return Center(
                          child: Text("Error: ${state.errorMessage}"),
                        );
                      } else if (state is HomeEmpty) {
                        return HomeEmptyWidget(); // عرض رسالة فاضية
                      } else if (state is HomeTasksLoaded) {
                        final tasks = state.tasks;
                        return HomeTasks(
                          tasks: tasks,
                        ); // تمرير المهام للـ HomeTasks
                      }
                      return Container();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HomeEmptyWidget extends StatelessWidget {
  const HomeEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30.h),
        Text(
          'There are no tasks yet,\nPress the button\nTo add New Task ',
          style: AppStyle.light12.copyWith(fontSize: 16.sp),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 39.h),
        Image.asset(Assets.assetsImagesOBJECTS),
      ],
    );
  }
}

class HomeTasks extends StatelessWidget {
  final List<TaskModel> tasks;
  HomeTasks({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: TaskCompletionCard()),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text('In Progress', style: AppStyle.light14),
              SizedBox(width: 10.w),
              NumberContainer(
                number: tasks.length,
                color: AppColors.primaryColor,
              ),
            ],
          ),
        ),
        InProgressListView(tasks: tasks),
        // SizedBox(height: 25.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Text('Task Groups'),
        ),
        TaskGroupListView(tasks: tasks),
      ],
    );
  }
}
