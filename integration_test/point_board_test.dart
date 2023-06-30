import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:jasstafel/common/board.dart';
import 'package:jasstafel/settings/common_settings.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'overall_test.dart';

// cspell:ignore: spielername runde eingeben zurück punkte kein ziel zielpunkte
// cspell:ignore: anzahl erreicht mehr desto besser

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    await preferences.setString(CommonSettings.keys.appLanguage, 'de');
    await preferences.setInt(
        CommonSettings.keys.lastBoard, Board.pointBoard.index);
  });

  testWidgets('change name', (tester) async {
    await tester.launchApp();

    await tester.tap(find.text('Spieler 1'));
    await tester.pumpAndSettle();

    expect(find.text('Spielername'), findsWidgets);
    await tester.enterText(find.byType(TextField), 'Simon');
    await tester.pump();

    await tester.tap(find.text('Ok'));
    await tester.pumpAndSettle();
    expect(find.text('Spieler 1'), findsNothing);
    expect(find.text('Simon'), findsOneWidget);
  });

  testWidgets('add points', (tester) async {
    await tester.launchApp();

    await tester.tap(find.byTooltip('Runde eingeben'));
    await tester.pump();

    await tester.enterText(find.byKey(const Key('pts_0')), '10');
    await tester.enterText(find.byKey(const Key('pts_1')), '20');
    await tester.enterText(find.byKey(const Key('pts_2')), '30');
    await tester.pump();
    await tester.tap(find.byKey(const Key('pts_3')));
    await tester.pump();
    await tester.tap(find.text('Ok'));
    await tester.pumpAndSettle();

    expect(text(const Key('sum_0')), '10');
    expect(text(const Key('sum_1')), '20');
    expect(text(const Key('sum_2')), '30');
    expect(text(const Key('sum_3')), '97');
  });
  testWidgets('rounded', (tester) async {
    await tester.launchApp();

    await tester.tapSetting(['Punkte auf 10er Runden']);

    await tester.tap(find.byTooltip('Runde eingeben'));
    await tester.pump();

    await tester.enterText(find.byKey(const Key('pts_0')), '14');
    await tester.enterText(find.byKey(const Key('pts_1')), '23');
    await tester.enterText(find.byKey(const Key('pts_2')), '26');
    await tester.pump();
    await tester.tap(find.byKey(const Key('pts_3')));
    await tester.pump();
    await tester.tap(find.text('Ok'));
    await tester.pumpAndSettle();

    expect(text(const Key('sum_0')), '1');
    expect(text(const Key('sum_1')), '2');
    expect(text(const Key('sum_2')), '3');
    expect(text(const Key('sum_3')), '9');
  });

  testWidgets('only 2 players', (tester) async {
    await tester.launchApp();

    await tester.tap(find.byKey(const Key('SettingsButton')));
    await tester.pumpAndSettle();
    await tester.slideTo(find.byType(Slider), 2);
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Zurück'));
    await tester.pumpAndSettle();

    expect(find.text('Spieler 3'), findsNothing);

    await tester.tap(find.byTooltip('Runde eingeben'));
    await tester.pump();

    await tester.enterText(find.byKey(const Key('pts_0')), '77');
    await tester.pump();
    await tester.tap(find.byKey(const Key('pts_1')));
    await tester.tap(find.text('Ok'));
    await tester.pumpAndSettle();

    expect(text(const Key('sum_0')), '77');
    expect(text(const Key('sum_1')), '80');
  });

  testWidgets('edit round', (tester) async {
    await tester.launchApp();

    await tester.tap(find.byTooltip('Runde eingeben'));
    await tester.pump();

    await tester.enterText(find.byKey(const Key('pts_0')), '157');
    await tester.pump();
    await tester.tap(find.text('Ok'));
    await tester.pumpAndSettle();

    await tester.longPress(find.text('0').first);

    await tester.enterText(find.byKey(const Key('pts_2')), '157');
    await tester.pump();
    await tester.enterText(find.byKey(const Key('pts_0')), '');
    await tester.pump();
    await tester.tap(find.byKey(const Key('pts_1')));
    await tester.tap(find.text('Ok'));
    await tester.pumpAndSettle();

    expect(text(const Key('sum_0')), '0');
    expect(text(const Key('sum_1')), '0');
    expect(text(const Key('sum_2')), '157');
    expect(text(const Key('sum_3')), '0');
  });

  testWidgets('goal points', (tester) async {
    await tester.launchApp();

    await tester.tap(find.byKey(const Key('SettingsButton')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('kein Ziel'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Zielpunkte').first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Zielpunkte').last);
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), '88');
    await tester.tap(find.text('Ok'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Zurück'));
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Runde eingeben'));
    await tester.pump();
    await tester.enterText(find.byKey(const Key('pts_0')), '70');
    await tester.enterText(find.byKey(const Key('pts_1')), '70');
    await tester.enterText(find.byKey(const Key('pts_2')), '17');
    await tester.pump();
    await tester.tap(find.text('Ok'));
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Runde eingeben'));
    await tester.pump();
    await tester.enterText(find.byKey(const Key('pts_0')), '10');
    await tester.enterText(find.byKey(const Key('pts_1')), '29');
    await tester.enterText(find.byKey(const Key('pts_2')), '57');
    await tester.pump();
    await tester.tap(find.byKey(const Key('pts_3')));
    await tester.pump();
    await tester.tap(find.text('Ok'));
    await tester.pumpAndSettle();

    expect(find.text('Spieler 2 hat die Zielpunkte erreicht!'), findsOneWidget);
    await tester.tap(find.text('Ok'));
    await tester.pumpAndSettle();

    expect(text(const Key('sum_1')), '99');
  });

  testWidgets('goal rounds', (tester) async {
    await tester.launchApp();

    await tester.tap(find.byKey(const Key('SettingsButton')));
    await tester.pumpAndSettle();
    await tester.slideTo(find.byType(Slider), 2);
    await tester.pumpAndSettle();
    await tester.tap(find.text('kein Ziel'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Anzahl Runden').first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Anzahl Runden').last);
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), '3');
    await tester.tap(find.text('Ok'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Zurück'));
    await tester.pumpAndSettle();

    for (var i = 0; i < 3; i++) {
      await tester.tap(find.byTooltip('Runde eingeben'));
      await tester.pump();
      await tester.enterText(find.byKey(const Key('pts_0')), '80');
      await tester.pump();
      await tester.tap(find.byKey(const Key('pts_1')));
      await tester.pump();
      await tester.tap(find.text('Ok'));
      await tester.pumpAndSettle();
    }

    expect(find.text('Spieler 1 hat die Zielpunkte erreicht!'), findsOneWidget);
    await tester.tap(find.text('Ok'));
    await tester.pumpAndSettle();

    expect(text(const Key('sum_0')), '240');
  });

  testWidgets('goal rounds fewest points', (tester) async {
    await tester.launchApp();

    await tester.tap(find.byKey(const Key('SettingsButton')));
    await tester.pumpAndSettle();
    await tester.slideTo(find.byType(Slider), 2);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Je mehr Punkte desto besser'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('kein Ziel'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Anzahl Runden').first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Anzahl Runden').last);
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), '3');
    await tester.tap(find.text('Ok'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Zurück'));
    await tester.pumpAndSettle();

    for (var i = 0; i < 3; i++) {
      await tester.tap(find.byTooltip('Runde eingeben'));
      await tester.pump();
      await tester.enterText(find.byKey(const Key('pts_0')), '80');
      await tester.pump();
      await tester.tap(find.byKey(const Key('pts_1')));
      await tester.pump();
      await tester.tap(find.text('Ok'));
      await tester.pumpAndSettle();
    }

    expect(find.text('Spieler 2 hat die Zielpunkte erreicht!'), findsOneWidget);
    await tester.tap(find.text('Ok'));
    await tester.pumpAndSettle();

    expect(text(const Key('sum_1')), '231');
  });
}
