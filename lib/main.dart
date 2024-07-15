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
  late AuthProvider authProvider;

  @override
  void initState() {
    super.initState();

    final authRepository = AuthRepository(
      AuthRemoteDataSource(),
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
              AuthRemoteDataSource(),
            ),
          ),
        ),
        ChangeNotifierProvider<StoryProvider>(
          create: (context) => StoryProvider(
            StoryRepository(
              StoryRemoteDataSource(),
              AuthRepository(
                AuthRemoteDataSource(),
              ),
            ),
          ),
        ),
        ChangeNotifierProvider<DetailStoryProvider>(
          create: (context) => DetailStoryProvider(
            StoryRepository(
              StoryRemoteDataSource(),
              AuthRepository(
                AuthRemoteDataSource(),
              ),
            ),
          ),
        ),
        ChangeNotifierProvider<CameraProvider>(
          create: (context) => CameraProvider(),
        ),
        ChangeNotifierProvider<UploadProvider>(
          create: (context) => UploadProvider(
            StoryRepository(
              StoryRemoteDataSource(),
              AuthRepository(
                AuthRemoteDataSource(),
              ),
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
