import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:flutter/material.dart';

class FeaturedTextFormField extends StatefulWidget {
  final bool autofocus;
  final bool obscureToggle;
  final TextStyle style;
  final String Function(String) validator;
  final InputDecoration decoration;
  final bool obscureText;
  final Color unselectedColor;
  final void Function() focusListener;

  FeaturedTextFormField(
      {@required this.unselectedColor,
      GlobalKey key,
      this.obscureToggle = false,
      this.style,
      this.autofocus = false,
      this.validator,
      this.decoration,
      this.obscureText = false,
      this.focusListener})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => FeaturedTextFormFieldState(
        autofocus: autofocus,
        obscureToggle: obscureToggle,
        validator: validator,
        decoration: decoration,
        obscureText: obscureText,
        unselectedColor: unselectedColor,
        focusListener: focusListener,
        style: style,
      );
}

class FeaturedTextFormFieldState extends State<FeaturedTextFormField> {
  final bool autofocus;
  final bool obscureToggle;
  final TextStyle style;
  final String Function(String) validator;
  final InputDecoration decoration;
  final bool obscureText;
  final Color unselectedColor;
  final void Function() focusListener;

  final textEditingController = TextEditingController();

  final FocusNode _focusNode = new FocusNode();

  bool _obscureToggled;

  FeaturedTextFormFieldState(
      {this.style,
      this.obscureToggle,
      this.unselectedColor,
      this.autofocus,
      this.validator,
      this.decoration,
      this.obscureText,
      this.focusListener})
      : super();

  void _toggleObscuredText() {
    setState(() {
      _obscureToggled = !_obscureToggled;
    });
  }

  @override
  void initState() {
    super.initState();
    _obscureToggled = obscureText;
    _focusNode.addListener(() {
      if (focusListener != null) focusListener();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Color themeLabelColor = Theme.of(context).primaryColor;
    Color decoColor = decoration == null
        ? themeLabelColor
        : decoration.labelStyle == null
            ? themeLabelColor
            : decoration.labelStyle.color == null
                ? themeLabelColor
                : decoration.labelStyle.color;

    IconButton hideShowButton = obscureToggle
        ? IconButton(
            icon: Icon(
              _obscureToggled ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: _toggleObscuredText,
          )
        : null;

    return TextFormField(
      decoration: decoration != null
          ? decoration.copyWith(
              labelStyle: TextStyle(color: _focusNode.hasFocus ? decoColor : unselectedColor),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: unselectedColor)),
              suffixIcon: hideShowButton,
            )
          : InputDecoration(
              labelStyle: TextStyle(color: _focusNode.hasFocus ? decoColor : unselectedColor),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: unselectedColor)),
              suffixIcon: hideShowButton,
            ),
      controller: textEditingController,
      autofocus: autofocus,
      validator: validator,
      obscureText: _obscureToggled,
      focusNode: _focusNode,
      style: style,
    );
  }
}
