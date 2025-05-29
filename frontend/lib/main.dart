import "dart:io";

import "package:frontend/data_sources/revenuecat_data_source.dart";
import "package:frontend/exports.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:frontend/repositories/in_app_purchase_repository.dart";
import "package:provider/provider.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import "package:purchases_flutter/purchases_flutter.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isIOS) {
    await configureRevenueCat();
  }
  runApp(const MyApp());
}

Future<void> configureRevenueCat() async {
  Purchases.setLogLevel(LogLevel.debug);
  Purchases.configure(
      PurchasesConfiguration('appl_XXuSbFegqvobEdAwmWZnhIlglOX'));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GameModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProVersionProvider(
            repository: InAppPurchaseRepository(
              dataSource: RevenueCatDataSource(),
            ),
          ),
        )
      ],
      child: Builder(builder: (context) {
        return MaterialApp.router(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          theme: Provider.of<ThemeProvider>(context).themeData,
          routerConfig: router,
        );
      }),
    );
  }
}
