import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/feature/bookmark/view/bookmark_view.dart';
import 'package:news_app/feature/explor/view/explor_view.dart';
import 'package:news_app/feature/home/view/home_view.dart';
import 'package:news_app/feature/profile/view/profile_view.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  int selectedIndex = 0;

  final List<Widget> views = const [
    HomeView(),
    ExplorView(),
    BookmarkView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.softRose,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: CustomNavIcon(
              asset: Assets.assetsImagesIconsVector2,
              isSelected: selectedIndex == 0,
              text: 'Home',
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: CustomNavIcon(
              asset: Assets.assetsImagesIconsVector1,
              isSelected: selectedIndex == 1,
              text: 'Explore',
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: CustomNavIcon(
              asset: Assets.assetsImagesIconsBookmark,
              isSelected: selectedIndex == 2,
              text: 'Bookmark',
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: CustomNavIcon(
              asset: Assets.assetsImagesIconsProfile,
              isSelected: selectedIndex == 3,
              text: 'Profile',
            ),
          ),
        ],
      ),
    );
  }
}

class CustomNavIcon extends StatelessWidget {
  final String asset;
  final bool isSelected;
  final String text;

  const CustomNavIcon({
    super.key,
    required this.asset,
    required this.isSelected,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: isSelected
          ? BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(24.r),
            )
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            asset,
            color: isSelected ? AppColors.white : AppColors.black,
            width: 22,
            height: 22,
          ),
          if (isSelected) ...[
            SizedBox(width: 6.w),
            Text(text, style: AppStyle.semiBold12),
          ],
        ],
      ),
    );
  }
}
