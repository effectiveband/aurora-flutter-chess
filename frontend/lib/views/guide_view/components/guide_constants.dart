import 'package:frontend/views/guide_view/constants/guide_hints_name_const.dart';
import 'package:frontend/views/guide_view/models/hint_model.dart';

final List<HintModel> hintModels = [
  HintModel(
    id: "pawn",
    hintKeys: ["pawnFirstHint", "pawnSecondHint", "pawnThirdHint"],
    imagePaths: GuideHintsNameConst.pawnHints,
    title: (l10n) => l10n.pawn,
  ),
  HintModel(
    id: "rook",
    hintKeys: ["rookHint"],
    imagePaths: GuideHintsNameConst.rookHints,
    title: (l10n) => l10n.rook,
  ),
  HintModel(
    id: "knight",
    hintKeys: ["knightFirstHint", "knightSecondHint"],
    imagePaths: GuideHintsNameConst.knightHints,
    title: (l10n) => l10n.knight,
  ),
  HintModel(
    id: "bishop",
    hintKeys: ["bishopHint"],
    imagePaths: GuideHintsNameConst.bishopHints,
    title: (l10n) => l10n.bishop,
  ),
  HintModel(
    id: "queen",
    hintKeys: ["queenHint"],
    imagePaths: GuideHintsNameConst.queenHints,
    title: (l10n) => l10n.queen,
  ),
  HintModel(
    id: "king",
    hintKeys: [
      "kingFirstHint",
      "kingSecondHint",
      "kingThirdHint",
      "kingFourthHint",
      "kingFifthHint",
    ],
    imagePaths: GuideHintsNameConst.kingHints,
    title: (l10n) => l10n.king,
  ),
  HintModel(
    id: "enPassant",
    hintKeys: [
      "enPassantFirstHint",
      "enPassantSecondHint",
      "enPassantThirdHint",
    ],
    imagePaths: GuideHintsNameConst.takingHints,
    title: (l10n) => l10n.enPassant,
  ),
  HintModel(
    id: "castling",
    hintKeys: [
      "castlingFirstHint",
      "castlingSecondHint",
      "castlingThirdHint",
    ],
    imagePaths: GuideHintsNameConst.castlingHints,
    title: (l10n) => l10n.castling,
  ),
];
