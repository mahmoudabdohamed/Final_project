import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/model/character.dart';
import '../../data/repository/character_reposety.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CraracterReposetory craracterReposetory;
  List<Character> myCharacters = [];

  CharacterCubit(this.craracterReposetory) : super(CharacterInitial());

  List<Character>? getAllCharacter() {
    craracterReposetory.getAllCharacter().then((cracter) {
      emit(CharactersLoaded(cracter));
      myCharacters = cracter;
    });
    return myCharacters;
  }
}

class RegisterCubit extends Cubit<ReigsterStates> {
  RegisterCubit() : super(RegisterInitState());

  String? name;
  String? email;
  String? phone;
  String? password;

 final formKey =  GlobalKey<FormState>();
  Future<void> register() async {

    if (!formKey.currentState!.validate()) {

    return;
    }
    emit(RegisterLoadingtState());


    formKey.currentState!.save();
   try{
     final response = await Dio()
         .post('https://student.valuxapps.com/api/register', data: {
       "name": name,
       "phone": phone,
       "email": email,
       "password": password
     });
     if(response.data['status']){
       emit(RegisterSucessState());
     }else{
       emit(RegisterErorrState(
         message:response.data['message'],
       ));
     }

   }catch(e){
     emit(RegisterErorrState(
       message:e.toString(),
     ));
   }
  }
}

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitState());


  String? email;

  String? password;

 final formKey =  GlobalKey<FormState>();
  Future<void> login() async {

    if (!formKey.currentState!.validate()) {

    return;
    }
    emit(LoginLoadingtState());


    formKey.currentState!.save();
   try{
     final response = await Dio()
         .post('https://student.valuxapps.com/api/login', data: {

       "email": email,
       "password": password
     });
     if(response.data['status']){
       emit(LoginSucessState());
     }else{
       emit(LoginErorrState(
         message:response.data['message'],
       ));
     }

   }catch(e){
     emit(LoginErorrState(
       message:e.toString(),
     ));
   }
  }
}
