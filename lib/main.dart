import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mshop/const/theme_data.dart';
import 'package:mshop/provider/category_provider.dart';
import 'package:mshop/provider/theme_provider.dart';
import 'package:mshop/screens/home_screen.dart';
import 'package:provider/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });

}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key) ;

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp>{
  ThemeProvider themeChangeProvider = ThemeProvider();
  void getCurrentAppTheme() async{
    themeChangeProvider.SetDarkTheme = await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_){
          return themeChangeProvider;
        },),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),


      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child){
          return MaterialApp(
            title: 'mShop',
            theme: Styles.themeData(themeProvider.getDarkTheme, context),
            debugShowCheckedModeBanner: false,
            home: const HomeScreen() ,
          );
        },

      ),
    );
  }

}





