import 'package:finall/constants/colors.dart';
import 'package:finall/router.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await DioHelper.init();
  // await CacheHelper.init();
  runApp(
      MyApp(
        appRouter: AppRouter(),
      ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: myWhite,
        platform: TargetPlatform.iOS,
        primaryColor: myYellow,
        primarySwatch: Colors.orange,
        appBarTheme: const AppBarTheme(
          backgroundColor: myWhite,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: myYellow),
          titleTextStyle: TextStyle(
              color: myWhite, fontSize: 22, fontWeight: FontWeight.w400),
        ),
      ),
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
