import "../exports.dart";

int tileToRow(int tile) {
  return (tile / LogicConsts.lenOfRow).floor();
}

int tileToCol(int tile) {
  return tile % LogicConsts.lenOfRow;
}

double getXFromTile(int tile, double tileSize, GameModel gameModel) {
  return tileToCol(tile) * tileSize;
}

double getYFromTile(int tile, double tileSize, GameModel gameModel) {
  return tileToRow(tile) * tileSize;
}

Player oppositePlayer(Player player) {
  return player == Player.player1 ? Player.player2 : Player.player1;
}

String formatPieceTheme(String themeString) {
  return themeString.toLowerCase().replaceAll(" ", "");
}

String pieceTypeToString(ChessPieceType type) {
  return type.toString().substring(type.toString().indexOf(".") + 1);
}
