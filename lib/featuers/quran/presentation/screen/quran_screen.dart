import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wateen/core/localization/l10n/app_localizations.dart';
import 'package:wateen/core/theme/app_colors.dart';
import 'package:wateen/core/utils/app_strings.dart';
import 'package:wateen/core/widgets/app_bar_text.dart';
import 'package:wateen/core/widgets/custome_drawer.dart';
import 'package:wateen/core/widgets/large_text.dart';
import 'package:wateen/featuers/quran/presentation/cubit/quran_cubit.dart';
import 'package:wateen/featuers/quran/presentation/widget/choose_surah_drop.dart';
import 'package:wateen/featuers/quran/presentation/widget/page_form_field.dart';
import 'package:wateen/featuers/quran/presentation/widget/update_button.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  String selectedSurah = AppStrings.startReading;
  final pageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final qurancubit = context.read<QuranCubit>();
    qurancubit.getQuranData();
    pageController.text = qurancubit.quranRepository.getLastPage().toString();
    selectedSurah = qurancubit.quranRepository.getLastSurah()??AppStrings.startReading;
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark
        ? AppColors.darkGray
        : AppColors.darkblue,
        title: AppBarText(txt: locale.quran),
        centerTitle: true,
        iconTheme: IconThemeData(
        color:AppColors.white, // اختاري اللون اللي يناسبك
        ),
      ),

      drawer: CustomeDrawer(),
      
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: BlocConsumer<QuranCubit, QuranState>(
              listener: (BuildContext context, QuranState state) { 
                if (state is QuranLoaded) {
                  setState(() {
                    selectedSurah = state.lastSurah ?? locale.startReading;
                    pageController.text = state.lastPage.toString();
                  });
                }
               },
               
              builder: (context, state) {
                if (state is QuranLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is QuranLoaded) {
                
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        "assets/icons/quran-rehal-svgrepo-com.svg",
                        color: isDark
                        ?AppColors.white
                        :AppColors.black,
                        height: 100,
                        width: 100,
                      ),
                    ),
                    LargeText(
                      txt: locale.lastRead(pageController.text, selectedSurah),
                    ),
          
                    const SizedBox(height: 50),
                    LargeText(txt: locale.surah),
          
                    ChooseSurahDrop(
                      initialValue: selectedSurah,
                      onSurahChanged: (surah) {
                        setState(() {
                          selectedSurah = surah ?? locale.startReading;
                        });
                      },
                    ),
          
                    const SizedBox(height: 50),
                    LargeText(txt: locale.pages),
                    const SizedBox(height: 10),
          
                    PageFormField(pageController: pageController),
                    const SizedBox(height: 100),
          
                    Center(
                      child: UpdateButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            int? enteredPage = int.tryParse(
                              pageController.text.trim(),
                            );
                            if (enteredPage != null) {
                              context.read<QuranCubit>().updateProgress(
                             enteredPage,
                            selectedSurah ,
                                 );
                             
                                Navigator.pop(context);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(
                                    content: Text(locale.emptyField),
                                  ),
                                );
                              }
                            }
                          },
                        
                      ),
                    ),
                  ],
                );
                }return SizedBox();
              }, 
            ),
          ),
        ),
      ),
    );
  }
}
