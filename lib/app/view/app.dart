import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heart_disease_mobile_app/bloc/cubit/heart_disease_cubit.dart';
import 'package:heart_disease_mobile_app/counter/counter.dart';
import 'package:heart_disease_mobile_app/l10n/l10n.dart';
import 'package:heart_disease_mobile_app/pages/home_page.dart';
import 'package:heart_disease_mobile_app/pages/splash_page.dart';
import 'package:heart_disease_mobile_app/service/api_service.dart';
// import 'package:flutter_localization/flutter_localization.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const SplashPage(),
    );
  }
}
