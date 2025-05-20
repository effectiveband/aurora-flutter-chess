import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../exports.dart';

String getResultForHistory(GameModel gameModel, AppLocalizations l10n) {
  if (gameModel.gameOver) {
    if (gameModel.stalemate || gameModel.draw) {
      return l10n.draw;
    } else {
      if (gameModel.turn == Player.player1) {
        return l10n.blackVictory;
      } else {
        return l10n.whiteVictory;
      }
    }
  } else {
    return l10n.draw;
  }
}

List<String> getPartyData(GameModel gameModel, AppLocalizations l10n) {
  String enemy = gameModel.playerCount == 1 ? l10n.computer : l10n.friend;
  String formattedDate = DateFormat("dd.MM.yyyy").format(DateTime.now());
  String formattedTime = DateFormat.Hm().format(DateTime.now());
  String durationGame = _formatDuration(gameModel.durationOfGame);
  String result = getResultForHistory(gameModel, l10n);
  String color = gameModel.playerSide == Player.player1
      ? l10n.whitePieces
      : l10n.blackPieces;
  return [enemy, formattedDate, formattedTime, durationGame, result, color];
}

Future<void> addPartyToHistory(
    GameModel gameModel, AppLocalizations l10n) async {
  var databasesPath = await getDatabasesPath();
  String path = "$databasesPath/parties.db";
  Database database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(PartyHistoryConst.dbCreateScript);
  });
  await database.rawInsert(
      PartyHistoryConst.dbInsertPartyScript, getPartyData(gameModel, l10n));

  await database.close();
}

String _formatDuration(Duration duration) {
  int hours = duration.inHours;
  String minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
  String seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
  return hours == 0 ? "$minutes:$seconds" : "$hours:$minutes:$seconds";
}
