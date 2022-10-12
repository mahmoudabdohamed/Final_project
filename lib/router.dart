
import 'package:finall/presentation/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/cubittt/character_cubit.dart';
import 'constants/string.dart';
import 'data/model/character.dart';
import 'data/repository/character_reposety.dart';
import 'data/web_services/api_character.dart';
import 'presentation/screens/Charctrs_screen.dart';
import 'presentation/screens/characterDetailsScreen.dart';

class AppRouter {
  late CraracterReposetory craracterReposetory;
  late CharacterCubit charactersCubit;

  AppRouter() {
    craracterReposetory = CraracterReposetory(CharacterApi());
    charactersCubit = CharacterCubit(craracterReposetory);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return
         MaterialPageRoute(
            builder: (context) => const LoginScreen());
      case '//':
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (BuildContext contxt) => charactersCubit,
              child: CharactrScreen(),
            ),);
      case characterDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
            builder: (context) =>  CharacterDetailsScreen(character : character));
    }
    return null;
  }
}
//