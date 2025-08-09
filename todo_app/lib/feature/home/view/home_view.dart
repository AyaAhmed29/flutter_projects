import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/core/utils/app_style.dart';
import 'package:todo_app/core/widgets/custom_userInf_app_bar.dart';
import 'package:todo_app/feature/home/view/widgets/in_progress_list_view.dart';
import 'package:todo_app/feature/home/view/widgets/task_completion_card.dart';
import 'package:todo_app/feature/task/view/widgets/task_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).push(AppRouter.addTaskView);
        },
        shape: const CircleBorder(),
        backgroundColor: AppColors.primaryColor,
        child: Image.asset(Assets.assetsImagesIconsFile),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomUserInfAppBar(
              onTap: () => GoRouter.of(context).push(AppRouter.profileView),
            ),
            SizedBox(height: 50),
            Text(
              'There are no tasks yet,\nPress the button\nTo add New Task ',
              style: AppStyle.light12.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            GestureDetector(
              onDoubleTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => const Home())),
              child: Image.asset(Assets.assetsImagesOBJECTS),
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).push(AppRouter.addTaskView);
        },
        shape: const CircleBorder(),
        backgroundColor: AppColors.primaryColor,
        child: Image.asset(Assets.assetsImagesIconsFile),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomUserInfAppBar(),
          SizedBox(height: 20),
          Center(child: TaskCompletionCard()),
          InProgressListView(),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text('Task Groups'),
          ),
          TaskField(
            text: 'Personal Task',
            prefixIcon: Assets.assetsImagesIconsProfileWithoutBackground,

            color: AppColors.primaryColor,
            number: 5,
          ),
          TaskField(
            text: 'Home Task',
            prefixIcon: Assets.assetsImagesIconsHomeWithoutBackground,
            color: AppColors.pink,
            number: 5,
          ),
          TaskField(
            text: 'Work Task',
            prefixIcon: Assets.assetsImagesIconsWorkWithoutBackground,
            color: AppColors.black,
            number: 1,
          ),
        ],
      ),
    );
  }
}
