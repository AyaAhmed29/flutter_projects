import 'package:ecommerce_app/core/utlis/app_assets.dart';
import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:ecommerce_app/core/utlis/app_padding.dart';
import 'package:ecommerce_app/core/utlis/app_router.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:ecommerce_app/core/widget/custom_appbar.dart';
import 'package:ecommerce_app/core/widget/custom_button.dart';
import 'package:ecommerce_app/core/widget/custom_cach_image.dart';
import 'package:ecommerce_app/features/checkout/view/checkout_view.dart';
import 'package:ecommerce_app/features/home/view/home_view.dart';
import 'package:ecommerce_app/features/items/view/items_view.dart';
import 'package:ecommerce_app/features/profile/view/profle_view.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/utlis/storage/prodect_model/app_local_storage.dart';
import 'package:ecommerce_app/core/utlis/storage/prodect_model/product_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  int selectedIndex = 0;

  final List<Widget> views = const [HomeView(), ItemsView(), ProfleView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).push(AppRouter.checkoutView);
        },
        shape: const CircleBorder(),
        backgroundColor: AppColors.pink,
        child: Image.asset(Assets.imagesIconsBag),
      ),
      body: views[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.pink,
        selectedLabelStyle: AppStyle.medium12,
        unselectedIconTheme: IconThemeData(color: AppColors.pink),
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Image.asset(
              Assets.imagesIconsHome,
              color: selectedIndex == 0
                  ? AppColors.pink
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Items',
            icon: Image.asset(
              Assets.imagesIconsShopping,
              color: selectedIndex == 1
                  ? AppColors.pink
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Image.asset(
              Assets.imagesIconsProfile,
              color: selectedIndex == 2
                  ? AppColors.pink
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
