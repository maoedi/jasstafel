import 'package:flutter/material.dart';
import 'package:jasstafel/common/board.dart';
import 'package:jasstafel/common/localization.dart';
import 'package:jasstafel/settings/common_settings.g.dart';
import 'package:pref/pref.dart';

class BoardTitle extends Theme {
  BoardTitle(Board board, BuildContext context, {super.key})
      : super(
          data: ThemeData.dark(),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<Board>(
              value: board,
              items: <DropdownMenuItem<Board>>[
                DropdownMenuItem(
                  value: Board.schieber,
                  child: Text(context.l10n.schieber),
                ),
                DropdownMenuItem(
                  value: Board.coiffeur,
                  child: Text(context.l10n.coiffeur),
                ),
                DropdownMenuItem(
                  value: Board.molotow,
                  child: Text(context.l10n.molotow),
                ),
              ],
              onChanged: (value) {
                PrefService.of(context)
                    .set(CommonSettings.keys.lastBoard, value!.index);
                Navigator.of(context)
                    .restorablePushReplacementNamed(value.name);
              },
            ),
          ),
        );
}
