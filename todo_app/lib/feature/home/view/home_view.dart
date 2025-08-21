import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/core/widgets/custom_floating_action_button.dart';
import 'package:todo_app/core/widgets/custom_userInf_app_bar.dart';
import 'package:todo_app/feature/home/view/cubit/home_cubit.dart';
import 'package:todo_app/feature/home/view/cubit/home_state.dart';
import 'package:todo_app/feature/home/view/widgets/home_empty_widget.dart';
import 'package:todo_app/feature/home/view/widgets/home_tasks.dart';

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
                        return HomeEmptyWidget(); 
                      } else if (state is HomeTasksLoaded) {
                        final tasks = state.tasks;
                        return HomeTasks(
                          tasks: tasks,
                        ); 
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