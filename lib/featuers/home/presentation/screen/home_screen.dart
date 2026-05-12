import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wateen/core/localization/l10n/app_localizations.dart';
import 'package:wateen/core/routes/app_routes.dart';
import 'package:wateen/core/theme/app_colors.dart';
import 'package:wateen/core/widgets/app_bar_text.dart';
import 'package:wateen/core/widgets/custome_drawer.dart';
import 'package:wateen/core/widgets/large_text.dart';
import 'package:wateen/featuers/home/data/model/habit_model.dart';
import 'package:wateen/featuers/home/presentation/cubit/home_cubit.dart';
import 'package:wateen/featuers/home/presentation/widget/habit_container.dart';
import 'package:wateen/featuers/home/presentation/widget/header_container.dart';
import 'package:wateen/featuers/home/presentation/widget/streak_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key}); 

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().fetchHomeData();
    
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    List<HabitModel> habits = [
      HabitModel(
        title: locale.prayer,
        lottiePath: 
        'assets/lottie/Man goes to the mosque on Ramadan.json',
        // 'assets/lottie/Man goes to the mosque on Ramadan.json',
        // 'assets/lottie/Muslim_people_lifestyle_Ramadan 2021.json',
        routeName: AppRoutes.prayer,
      ),
      HabitModel(
        title: locale.quran,
        lottiePath: 
        'assets/lottie/Reading Quran.json',
        // 'assets/lottie/Reading in Quran.json',
        routeName: AppRoutes.quran,
      ),
      HabitModel(
        title: locale.azkar,
        lottiePath: 'assets/lottie/pray.json',
        routeName: AppRoutes.azkar,
      ),
    ];
    return Scaffold(
     appBar: AppBar(
        backgroundColor: isDark
        ? AppColors.darkGray
        : AppColors.darkblue,
        title: AppBarText(txt: locale.wateen),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, AppRoutes.theSettings);
            }, 
            icon: Icon(Icons.settings,
            color: AppColors.white,)),       
        ],
        iconTheme: IconThemeData(
        color:AppColors.white, // اختاري اللون اللي يناسبك
        ),
      ),

      drawer: CustomeDrawer(),

      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {

          if(state is HomeLoaded){
            final totalProgress = (state.prayerProgress + state.azkarProgress + state.quranProgress) / 3;

            return  Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                
                    HeaderContainer(),
                    const SizedBox(height: 10),
                          
                   StreakContainer(txt: "${state.streak}"),
                      
                    LargeText(txt: locale.progress),
                    const SizedBox(height: 5),
                      
                    
                     LinearProgressIndicator(
                         value: totalProgress, 
                         color: isDark
                         ? AppColors.gray
                         : AppColors.darkblue,
                         backgroundColor: AppColors.lightgray
                     ),
                      
                
                      
                    
                      
                    const SizedBox(height: 30),
                    // LargeText(txt: AppStrings.habits),
                    Column(
                      children: [
                        
                         HabitContainer(
                            txt: habits[0].title, 
                            img: habits[0].lottiePath, 
                            onTap: (){
                               Navigator.pushNamed(context, habits[0].routeName).then((_){
                                context.read<HomeCubit>().fetchHomeData();
                               });
                            },       
                            percent: state.prayerProgress,
                                    
                         ),                      
                              
                    
                             HabitContainer(
                                     txt: habits[1].title, 
                                     img: habits[1].lottiePath, 
                                     onTap: (){
                                        Navigator.pushNamed(context, habits[1].routeName).then((_){
                                          context.read<HomeCubit>().fetchHomeData();
                                        });
                                     }, 
                                     percent: state.quranProgress,
                                 ),
                             
                    
                              HabitContainer(
                                       txt: habits[2].title, 
                                       img: habits[2].lottiePath, 
                                       onTap: (){
                                           Navigator.pushNamed(context, habits[2].routeName).then((_){
                                            context.read<HomeCubit>().fetchHomeData();
                                           });
                                        }, 
                                       percent: state.azkarProgress,
                                       ),
                                
                      ],
                    ),
                  ],
                ),
              ),
            );
          }return const Center(child: CircularProgressIndicator());
          
        },
      ),
    );
  }
}

