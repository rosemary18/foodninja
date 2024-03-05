import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/l10n/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'cores/index.dart';

class App extends StatelessWidget {
  
  const App({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ProviderBlocs(
      child: BlocBuilder<AppStateBloc, AppState>(
        builder: (context, state) => MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          theme: themeApp(context),
          supportedLocales: L10n.all,
          locale: Locale(state.language),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
        )
      )
    );
  }
}
