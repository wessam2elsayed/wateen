import 'package:flutter/material.dart';
import 'package:wateen/core/localization/l10n/app_localizations.dart';
import 'package:wateen/core/theme/app_colors.dart';
import 'package:wateen/core/utils/surah_names.dart';
import 'package:wateen/core/widgets/large_text.dart';

class ChooseSurahDrop extends StatefulWidget {
  final String? initialValue;
  final Function(String?) onSurahChanged;
  const ChooseSurahDrop({
    super.key, 
    this.initialValue,
    required this.onSurahChanged,     
    });

  @override
  State<ChooseSurahDrop> createState() => _ChooseSurahDrop();
}

class _ChooseSurahDrop extends State<ChooseSurahDrop> {
  String? selectedSursh;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
    List<String> surahs = List.from(isArabic ? SurahNames.arabicSurahs : SurahNames.englishSurahs);

    if (!surahs.contains(locale.startReading)) {
      surahs.insert(0, locale.startReading);
    }

    String safeValue = (widget.initialValue != null && surahs.contains(widget.initialValue)) 
      ? widget.initialValue! 
      : locale.startReading;

    return DropdownButton<String>( 
      dropdownColor: isDark
      ? AppColors.darkGray
      : AppColors.lightblue,
      isExpanded: true,
      menuWidth: 200,
      alignment: AlignmentDirectional.centerEnd,
      borderRadius: BorderRadius.circular(10),
      hint: LargeText(txt: locale.surah,),

      value: safeValue,

      onChanged: (value){
       
        widget.onSurahChanged(value); 

      },
      items: surahs.map((surah){
        return DropdownMenuItem(
          alignment: AlignmentDirectional.centerStart,
        value: surah,
        child:LargeText(txt: surah)
        );
      }).toList(),
      
      ) ;
      
  
  }
}