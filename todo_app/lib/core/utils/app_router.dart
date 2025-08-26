import 'package:go_router/go_router.dart';
import 'package:todo_app/feature/auth/view/login_view.dart';
import 'package:todo_app/feature/auth/view/register_view.dart';
import 'package:todo_app/feature/home/view/home_view.dart';
import 'package:todo_app/feature/onboarding/view/onboarding%20_view.dart';
import 'package:todo_app/feature/profile/view/change_password_view.dart';
import 'package:todo_app/feature/profile/view/profile_view.dart';
import 'package:todo_app/feature/profile/view/setting_view.dart';
import 'package:todo_app/feature/profile/view/update_profile_view.dart';
import 'package:todo_app/feature/splash/view/splash_view.dart';
import 'package:todo_app/feature/task/data/model/task_model.dart';
import 'package:todo_app/feature/task/view/add_task_view.dart';
import 'package:todo_app/feature/task/view/edit_task_view.dart';
import 'package:todo_app/feature/task/view/today_tasks_view.dart';

abstract class AppRouter {
  static const String onboardingView = '/onboardingView';
  static const String registerView = '/RegisterView';
  static const String loginView = '/LoginView';
  static const String homeView = '/HomeView';
  static const String addTaskView = '/AddTaskView';
  static const String profileView = '/ProfileView';
  static const String updateProfileView = '/UpdateProfileView';
  static const String changePasswordView = '/ChangePasswordView';
  static const String todayTasksView = '/TodayTasksView';
  static const String editTaskView = '/EditTaskView';
  static const String settingView = '/SettingView';

  static final router = GoRouter(
    routes: [
      GoRoute(builder: (context, state) => const SplashView(), path: '/'),
      GoRoute(
        builder: (context, state) => const OnboardingView(),
        path: onboardingView,
      ),
      GoRoute(
        builder: (context, state) => const RegisterView(),
        path: registerView,
      ),
      GoRoute(builder: (context, state) => const LoginView(), path: loginView),
      GoRoute(builder: (context, state) => const HomeView(), path: homeView,),
      GoRoute(
        builder: (context, state) => const AddTaskViwe(),
        path: addTaskView,
      ),
      GoRoute(
        builder: (context, state) => const ProfileView(),
        path: profileView,
      ),
      GoRoute(
        builder: (context, state) => const UpdateProfileView(),
        path: updateProfileView,
      ),
      GoRoute(
        builder: (context, state) => const ChangePasswordView(),
        path: changePasswordView,
      ),
      GoRoute(
        builder: (context, state) =>  TodayTasksView(),
        path: todayTasksView,
      ),
      GoRoute(
        path: editTaskView,
        builder: (context, state) {
          final task = state.extra as TaskModel;
          return EditTaskView(task: task);
        },
      ),

      GoRoute(
        builder: (context, state) => const SettingView(),
        path: settingView,
      ),
    ],
  );
}
