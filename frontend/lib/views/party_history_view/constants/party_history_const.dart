class PartyHistoryConst {
  static String appbarIconName = "assets/images/icons/left_big_arrow_icon.svg";

  static String appbarMainIcon = "assets/images/icons/cancel.svg";

  static String infoPartyIconName = "assets/images/icons/black.svg";

  static String dbCreateScript = """CREATE TABLE History (
  id INTEGER PRIMARY KEY, 
  enemy STRING, 
  date STRING, 
  time STRING,
  durationGame STRING,
  result STRING,
  color STRING
  )""";

  static String dbGetHistoryScript = "SELECT * FROM History";

  static String dbInsertPartyScript = """INSERT INTO History(
  enemy,
  date,
  time,
  durationGame,
  result,
  color
  ) VALUES(?, ?, ?, ?, ?, ?)
  """;
}
