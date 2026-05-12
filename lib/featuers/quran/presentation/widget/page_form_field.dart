import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wateen/core/localization/l10n/app_localizations.dart';
import 'package:wateen/core/widgets/small_text.dart';

class PageFormField extends StatefulWidget {
  final   TextEditingController pageController;
  const PageFormField({
    super.key, 
    required this.pageController});

  @override
  State<PageFormField> createState() => _PageFormFieldState();
}

class _PageFormFieldState extends State<PageFormField> {
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return TextFormField(
      controller: widget.pageController,
      textAlign: TextAlign.left,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        label: SmallText(txt: locale.pages),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
      ),

      inputFormatters: [
              FilteringTextInputFormatter.digitsOnly
      ], 
      validator: (value) {
         if (value == null || value.isEmpty) {
             return locale.emptyField;
         } return null;
      }, 

    );
  }
}