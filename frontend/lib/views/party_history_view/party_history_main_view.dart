import 'package:flutter/material.dart';
import 'package:frontend/exports.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PartyHistoryMainView extends StatefulWidget {
  const PartyHistoryMainView({super.key});

  @override
  State<PartyHistoryMainView> createState() => _PartyHistoryMainViewState();
}

class _PartyHistoryMainViewState extends State<PartyHistoryMainView> {
  bool isLoading = true;
  List<Map> friendParties = [];

  void _getParties() async {
    var databasesPath = await getDatabasesPath();
    String path = "$databasesPath/parties.db";
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(PartyHistoryConst.dbCreateScript);
    });

    List<Map> list =
        await database.rawQuery(PartyHistoryConst.dbGetHistoryScript);

    for (var i = list.length - 1; i >= 0; i--) {
      friendParties.add(list[i]);
    }

    setState(() {
      isLoading = false;
    });

    await database.close();
  }

  @override
  void initState() {
    _getParties();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return isLoading
        ? const LoadingWidget()
        : Scaffold(
            backgroundColor: scheme.background,
            body: SafeArea(
              child: Column(
                children: [
                  AppBarGuide(
                    isMainGuide: true,
                    iconName: PartyHistoryConst.appbarMainIcon,
                    iconColor: scheme.onTertiary,
                    bottomMargin: 32,
                    header: AppLocalizations.of(context).gameHistory,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    child: const Column(
                      children: [
                        InfoPartyBar(
                          height: 80,
                          isComputer: false,
                        ),
                        SizedBox(height: 24),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: friendParties.length,
                      itemBuilder: (context, index) {
                        return OnePartyViewWidget(
                          isComputer: false,
                          partyData: friendParties[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
