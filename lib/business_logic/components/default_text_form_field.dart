import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class DefaultFormField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;
  final void Function(String?)? onSaved;
  const DefaultFormField(
      {Key? key,
      this.labelText,
      this.hintText,
      this.controller,
      this.validator,
      this.onFieldSubmitted,
      this.isPassword = false,
      this.keyboardType,
        this.prefixIcon, this.onSaved,
      })
      : super(key: key);

  @override
  State<DefaultFormField> createState() => _DefaultFormFieldState();
}

class _DefaultFormFieldState extends State<DefaultFormField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(

        obscureText: widget.isPassword ? _isObscure : false,
        onSaved: widget.onSaved,
        cursorColor: myYellow,
        controller: widget.controller,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        style: const TextStyle(color: myYellow, fontSize: 20),
        keyboardType:widget.keyboardType,
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  splashRadius: 20,
                  icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                      color: myYellow),
                  onPressed: () => setState(() => _isObscure = !_isObscure))
              : null,
          filled: true,
          prefixIcon: widget.prefixIcon!=null? Icon(widget.prefixIcon):null,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          fillColor: myGrey,
          hintText: widget.hintText,
          labelText: widget.labelText,

          labelStyle: const TextStyle(color: myYellow, fontSize: 20),
          hintStyle: const TextStyle(color: myYellow, fontSize: 20),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
