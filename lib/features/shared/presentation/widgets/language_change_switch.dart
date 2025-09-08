import 'package:crafty_bay/app/craftybay.dart';
import 'package:flutter/material.dart';

class LanguageChangeSwitch extends StatelessWidget {
  const LanguageChangeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("select Language"),
      trailing: DropdownMenu<Locale>(
        dropdownMenuEntries: Craftybay.languageController.supportedLocals.map((
          local,
        ) {
          return DropdownMenuEntry(value: local, label: local.languageCode);
        }).toList(),
        onSelected: (Locale? local) {
          Craftybay.languageController.changeLocal(local!);
        },
      ),
    );
  }
}
