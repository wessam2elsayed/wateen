import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wateen/core/localization/l10n/app_localizations.dart';
import 'package:wateen/core/theme/app_colors.dart';
import 'package:wateen/core/widgets/app_bar_text.dart';
import 'package:wateen/core/widgets/custome_drawer.dart';
import 'package:wateen/core/widgets/large_text.dart';
import 'package:wateen/featuers/azkar/data/model/azkar_model.dart';
import 'package:wateen/featuers/azkar/presentation/cubit/azkar_cubit.dart';
import 'package:wateen/featuers/azkar/presentation/widget/azkar_container.dart';
import 'package:wateen/featuers/azkar/presentation/widget/azkar_description.dart';
import 'package:wateen/featuers/azkar/presentation/widget/counter.dart';

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({super.key});

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  


  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    
    final locale = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cubit = context.read<AzkarCubit>();

      final List<AzkarModel> azkars = [
    AzkarModel(
      title: locale.morningAzkar,
      targetCount: 1,
      description: locale.morningDes,
    ),
    AzkarModel(
      title: locale.eveningAzkar,
      targetCount: 1,
      description: locale.eveningDes,
    ),
    AzkarModel(title: locale.subhanAllah, targetCount: 33, description: ""),
    AzkarModel(
      title: locale.alhamdulilah,
      targetCount: 33,
      description: "",
    ),
    AzkarModel(title: locale.allahAkbar, targetCount: 33, description: ""),
    AzkarModel(
      title: locale.laEllahEllaAllah,
      targetCount: 1,
      description: "",
    ),
    AzkarModel(
      title: locale.astaghfarAllah,
      targetCount: 100,
      description: "",
    ),
  ];

  for (var zkr in azkars) {
      zkr.currentCount = cubit.getZkrCount(zkr.title);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark
        ? AppColors.darkGray
        : AppColors.darkblue,
        title: AppBarText(txt: locale.azkar),
        centerTitle: true,
        iconTheme: IconThemeData(
        color:AppColors.white, // اختاري اللون اللي يناسبك
        ),
      ),
      drawer: CustomeDrawer(),

      body: BlocBuilder<AzkarCubit, AzkarState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Center(
                  child: SvgPicture.asset(
                    "assets/icons/prayer-beads-svgrepo-com_(1).svg",
                    height: 100,
                    width: 100,
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: azkars.length,
                    itemBuilder: (context, index) {
                      bool finished =
                          azkars[index].currentCount >=
                          azkars[index].targetCount;

                      return AzkarContainer(
                        txt: azkars[index].title,
                        count: azkars[index].currentCount,
                        targetCount: azkars[index].targetCount,
                        isDone: finished,
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                          
                        },
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25),
                              ),
                            ),
                            backgroundColor: AppColors.white,

                            builder: (context) {
                              return AzkarDescription(
                                txt: azkars[index].title,
                                des: azkars[index].description,
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),

                const SizedBox(height: 10),
                LargeText(txt: azkars[selectedIndex].title),

                Counter(
                  txt: "${azkars[selectedIndex].currentCount}",
                  onTap: () async {
                   
                      azkars[selectedIndex].currentCount++;

                      await context.read<AzkarCubit>().updateAzkarCount(
                        azkars[selectedIndex].title,
                        azkars[selectedIndex].currentCount,
                      );
                    
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
