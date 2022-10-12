import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/components/default_filled_button.dart';
import '../../../business_logic/components/default_text_form_field.dart';
import '../../../business_logic/cubittt/character_cubit.dart';
import '../../../constants/colors.dart';
import '../../../constants/string.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (context) =>LoginCubit(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(title: const Text("Sign In")),
          body:BlocListener<LoginCubit, LoginStates>(
    listener: (context, state) {
    if (state is LoginSucessState){
    print("عاااااااااااااااش");
    Navigator.pushNamed(context, '//');
    }else if (state is LoginErorrState){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
    }

    },
    child: Builder(builder: (context){
      final cubit = BlocProvider.of<LoginCubit>(context);

      return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          child: Form(
            key: cubit.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const SizedBox(height: 20),
                DefaultFormField(
                  hintText: "Email",
                  onSaved: (e) {
                    cubit.email=e;
                  },
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) => v.isEmpty ? "Email is Required" : null,
                ),
                const SizedBox(height: 10),
                DefaultFormField(
                  hintText: "Password",
                  isPassword: true,
                  onSaved: (e) {

                    cubit.password=e;
                  },
                  validator: (v) => v.isEmpty ? 'Password required' : null,
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () {},
                    child: const Text(
                      'Forget Password',
                      style: TextStyle(color: myYellow),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                BlocBuilder<LoginCubit, LoginStates>(
                  builder: (context, state) {
                    if (state is LoginLoadingtState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return DefaultFilledButton(
                      title: 'Sign in',
                      onPressed: () {
            cubit.login();
                        //   },
                      },
                    );


                  },
                ),

                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don’t have an account?',
                      style: TextStyle(color: myYellow),
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () =>
                          navigateAndReplace(
                              context, const RegisterScreen()),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: myGrey),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    })
    ),
        ),
      ),
    );
  }
}
