part of 'character_cubit.dart';

@immutable
abstract class CharacterState {}

class CharacterInitial extends CharacterState {}
class CharactersLoaded extends CharacterState {
  final List<Character> character;

  CharactersLoaded(this.character);
}

//register
abstract class ReigsterStates {}
class RegisterInitState extends ReigsterStates{}
class RegisterLoadingtState extends ReigsterStates{}
class RegisterSucessState extends ReigsterStates{}
class RegisterErorrState extends ReigsterStates{
  final String message;

  RegisterErorrState({required this.message});

}

//login
abstract class LoginStates {}
class LoginInitState extends LoginStates{}
class LoginLoadingtState extends LoginStates{}
class LoginSucessState extends LoginStates{}
class LoginErorrState extends LoginStates{
  final String message;

  LoginErorrState({required this.message});

}