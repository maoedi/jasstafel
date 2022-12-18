import 'package:flutter/material.dart';
import 'package:jasstafel/settings/common_settings.g.dart';
import 'package:jasstafel/settings/schieber_settings.g.dart';
import 'package:pref/pref.dart';
import 'package:jasstafel/common/localization.dart';

class SchieberSettingsScreen extends StatefulWidget {
  const SchieberSettingsScreen({super.key});

  @override
  State<SchieberSettingsScreen> createState() => _SchieberSettingsScreenState();
}

class _SchieberSettingsScreenState extends State<SchieberSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.settings_title(context.l10n.schieber)),
      ),
      body: PrefPage(children: [
        PrefTitle(title: Text(context.l10n.countingType)),
        PrefDropdown(
          title: Text(context.l10n.goalType),
          pref: SchieberSettings.keys.goalType,
          items: [
            DropdownMenuItem(value: true, child: Text(context.l10n.goalPoints)),
            DropdownMenuItem(value: false, child: Text(context.l10n.rounds)),
          ],
        ),
        PrefDisabler(
          pref: SchieberSettings.keys.goalType,
          reversed: true,
          children: [
            PrefCheckbox(
                title: Text(context.l10n.differentGoals),
                pref: SchieberSettings.keys.differentGoals),
          ],
        ),
        PrefDialogButton(
            title: Text(context.l10n.pointsPerRound),
            dialog: PrefDialog(
                title: Text(context.l10n.pointsPerRound),
                cancel: Text(context.l10n.cancel),
                submit: Text(context.l10n.ok),
                children: [
                  PrefText(
                      label: context.l10n.pointsPerRound,
                      pref: SchieberSettings.keys.pointsPerRound)
                ])),
        PrefTitle(title: Text(context.l10n.settings)),
        PrefCheckbox(
            title: Text(context.l10n.allowTouch),
            pref: SchieberSettings.keys.touchScreen),
        PrefDisabler(
          reversed: true,
          pref: SchieberSettings.keys.touchScreen,
          children: [
            PrefCheckbox(
                title: Text(context.l10n.vibrateOnTouch),
                pref: SchieberSettings.keys.vibrate)
          ],
        ),
        PrefCheckbox(
            title: Text(context.l10n.backside),
            pref: SchieberSettings.keys.backside),
        PrefDisabler(
          reversed: true,
          pref: SchieberSettings.keys.backside,
          children: [
            PrefSlider(
              title: Text(context.l10n.columns2ndBoard),
              pref: SchieberSettings.keys.backsideColumns,
              min: 2,
              max: 6,
              trailing: (num v) => Text("$v"),
            ),
          ],
        ),
        PrefCheckbox(
            title: Text(context.l10n.bigScore),
            pref: SchieberSettings.keys.bigScore),
        PrefCheckbox(
            title: Text(context.l10n.drawZ), pref: SchieberSettings.keys.drawZ),
        PrefTitle(title: Text(context.l10n.commonSettings)),
        PrefCheckbox(
            title: Text(context.l10n.keepScreenOn),
            pref: CommonSettings.keys.keepScreenOn),
        PrefChoice<String>(
          title: Text(context.l10n.language),
          pref: CommonSettings.keys.appLanguage,
          items: const [
            DropdownMenuItem(value: 'de', child: Text('Deutsch')),
            DropdownMenuItem(value: 'en', child: Text('English')),
            DropdownMenuItem(value: 'fr', child: Text('Français')),
          ],
          cancel: Text(context.l10n.cancel),
        ),
      ]),
    );
  }
}
