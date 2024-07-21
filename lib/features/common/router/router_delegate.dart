import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:submiss_intermediate/features/story/presentation/page/new_map_page.dart';

import '../../../lib.dart';

class MyRouteDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey;
  final AuthRepository authRepository;

  MyRouteDelegate(
    this.authRepository,
  ) : _navigatorKey = GlobalKey<NavigatorState>() {
    _init();
  }

  _init() async {
    isLoggedIn = await authRepository.isLoggedIn();
    notifyListeners();
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  String? selectedStory;
  String? selectedLocation;

  List<Page> historyStack = [];
  bool? isLoggedIn;
  bool isRegister = false;
  bool isAddStory = false;
  bool isStory = false;
  bool isNewMap = false;

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn == null) {
      historyStack = _splashStack;
    } else if (isLoggedIn == true) {
      historyStack = _loggedInStack;
    } else {
      historyStack = _loggedOutStack;
    }
    return Navigator(
      key: navigatorKey,
      pages: historyStack,
      onPopPage: (route, result) {
        final didPop = route.didPop(result);
        if (!didPop) {
          return false;
        }

        if (selectedLocation != null) {
          selectedLocation = null;
        } else if (selectedStory != null) {
          selectedStory = null;
        } else if (isNewMap) {
          isNewMap = false;
        } else if (isAddStory) {
          isAddStory = false;
        } else if (isRegister) {
          isRegister = false;
        }

        notifyListeners();
        return true;
      },
    );
  }

  List<Page> get _splashStack => const [
        MaterialPage(
          key: ValueKey("SplashPage"),
          child: SplashPage(),
        ),
      ];

  List<Page> get _loggedOutStack => [
        MaterialPage(
          key: const ValueKey("LoginPage"),
          child: LoginPage(
            onLogin: () {
              isLoggedIn = true;
              notifyListeners();
            },
            onRegister: () {
              isRegister = true;
              notifyListeners();
            },
          ),
        ),
        if (isRegister == true)
          MaterialPage(
            key: const ValueKey("RegisterPage"),
            child: RegisterPage(
              onRegister: () {
                isRegister = false;
                notifyListeners();
              },
              onLogin: () {
                isRegister = false;
                notifyListeners();
              },
            ),
          ),
      ];

  List<Page> get _loggedInStack => [
        MaterialPage(
          key: const ValueKey("StoryListPage"),
          child: StoryPage(
            onLogout: () {
              isLoggedIn = false;
              notifyListeners();
            },
            onTapped: (String storyId) {
              selectedStory = storyId;
              notifyListeners();
            },
            onAddStory: () {
              isAddStory = true;
              notifyListeners();
            },
          ),
        ),
        if (isAddStory == true)
          MaterialPage(
            key: const ValueKey("addStory"),
            child: StoryAdd(
              onAddMap: () {
                isNewMap = true;
                notifyListeners();
              },
              onAddStory: () {
                isAddStory = false;
                notifyListeners();
              },
            ),
          ),
        if (isNewMap == true)
          MaterialPage(
            key: const ValueKey('NewMapPage'),
            child: NewMapPage(
              onAddMap: () {
                isNewMap = false;
                notifyListeners();
              },
            ),
          ),
        if (selectedStory != null)
          MaterialPage(
            key: const ValueKey('StoryDetailPage'),
            child: StoryDetailPage(
              onTapped: (String location) {
                selectedLocation = location;
                notifyListeners();
              },
              id: selectedStory!,
            ),
          ),
        if (selectedLocation != null)
          MaterialPage(
            key: const ValueKey("MapPage"),
            child: PickerScreen(
              id: selectedLocation!,
            ),
          ),
      ];

  @override
  Future<void> setNewRoutePath(configuration) async {}
}
