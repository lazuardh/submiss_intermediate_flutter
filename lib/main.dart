import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../lib.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late MyRouteDelegate myRouterDelegate;

  /// todo 6: add variable for create instance
  late AuthProvider authProvider;

  @override
  void initState() {
    super.initState();

    final authRepository = AuthRepository(
      AuthDataSource(),
    );

    authProvider = AuthProvider(authRepository);

    /// todo 7: inject auth to router delegate
    myRouterDelegate = MyRouteDelegate(authRepository);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(
            AuthRepository(
              AuthDataSource(),
            ),
          ),
        )
      ],
      child: MaterialApp(
        title: 'Story Apps',
        debugShowCheckedModeBanner: false,
        theme: StoryApp().of(context),
        home: Router(
          routerDelegate: myRouterDelegate,
          backButtonDispatcher: RootBackButtonDispatcher(),
        ),
      ),
    );
  }
}
