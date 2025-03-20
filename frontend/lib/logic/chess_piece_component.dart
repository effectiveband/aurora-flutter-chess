import "package:flame_svg/flame_svg.dart";

import "../exports.dart";

class ChessPieceComponent {
  ChessPieceType? type;
  int? tile;
  SvgComponent? svgComponent;
  double? compX;
  double? compY;
  double offsetX = 0;
  double offsetY = 0;
  double maxComp = 0.1;

  ChessPieceComponent(ChessPiece piece, SvgComponent? svg) {
    tile = piece.tile;
    type = piece.type;
    svgComponent = svg;
  }

  void updateSvg(ChessPieceType type) async {
    String? pieceName = type.name;
    if (type == ChessPieceType.promotion) {
      pieceName = "pawn";
    }
    svgComponent?.svg = await Svg.load('images/pieces/$pieceName.svg');
  }

  void update(double tileSize, GameModel gameModel, ChessPiece piece) async {
    if (piece.type != type) {
      type = piece.type;
      updateSvg(type!);
    }
    if (piece.tile != tile) {
      tile = piece.tile;
      offsetX = 0;
      offsetY = 0;
    }
    var destX = getXFromTile(tile ?? 0, tileSize, gameModel);
    var destY = getYFromTile(tile ?? 0, tileSize, gameModel);
    if ((destX - (compX ?? 0)).abs() <= maxComp) {
      compX = destX;
      offsetX = 0;
    } else {
      if (offsetX == 0) {
        offsetX = (destX - (compX ?? 0)) / LogicConsts.height;
      }
      if (compX != null) {
        compX = (compX ?? 0) + offsetX;
      }
    }
    if ((destY - (compY ?? 0)).abs() <= maxComp) {
      compY = destY;
      offsetY = 0;
    } else {
      if (offsetY == 0) {
        offsetY += (destY - (compY ?? 0)) / LogicConsts.height;
      }
      if (compX != null) {
        compY = (compY ?? 0) + offsetY;
      }
    }
  }

  void initComponentPosition(double tileSize, GameModel gameModel) {
    compX = getXFromTile(tile ?? 0, tileSize, gameModel);
    compY = getYFromTile(tile ?? 0, tileSize, gameModel);
  }
}
