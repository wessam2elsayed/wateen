import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wateen/core/localization/l10n/app_localizations.dart';
import 'package:wateen/core/theme/app_colors.dart';
import 'package:wateen/core/widgets/app_bar_text.dart';
import 'package:wateen/core/widgets/custome_drawer.dart';
import 'package:wateen/featuers/prayer/presentation/cubit/prayer_cubit.dart';
import 'package:wateen/featuers/prayer/presentation/widget/prayer_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrayerScreen extends StatefulWidget {
  const PrayerScreen({super.key});

  @override
  State<PrayerScreen> createState() => _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  

  @override
  void initState() {
    super.initState();
    context.read<PrayerCubit>().getPrayers();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    

    final List<String> prayerDisplayNames = [
      locale.fajr,
      locale.dhuhr,
      locale.asr,
      locale.maghrib,
      locale.isha,
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark
        ? AppColors.darkGray
        : AppColors.darkblue,
        title: AppBarText(txt: locale.prayer),
        centerTitle: true,
        iconTheme: IconThemeData(
        color:AppColors.white, // اختاري اللون اللي يناسبك
        ),
      ),

      drawer: CustomeDrawer(),
      
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: SvgPicture.asset(
                "assets/icons/mosque-islam-svgrepo-com.svg",
                height: 100,
                width: 100,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<PrayerCubit, PrayerState>(
                builder: (context, state) {
                  final cubit = context.read<PrayerCubit>();
                  if(state is PrayerLoaded){
                    return ListView.builder(
                      key: ValueKey(state.prayersStatus.length),
                    itemCount: prayerDisplayNames.length,
                    itemBuilder: (context, index) {

                      final List<String> prayers =  ["Fagr","Dhuhr","Asr","Maghrib","Ishaa",];
                      final prayerName = prayers[index];    
                      final displayName = prayerDisplayNames[index];

                      bool isDone = state.prayersStatus[prayerName] ?? false;
                       
                       return PrayerContainer(
                            txt: displayName,
                            isDone: isDone,
                            onCheckChanged: (value)async {
                               cubit.changePrayerStatus(prayerName, value ?? false);
                              cubit.getPrayers();
                            },
                          );
                        },
                      );
                  }
                  return const Center(child: CircularProgressIndicator());
                    },
                  )
                
                
              ),
            
          ],
        ),
      ),
    );
  }
}
