class GameSettingConsts {
  static String longDashSymbol = "—";

  static int countOfDifficultyLevels = 3;

  static List<int> listOfDurations = [
    1,
    2,
    3,
    4,
    5,
    10,
    15,
    20,
    25,
    30,
    40,
    60,
    80,
    90,
    120
  ];

  static List<dynamic> listOfAdditions = [
    longDashSymbol,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    15,
    20,
    30,
    45,
    60
  ];

  static String dbCreateScript = """CREATE TABLE Settings (
  id INTEGER PRIMARY KEY, 
  withoutTime INTEGER,
  durationGame INTEGER,
  addingOnMove INTEGER,
  isMoveBack INTEGER,
  isThreats INTEGER,
  isHints INTEGER
  )""";

  static String dbGetSettingsScript = "SELECT * FROM Settings";

  static String dbUpdateSettingsScript = """UPDATE Settings SET
  withoutTime = ?,
  durationGame = ?,
  addingOnMove = ?,
  isMoveBack = ?,
  isThreats = ?,
  isHints = ?
  WHERE id = 1
  """;

  static String dbSetSettingsScript = """INSERT INTO Settings(
  withoutTime,
  durationGame,
  addingOnMove,
  isMoveBack,
  isThreats,
  isHints
  ) VALUES(?, ?, ?, ?, ?, ?)
  """;
}
