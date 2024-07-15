// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import '../../../lib.dart';

// final GoRouter _router = GoRouter(
//   initialLocation: '/',
//   errorPageBuilder: (context, state) {
//     return const MaterialPage(
//       child: ErrorPages(),
//     );
//   },
//   routes: [
//     /* splash */
//     //-------------------------------------------------------
//     GoRoute(
//       path: '/',
//       builder: (context, state) => const SplashPage(),
//     ),
//     //-------------------------------------------------------

//     /* login */
//     //-------------------------------------------------------
//     GoRoute(
//       path: '/login',
//       builder: (context, state) => const LoginPage(),
//     ),
//     //-------------------------------------------------------

//     /* register */
//     //-------------------------------------------------------
//     GoRoute(
//       path: '/register',
//       builder: (context, state) => const RegisterPage(onRegister: ,),
//     ),
//     //-------------------------------------------------------

//     /* story */
//     //-------------------------------------------------------
//     GoRoute(
//       path: '/story',
//       builder: (context, state) => const StoryPage(
//         onLogout: () {},
//       ),
//     ),
//     //-------------------------------------------------------

//     /* detail story */
//     //-------------------------------------------------------
//     GoRoute(
//         path: '/story/:id',
//         builder: (context, state) {
//           final id = state.pathParameters['id'];
//           final params = StoryDetailParams(
//             id: id ?? '',
//           );
//           return StoryDetailPage(
//             params: params,
//           );
//         }),
//     //-------------------------------------------------------

//     /* add story */
//     //-------------------------------------------------------
//     GoRoute(
//       path: '/addStory',
//       builder: (context, state) => const StoryAdd(),
//     ),
//     //-------------------------------------------------------
//   ],
// );
