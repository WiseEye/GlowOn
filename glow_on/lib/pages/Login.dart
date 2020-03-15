// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_firebase_ui/flutter_firebase_ui.dart';


// //import 'package:flutter_localizations/flutter_localizations.dart';


// class Login extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Flutter Demo',
//       theme: new ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       // localizationsDelegates: [
//       //   GlobalMaterialLocalizations.delegate,
//       //   GlobalWidgetsLocalizations.delegate,
//       //   FFULocalizations.delegate,
//       // ],
//       supportedLocales: [
//         const Locale('fr', 'FR'),
//         const Locale('en', 'US'),
//         const Locale('de', 'DE'),
//         const Locale('pt', 'BR'),
//         const Locale('es', 'MX'),
//       ],
     
//     );
//   }
// }

// class LoginPage extends StatefulWidget {
//   LoginPage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _LoginPageState createState() => new _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   StreamSubscription<FirebaseUser> _listener;

//   FirebaseUser _currentUser;

//   @override
//   void initState() {
//     super.initState();
//    // _checkCurrentUser();
//   }

//   @override
//   void dispose() {
//     _listener.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_currentUser == null) {
//       return new SignInScreen(
//         title: "",
       
//         providers: [
//           ProvidersTypes.google,
//           ProvidersTypes.facebook,
//           ProvidersTypes.twitter,
//           ProvidersTypes.email
//         ],
//         twitterConsumerKey: "",
//         twitterConsumerSecret: "",
//       );
//     } else {
//       return new HomeScreen(user: _currentUser);
//     }
//   }

//   // void _checkCurrentUser() async {
//   //   _currentUser = await _auth.currentUser();
//   //   _currentUser?.getIdToken(refresh: true);

//   //   _listener = _auth.onAuthStateChanged.listen((FirebaseUser user) {
//   //     setState(() {
//   //       _currentUser = user;
//   //     });
//   //   });
//   // }
// }

// class HomeScreen extends StatelessWidget {
//   final FirebaseUser user;

//   HomeScreen({this.user});

//   @override
//   Widget build(BuildContext context) => new Scaffold(
//       appBar: new AppBar(
//         title: new Text("Bienvenue"),
//         elevation: 4.0,
//       ),
//       body: new Container(
//           padding: const EdgeInsets.all(16.0),
//           decoration: new BoxDecoration(color: Colors.amber),
//           child: new Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               new Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   new Text("Welcome,"),
//                 ],
//               ),
//               new SizedBox(
//                 height: 8.0,
//               ),
//               new Text(user.displayName ?? user.email),
//               new SizedBox(
//                 height: 32.0,
//               ),
//               new RaisedButton(
//                   child: new Text("DECONNEXION"), onPressed: _logout)
//             ],
//           )));

//   void _logout() {
//     //signOutProviders();
//   }
// }