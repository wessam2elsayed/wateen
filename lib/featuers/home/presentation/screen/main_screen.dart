import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wateen/core/localization/l10n/app_localizations.dart';
import 'package:wateen/core/theme/app_colors.dart';
import 'package:wateen/core/widgets/custome_drawer.dart';
import 'package:wateen/featuers/home/presentation/screen/home_screen.dart';
import 'package:wateen/featuers/azkar/presentation/screen/azkar_screen.dart';
import 'package:wateen/featuers/prayer/presentation/screen/prayer_screen.dart';
import 'package:wateen/featuers/quran/presentation/screen/quran_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final locale = AppLocalizations.of(context)!;

  final List<Widget> pages =
     [
      HomeScreen(),
      PrayerScreen(),
      QuranScreen(),
      AzkarScreen()
     ];

  int currentPage = 0;
  PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      drawer: CustomeDrawer(),
      
      body: Column(
        children: [
          // HeaderContainer(),
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (value){
                setState(() {
                        currentPage = value;
                      });
              },
              children: pages,
            ))
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: isDark
          ? AppColors.lightgray
           :AppColors.darkblue,
        unselectedItemColor: isDark
        ? AppColors.gray
        : AppColors.lightgray,
          currentIndex: currentPage,
          onTap: (index) {
            setState(() {
              currentPage = index;
              pageController.jumpToPage(currentPage);
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: locale.home,
            
            ),
            BottomNavigationBarItem(
              icon:
              // LottieBuilder.asset("assets/lottie/Reading in Quran.json",
              // height: 40,width: 40,),
               SvgPicture.asset(
                // "assets/icons/mosque-svgrepo-com.svg",
                // color: AppColors.white,
                "assets/icons/mosque-islam-svgrepo-com.svg",
                // color: isDark
                // ?AppColors.white
                // : AppColors.black,
                height: 25,width: 25,),
              label: locale.prayer,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/quran-rehal-svgrepo-com.svg",
                color: isDark
                ?AppColors.white
                : AppColors.black,
                height: 25,width: 25,),
                label: locale.quran,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/prayer-beads-svgrepo-com_(1).svg",
                // "assets/icons/prayer-beads-svgrepo-com.svg",
                // color: isDark
                // ?AppColors.white
                // : AppColors.black,
                height: 25,width: 25,),
              label: locale.azkar,
            ),
          ],
        ),
    );
  }
}