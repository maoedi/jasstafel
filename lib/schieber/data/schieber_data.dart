import 'dart:math';

import 'package:jasstafel/common/data/board_data.dart';
import 'package:jasstafel/settings/schieber_settings.g.dart';

class SchieberRound implements ScoreRow {
  DateTime time = DateTime.now();
  var pts = [0, 0];

  SchieberRound(this.pts);

  bool isRound() {
    return false;
  }

  @override
  List<dynamic> dump() {
    return [time, pts[0], pts[1]];
  }

  @override
  void restore(List<String> values) {
    try {
      time = DateTime.parse(values[0]);
    } on FormatException {
      //
    }
    final pt = values.sublist(1);
    for (var i = 0; i < pt.length; i++) {
      try {
        pts[i] = int.parse(pt[i]);
      } on FormatException {
        pts[i] = 0;
      }
    }
  }
}

class TeamData {
  String name;
  bool flip = false;

  TeamData([this.name = "Team"]);

  final values = [1, 20, 50, 100, 500];
  var strokes = List.filled(5, 0);

  @override
  String toString() {
    return joinC([name, flip]);
  }

  void fromString(String str) {
    var values = splitC(str);
    name = values[0];
    flip = (values[1] == 'true');
  }

  int sum() {
    var sum = 0;
    for (var i = 0; i < values.length; i++) {
      sum += strokes[i] * values[i];
    }
    return sum;
  }

  void add(int points) {
    int remainingPoints = points + strokes[0];
    final int sign = (remainingPoints < 0) ? -1 : 1;

    for (int i = 4; i > 0; i--) {
      int tmp = sign * remainingPoints ~/ values[i];
      if (sign == -1) {
        tmp = min(tmp, strokes[i]);
      }
      strokes[i] += sign * tmp;
      remainingPoints -= sign * tmp * values[i];
    }
    strokes[0] = remainingPoints;
  }

  void checkOverflow() {
    if (strokes[1] > 24) {
      strokes[1] -= 5;
      strokes[3] += 1;
    }
    if (strokes[2] > 13) {
      strokes[2] -= 2;
      strokes[3] += 1;
    }
    if (strokes[3] > 19) {
      strokes[3] -= 5;
      strokes[4] += 1;
    }
  }
}

class SchieberData implements SpecificData {
  var settings = SchieberSettings();
  var team = [TeamData("Team 1"), TeamData("Team 2")];
  final List<SchieberRound> _rounds = [];

  SchieberData();
  @override
  void reset() {
    for (var t = 0; t < team.length; t++) {
      for (var s = 0; s < team[t].strokes.length; s++) {
        team[t].strokes[s] = 0;
      }
    }
    _rounds.clear();
  }

  void add(pts1, pts2) {
    final round = SchieberRound([pts1, pts2]);
    _rounds.add(round);
    team[0].add(pts1);
    team[1].add(pts2);
  }

  @override
  List<dynamic> dumpHeader() {
    return [team[0], team[1]];
  }

  @override
  List<ScoreRow> dumpScore() {
    return _rounds;
  }

  @override
  void restoreHeader(List<String> data) {
    for (var i = 0; i < team.length; i++) {
      team[i].fromString(data[i]);
    }
  }

  @override
  void restoreScore(List<List<String>> data) {
    for (var values in data) {
      final round = SchieberRound([0, 0]);
      round.restore(values);
      _rounds.add(round);
      for (var i = 0; i < team.length; i++) {
        team[i].add(round.pts[i]);
      }
    }
  }

  @override
  int rounds() {
    int rounds = 0;
    for (var round in _rounds) {
      if (round.isRound()) {
        rounds++;
      }
    }
    return rounds;
  }

  List<SchieberRound> getHistory() {
    return _rounds;
  }
}
