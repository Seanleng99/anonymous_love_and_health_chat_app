import 'package:anonymous_love_and_health_chat/services/biometric_authentication.dart';
import 'package:flutter/material.dart';
import 'package:anonymous_love_and_health_chat/providers/themes.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Themes>(create: (_) => Themes(ThemeData.dark())),
      ],
      child: Container(
        child: MaterialAppWithTheme(),
      ),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<Themes>(context);
    return MaterialApp(
      title: 'Anonymous Love and Health Chat',
      theme: theme.getTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => BiometricAuthentication(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}