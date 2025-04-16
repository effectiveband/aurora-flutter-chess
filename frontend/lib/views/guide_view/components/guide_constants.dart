import "package:frontend/exports.dart";

List<String> pieceKeys = [
  "pawn",
  "rook",
  "knight",
  "bishop",
  "queen",
  "king",
  "enPassant",
  "castling"
];

Map<String, List<String>> hintsOfPieces = {
  "pawn": ["pawnFirstHint", "pawnSecondHint", "pawnThirdHint"],
  "rook": ["rookHint"],
  "knight": ["knightFirstHint", "knightSecondHint"],
  "bishop": ["bishopHint"],
  "queen": ["queenHint"],
  "king": [
    "kingFirstHint",
    "kingSecondHint",
    "kingThirdHint",
    "kingFourthHint",
    "kingFifthHint"
  ],
  "enPassant": [
    "enPassantFirstHint",
    "enPassantSecondHint",
    "enPassantThirdHint"
  ],
  "castling": ["castlingFirstHint", "castlingSecondHint", "castlingThirdHint"]
};

Map<String, List<String>> imgOfHints = {
  "pawn": GuideHintsNameConst.pawnHints,
  "rook": GuideHintsNameConst.rookHints,
  "knight": GuideHintsNameConst.knightHints,
  "bishop": GuideHintsNameConst.bishopHints,
  "queen": GuideHintsNameConst.queenHints,
  "king": GuideHintsNameConst.kingHints,
  "enPassant": GuideHintsNameConst.takingHints,
  "castling": GuideHintsNameConst.castlingHints,
};
