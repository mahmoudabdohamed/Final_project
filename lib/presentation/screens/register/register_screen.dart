import 'dart:developer';
import 'package:finall/business_logic/components/default_filled_button.dart';
import 'package:finall/business_logic/components/default_text_form_field.dart';
import 'package:finall/constants/colors.dart';
import 'package:finall/constants/string.dart';
import 'package:finall/presentation/screens/Charctrs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/cubittt/character_cubit.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Sign Up")),
        body: BlocListener<RegisterCubit, ReigsterStates>(
          listener: (context, state) {
            if (state is RegisterSucessState){
              print("عاااااااااااااااش");
              Navigator.pushNamed(context, '//');
            }else if (state is RegisterErorrState){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
            }

          },
          child: Builder(builder: (context) {
            final cubit = BlocProvider.of<RegisterCubit>(context);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: SingleChildScrollView(
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25),
                      const SizedBox(height: 20),
                      DefaultFormField(
                        hintText: "Name",
                        onSaved: (e) {

                       cubit.name=e;
                        },
                        validator: (v) {
                          if (v.isEmpty) {
                            return "Name is Required";
                          }
                          return null;
                        },
                      ),
                      DefaultFormField(
                        hintText: "Email",
                        onSaved: (e) {


                      cubit.email=e;
                        },
                        validator: (v) {
                          if (v.isEmpty) {
                            return "Email is Required";
                          }
                          return null;
                        },
                      ),
                      DefaultFormField(
                        hintText: "phone",
                        onSaved: (e) {
                          print(e);

                      cubit.phone=e;
                        },
                        validator: (v) {
                          if (v.isEmpty) {
                            return "phone is Required";
                          }
                          return null;
                        },
                      ),
                      DefaultFormField(
                        hintText: "Password",
                        isPassword: true,
                        onSaved: (e) {
                      cubit.password=e;
                        },
                        validator: (v) {
                          if (v.length < 8) {
                            return "Password is Required";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),
                      BlocBuilder<RegisterCubit, ReigsterStates>(
                        builder: (context, state) {
                          if (state is RegisterLoadingtState) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return DefaultFilledButton(
                            title: 'Sign Up',
                            onPressed: () {
                              cubit.register();
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Have an account?',
                            style: TextStyle(
                              color: myYellow,
                            ),
                          ),
                          const SizedBox(width: 5),
                          InkWell(
                            onTap: () => navigateAndReplace(
                                context, const LoginScreen()),
                            child: const Text(
                              'Sign in',
                              style: TextStyle(color: myGrey),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
